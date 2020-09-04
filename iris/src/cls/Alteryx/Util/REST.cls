Include %PMML

Class Alteryx.Util.REST Extends %CSP.REST
{

Parameter CHARSET = "utf-8";

Parameter CONTENTTYPE = "application/json";

Parameter HandleCorsRequest = 1;

/// 
/// The UrlMap determines how a Url should map to a HTTP Method and a Target ClassMethod
/// indicated by the 'Call' attribute. The call attribute is either the name of a method
/// or the name of a class and method seperated by a ':'. Parameters within the URL preceded
/// by a ':' will be extracted from the supplied URL and passed as arguments to the named method.
/// 
/// In this Route Entry GET requests to /class/namespace/classname will call the GetClass method
/// 
/// <Route Url="/class/:namespace/:classname" Method="GET" Call="GetClass"/>
/// 
/// In this Route Entry both POST and PUT requests are dispatched to the same method.
/// Called methods can determine which verb was used by checking the value of %request.Method
/// 
/// <Route Url="/class/:namespace/:classname" Method="POST,PUT" Call="PutClass"/>
/// 
/// To influence CORS processing you can set the "Cors" attribute to "true", default is "false".
/// The "Cors" attribute is only considered if the PARAMETER 'HandleCorsRequest' is left unspecified.
/// 
/// <Route Url="/class/:namespace/:classname" Method="GET" Call="GetClass" Cors="true"/>
/// 
/// Use a Map Entry to forward ALL requests made to a particular URL prefix. For example. If your 
/// web application has a base url route of /api/v1 and you want to map all requests to 
/// /api/v1/docserver (including all sub-urls) enter a Map entry like this:
/// 
/// <Map Prefix="/docserver" Forward="%Api.v1.DocServer"/>
/// 
/// This will result in calls such as /api/v1/docserver/class/Samples/Sample.Person being redirected
/// to the class %API.v1.DocServer ( another subclass of %CSP.REST )for futher processing. 
XData UrlMap [ XMLNamespace = "http://www.intersystems.com/urlmap" ]
{
<Routes>
<Route Url="/patients" Method="GET" Call="GetPatients" Cors="true"/>
<Route Url="/risk" Method="POST" Call="GetRisk" />
<Route Url="/risk/:model" Method="POST" Call="GetRisk" />
</Routes>
}

ClassMethod GetPatients() As %Status
{
	set tSC = $$$OK, tJSON = { "patients" : [] }
	try {
		
		set tStatement = ##class(%SQL.Statement).%New()
		set tSC = tStatement.%Prepare("SELECT TOP 50 * FROM Alteryx.EncounterCurrent")
		quit:$$$ISERR(tSC)
		
		#dim tResultSet as %SQL.StatementResult
		set tResultSet = tStatement.%Execute()
		while tResultSet.%Next() {
			set tRow = {}
			for i=1:1:tStatement.%Metadata.columnCount {
				do tRow.%Set(tStatement.%Metadata.columns.GetAt(i).colName, tResultSet.%GetData(i))
			}
			do tJSON.patients.%Push(tRow)
		}
		
	} catch (ex) {
		set tSC = ex.AsStatus()
	}
	quit ..%ProcessResult(tSC, $g(tJSON))
}

ClassMethod GetRisk(pModel As %String = "Alteryx.PMMLModel") As %Status
{
	set tSC = $$$OK, tJSON = { }
	try {
		
		set tJSON."_input" = %request.Content
		
		#dim tModel as %DeepSee.PMML.Model.AbstractModel
		set tSC = $classmethod(pModel,"%GetModelInstance", .tModelName, .tModel)
		quit:$$$ISERR(tSC)
		
		set tIterator = %request.Content.%GetIterator() 
		while tIterator.%GetNext(.k, .v) {
			set:v'="" tModelInput(k) = v
		}
		
		#dim tModelOutput as %DeepSee.PMML.ModelOutput
		set tSC = tModel.%ExecuteModel(.tModelInput, .tModelOutput)
		quit:$$$ISERR(tSC)
		
		// pArray(fieldName) = $lb(feature, targetFieldName, displayName)
		do tModelOutput.%GetFields(.tArray)
		set tField = ""
		for {
			set tField = $order(tArray(tField),1,tFieldInfo)
			quit:tField=""
			
			do tJSON.%Set(tField,{
				"feature": ($lg(tFieldInfo,1)),
				"targetFieldName": ($lg(tFieldInfo,2)),
				"displayName": ($lg(tFieldInfo,3)),
				"value": ($property(tModelOutput,$$$PROPERTYNAME(tField)))
			})
		}
		
		
	} catch (ex) {
		set tSC = ex.AsStatus()
	}
	quit ..%ProcessResult(tSC, $g(tJSON))
}

ClassMethod RegisterSelf() [ CodeMode = objectgenerator, Internal, Private ]
{
	set tSC = $$$OK, tCreated=0, tCurrentNS = $$$LOWER($namespace)
	try {
		set tWebAppName = "/csp/"_tCurrentNS_"/REST/"
		set tProperties("NameSpace") = tCurrentNS
		set tProperties("DispatchClass") = "Alteryx.Util.REST"
		set tProperties("AutheEnabled") = $$$AutheUnauthenticated
		
		zn "%SYS"
		if '##class(Security.Applications).Exists(tWebAppName) {
			set tSC = ##class(Security.Applications).Create(tWebAppName, .tProperties)
			quit:$$$ISERR(tSC)
			set tCreated=1
		}
		
	} catch (ex) {
		set tSC = ex.AsStatus()
	}
	zn tCurrentNS
	
	if $$$ISERR(tSC) {
		write !,"WARNING: unable to create web application due to the following error:",!
		do $system.OBJ.DisplayError(tSC)
	} elseif (tCreated) {
		write !,"Web Application '"_tWebAppName_"' created successfully",!
	}
	quit $$$OK
}

ClassMethod OnPreDispatch(pUrl As %String, pMethod As %String, ByRef pContinue As %Boolean) As %Status
{
	Set tSC = $$$OK
	try {
		
		// Set the return type according to the Accept type in the request. Default is application/json.
		if ('..AcceptsContentType(..#CONTENTTYPEJSON)) {
			set tSC = ..ReportHttpStatusCode(..#HTTP406NOTACCEPTABLE), pContinue=0
			quit 
        } else {   
			// This always returns json
			set %response.ContentType=..#CONTENTTYPEJSON
        }
        
        
        // read request object into %DynamicObject format
		if (pMethod'="POST") || (%request.Content="") {
			set %request.Content = {}
		} else {
			if '$isobject(%request.Content) {
				set tContent = %request.Content
			} else {
				set tContent = ""
				while '%request.Content.AtEnd {
					set tContent = tContent_%request.Content.Read()
				}
			}
			if (tContent="") {
				set %request.Content = {}
			} else {
				set tContent = $zconvert(tContent, "I", "UTF8")
				set %request.Content = ##class(%Library.DynamicObject).%FromJSON(tContent)
			}
		}
        
	} catch ex {
		set tSC = ex.AsStatus()
	}
	quit ..%ErrorHandler(tSC, .pContinue)
}

ClassMethod %ErrorHandler(pSC As %Status, ByRef pContinue As %Boolean) As %Status
{
	set pContinue = $$$ISOK(pSC)
	quit:pContinue $$$OK
	quit ..%ProcessResult(pSC)
}

ClassMethod %ProcessResult(pSC As %Status, pResult As %DynamicObject = "") As %Status [ Internal ]
{
	set tSC = $$$OK
	if $$$ISERR(pSC) {
		set tSC = ..StatusToJSON(pSC, .tJSON)
		if $isobject(tJSON) {
			set pResult = tJSON
		} else {
			set pResult = { "errors": [ { "error": "Unknown error parsing status code" } ] }
		}
	} elseif '$isobject(pResult) {
		set pResult = {}
	}
	write pResult.%ToJSON()
	quit tSC
}

}

