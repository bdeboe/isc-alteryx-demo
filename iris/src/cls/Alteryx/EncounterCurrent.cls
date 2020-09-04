Class Alteryx.EncounterCurrent [ ClassType = view, CompileAfter = Alteryx.EncounterHistory, DdlAllowed, Owner = {UnknownUser}, Not ProcedureBlock, SqlTableName = EncounterCurrent, ViewQuery = { SELECT TOP 100 
 	Encounter_ID, Patient_Name, Age, Gender, Race, DATEADD('day', CURRENT_DATE, Length_of_Stay) AS Admit_Date, NULL AS Discharge_Date, Length_Of_Stay, ICU_Days, Diagnosis_Description, Diagnosis_Group, Procedure_Description, APR_DRG_Description, APR_DRG_Severity, MS_DRG_Description, Chronic_Condition_Count, Operation_Count, Operation_Visits_30, Operation_Visits_6, Department, ZIP, State, City, NULL AS Discharged_To 
 	FROM Alteryx.EncounterHistory} ]
{

}

