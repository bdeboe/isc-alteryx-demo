<?xml version="1.0" encoding="UTF-8"?>
<Export generator="IRIS" version="26">
<Class name="Alteryx.Util.SQL">
<TimeCreated>65629,57467.568246</TimeCreated>

<Method name="LoadPMMLFile">
<ClassMethod>1</ClassMethod>
<FormalSpec>pPMMLFile:%String="C:\temp\AlteryxTempModel.pmml",pClassName:%String="Alteryx.TestModel"</FormalSpec>
<ReturnType>%String</ReturnType>
<SqlName>LoadPMMLFile</SqlName>
<SqlProc>1</SqlProc>
<Implementation><![CDATA[
	set tSC = ##class(%DeepSee.PMML.Utils).CreateFromFile(pPMMLFile, pClassName,1,1,0)
	quit $s($$$ISOK(tSC):"PMML saved successfully", 1:$system.Status.GetErrorText(tSC))
]]></Implementation>
</Method>
</Class>
</Export>
