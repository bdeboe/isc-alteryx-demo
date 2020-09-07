<?xml version="1.0" encoding="UTF-8"?>
<Export generator="IRIS" version="26">
<Class name="Alteryx.EncounterCurrent">
<ClassType>view</ClassType>
<CompileAfter>Alteryx.EncounterHistory</CompileAfter>
<DdlAllowed>1</DdlAllowed>
<Owner>UnknownUser</Owner>
<ProcedureBlock>0</ProcedureBlock>
<SqlTableName>EncounterCurrent</SqlTableName>
<TimeCreated>65625,37284.382438</TimeCreated>
<ViewQuery> SELECT TOP 100 
 	Encounter_ID, Patient_Name, Age, Gender, Race, DATEADD('day', CURRENT_DATE, Length_of_Stay) AS Admit_Date, NULL AS Discharge_Date, Length_Of_Stay, ICU_Days, Diagnosis_Description, Diagnosis_Group, Procedure_Description, APR_DRG_Description, APR_DRG_Severity, MS_DRG_Description, Chronic_Condition_Count, Operation_Count, Operation_Visits_30, Operation_Visits_6, Department, State, NULL AS Discharged_To 
 	FROM Alteryx.EncounterHistory</ViewQuery>
</Class>
</Export>
