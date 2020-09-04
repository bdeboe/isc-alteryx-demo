Class Alteryx.EncounterHistory Extends %Persistent
{

Parameter USEEXTENTSET = 1;

Property EncounterID As %Integer [ SqlColumnNumber = 2, SqlFieldName = Encounter_ID ];

Property PatientName As %String(MAXLEN = 200) [ SqlColumnNumber = 3, SqlFieldName = Patient_Name ];

Property Age As %Integer [ SqlColumnNumber = 4 ];

Property Gender As %String(MAXLEN = 10) [ SqlColumnNumber = 5 ];

Property Race As %String(MAXLEN = 10) [ SqlColumnNumber = 6 ];

Property AdmitDate As %PosixTime [ SqlColumnNumber = 7, SqlFieldName = Admit_Date ];

Property DischargeDate As %PosixTime [ SqlColumnNumber = 8, SqlFieldName = Discharge_Date ];

Property LengthOfStay As %Integer [ SqlColumnNumber = 9, SqlFieldName = Length_Of_Stay ];

Property ICUDays As %Integer [ SqlColumnNumber = 10, SqlFieldName = ICU_Days ];

Property DiagnosisDescription As %String(MAXLEN = 200) [ SqlColumnNumber = 11, SqlFieldName = Diagnosis_Description ];

Property DiagnosisGroup As %String(MAXLEN = 200) [ SqlColumnNumber = 12, SqlFieldName = Diagnosis_Group ];

Property ProcedureDescription As %String(MAXLEN = 200) [ SqlColumnNumber = 13, SqlFieldName = Procedure_Description ];

Property APRDRGDescription As %String(MAXLEN = 200) [ SqlColumnNumber = 14, SqlFieldName = APR_DRG_Description ];

Property APRDRGSeverity As %Integer [ SqlColumnNumber = 15, SqlFieldName = APR_DRG_Severity ];

Property MSDRGDescription As %String(MAXLEN = 200) [ SqlColumnNumber = 16, SqlFieldName = MS_DRG_Description ];

Property ChronicConditionCount As %Integer [ SqlColumnNumber = 17, SqlFieldName = Chronic_Condition_Count ];

Property OperationCount As %Integer [ SqlColumnNumber = 18, SqlFieldName = Operation_Count ];

Property OperationVisits30 As %Integer [ SqlColumnNumber = 19, SqlFieldName = Operation_Visits_30 ];

Property OperationVisits6 As %Integer [ SqlColumnNumber = 20, SqlFieldName = Operation_Visits_6 ];

Property Department As %String(MAXLEN = 100) [ SqlColumnNumber = 21 ];

Property ZIP As %String(MAXLEN = 10) [ SqlColumnNumber = 22 ];

Property State As %String(MAXLEN = 10) [ SqlColumnNumber = 23 ];

Property City As %String(MAXLEN = 100) [ SqlColumnNumber = 24 ];

Property DischargedTo As %String(MAXLEN = 100) [ SqlColumnNumber = 25, SqlFieldName = Discharged_To ];

Storage Default
{
<Data name="EncounterHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>EncounterID</Value>
</Value>
<Value name="3">
<Value>PatientNumber</Value>
</Value>
<Value name="4">
<Value>Age</Value>
</Value>
<Value name="5">
<Value>Gender</Value>
</Value>
<Value name="6">
<Value>Race</Value>
</Value>
<Value name="7">
<Value>AdmitDate</Value>
</Value>
<Value name="8">
<Value>DischargeDate</Value>
</Value>
<Value name="9">
<Value>LengthOfStay</Value>
</Value>
<Value name="10">
<Value>ICUDays</Value>
</Value>
<Value name="11">
<Value>DiagnosisDescription</Value>
</Value>
<Value name="12">
<Value>DiagnosisGroup</Value>
</Value>
<Value name="13">
<Value>ProcedureDescription</Value>
</Value>
<Value name="14">
<Value>APRDRGDescription</Value>
</Value>
<Value name="15">
<Value>APRDRGSeverity</Value>
</Value>
<Value name="16">
<Value>MSDRGDescription</Value>
</Value>
<Value name="17">
<Value>ChronicConditionCount</Value>
</Value>
<Value name="18">
<Value>OperationCount</Value>
</Value>
<Value name="19">
<Value>OperationVisits30</Value>
</Value>
<Value name="20">
<Value>OperationVisits6</Value>
</Value>
<Value name="21">
<Value>Department</Value>
</Value>
<Value name="22">
<Value>ZIP</Value>
</Value>
<Value name="23">
<Value>State</Value>
</Value>
<Value name="24">
<Value>City</Value>
</Value>
<Value name="25">
<Value>DischargedTo</Value>
</Value>
<Value name="26">
<Value>PatientName</Value>
</Value>
</Data>
<DataLocation>^EXPo.DK0y.1</DataLocation>
<DefaultData>EncounterHistoryDefaultData</DefaultData>
<ExtentLocation>^EXPo.DK0y</ExtentLocation>
<IdLocation>^EXPo.DK0y.1</IdLocation>
<Index name="IDKEY">
<Location>^EXPo.DK0y.1</Location>
</Index>
<IndexLocation>^EXPo.DK0y.I</IndexLocation>
<StreamLocation>^EXPo.DK0y.S</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}

