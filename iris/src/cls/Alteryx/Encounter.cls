<?xml version="1.0" encoding="UTF-8"?>
<Export generator="IRIS" version="26">
<Class name="Alteryx.Encounter">
<Super>%Persistent</Super>
<TimeCreated>65625,37055.541098</TimeCreated>

<Parameter name="USEEXTENTSET">
<Default>1</Default>
</Parameter>

<Property name="EncounterID">
<Type>%Integer</Type>
<SqlColumnNumber>2</SqlColumnNumber>
<SqlFieldName>Encounter_ID</SqlFieldName>
</Property>

<Property name="PatientName">
<Type>%String</Type>
<SqlColumnNumber>3</SqlColumnNumber>
<SqlFieldName>Patient_Name</SqlFieldName>
<Parameter name="MAXLEN" value="200"/>
</Property>

<Property name="Age">
<Type>%Integer</Type>
<SqlColumnNumber>4</SqlColumnNumber>
</Property>

<Property name="Gender">
<Type>%String</Type>
<SqlColumnNumber>5</SqlColumnNumber>
<Parameter name="MAXLEN" value="10"/>
</Property>

<Property name="Race">
<Type>%String</Type>
<SqlColumnNumber>6</SqlColumnNumber>
<Parameter name="MAXLEN" value="10"/>
</Property>

<Property name="AdmitDate">
<Type>%PosixTime</Type>
<SqlColumnNumber>7</SqlColumnNumber>
<SqlFieldName>Admit_Date</SqlFieldName>
</Property>

<Property name="DischargeDate">
<Type>%PosixTime</Type>
<SqlColumnNumber>8</SqlColumnNumber>
<SqlFieldName>Discharge_Date</SqlFieldName>
</Property>

<Property name="LengthOfStay">
<Type>%Integer</Type>
<SqlColumnNumber>9</SqlColumnNumber>
<SqlFieldName>Length_Of_Stay</SqlFieldName>
</Property>

<Property name="ICUDays">
<Type>%Integer</Type>
<SqlColumnNumber>10</SqlColumnNumber>
<SqlFieldName>ICU_Days</SqlFieldName>
</Property>

<Property name="DiagnosisDescription">
<Type>%String</Type>
<SqlColumnNumber>11</SqlColumnNumber>
<SqlFieldName>Diagnosis_Description</SqlFieldName>
<Parameter name="MAXLEN" value="200"/>
</Property>

<Property name="DiagnosisGroup">
<Type>%String</Type>
<SqlColumnNumber>12</SqlColumnNumber>
<SqlFieldName>Diagnosis_Group</SqlFieldName>
<Parameter name="MAXLEN" value="200"/>
</Property>

<Property name="ProcedureDescription">
<Type>%String</Type>
<SqlColumnNumber>13</SqlColumnNumber>
<SqlFieldName>Procedure_Description</SqlFieldName>
<Parameter name="MAXLEN" value="200"/>
</Property>

<Property name="APRDRGDescription">
<Type>%String</Type>
<SqlColumnNumber>14</SqlColumnNumber>
<SqlFieldName>APR_DRG_Description</SqlFieldName>
<Parameter name="MAXLEN" value="200"/>
</Property>

<Property name="APRDRGSeverity">
<Type>%Integer</Type>
<SqlColumnNumber>15</SqlColumnNumber>
<SqlFieldName>APR_DRG_Severity</SqlFieldName>
</Property>

<Property name="MSDRGDescription">
<Type>%String</Type>
<SqlColumnNumber>16</SqlColumnNumber>
<SqlFieldName>MS_DRG_Description</SqlFieldName>
<Parameter name="MAXLEN" value="200"/>
</Property>

<Property name="ChronicConditionCount">
<Type>%Integer</Type>
<SqlColumnNumber>17</SqlColumnNumber>
<SqlFieldName>Chronic_Condition_Count</SqlFieldName>
</Property>

<Property name="OperationCount">
<Type>%Integer</Type>
<SqlColumnNumber>18</SqlColumnNumber>
<SqlFieldName>Operation_Count</SqlFieldName>
</Property>

<Property name="OperationVisits30">
<Type>%Integer</Type>
<SqlColumnNumber>19</SqlColumnNumber>
<SqlFieldName>Operation_Visits_30</SqlFieldName>
</Property>

<Property name="OperationVisits6">
<Type>%Integer</Type>
<SqlColumnNumber>20</SqlColumnNumber>
<SqlFieldName>Operation_Visits_6</SqlFieldName>
</Property>

<Property name="Department">
<Type>%String</Type>
<SqlColumnNumber>21</SqlColumnNumber>
<Parameter name="MAXLEN" value="100"/>
</Property>

<Property name="ZIP">
<Type>%String</Type>
<SqlColumnNumber>22</SqlColumnNumber>
<Parameter name="MAXLEN" value="10"/>
</Property>

<Property name="State">
<Type>%String</Type>
<SqlColumnNumber>23</SqlColumnNumber>
<Parameter name="MAXLEN" value="10"/>
</Property>

<Property name="City">
<Type>%String</Type>
<SqlColumnNumber>24</SqlColumnNumber>
<Parameter name="MAXLEN" value="100"/>
</Property>

<Property name="DischargedTo">
<Type>%String</Type>
<SqlColumnNumber>25</SqlColumnNumber>
<SqlFieldName>Discharged_To</SqlFieldName>
<Parameter name="MAXLEN" value="100"/>
</Property>

<Storage name="Default">
<Type>%Storage.Persistent</Type>
<DataLocation>^EXPo.DK0y.1</DataLocation>
<DefaultData>EncounterDefaultData</DefaultData>
<IdLocation>^EXPo.DK0y.1</IdLocation>
<IndexLocation>^EXPo.DK0y.I</IndexLocation>
<StreamLocation>^EXPo.DK0y.S</StreamLocation>
<ExtentLocation>^EXPo.DK0y</ExtentLocation>
<Data name="EncounterDefaultData">
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
<Index name="IDKEY">
<Location>^EXPo.DK0y.1</Location>
</Index>
</Storage>
</Class>
</Export>
