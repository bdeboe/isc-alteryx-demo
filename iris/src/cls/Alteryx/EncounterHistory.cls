<?xml version="1.0" encoding="UTF-8"?>
<Export generator="IRIS" version="26">
<Class name="Alteryx.EncounterHistory">
<ClassType>view</ClassType>
<CompileAfter>Alteryx.Encounter</CompileAfter>
<DdlAllowed>1</DdlAllowed>
<Owner>UnknownUser</Owner>
<ProcedureBlock>0</ProcedureBlock>
<SqlTableName>EncounterHistory</SqlTableName>
<TimeCreated>65625,37055.541098</TimeCreated>
<ViewQuery> SELECT TOP 5000 Encounter_ID, Patient_Name, Age, Gender, Race, Admit_Date, Discharge_Date, Length_Of_Stay, ICU_Days, Diagnosis_Description, Diagnosis_Group, Procedure_Description, APR_DRG_Description, APR_DRG_Severity, MS_DRG_Description, Chronic_Condition_Count, Operation_Count, Operation_Visits_30, Operation_Visits_6, Department, State, Discharged_To FROM Alteryx.Encounter</ViewQuery>
</Class>
</Export>
