--SELECT * FROM [Mig_View_Center]
Create View [dbo].[Mig_View_Center] As

select NULL as CenterID, OrgNo as CenterCode, OrgName as CenterName, 
NULL as CenterAddress, NULL as CenterNameBng, MemSexID as Organizer, NULL as EmployeeID,
DATENAME(dw, LoanColcDate) as CollectionDay, LoanColcDate as CollectionDate, NULL as GeoLocationID,
SetupDate as OperationStartDate, Status as CenterStatus, NULL as OrgID, NULL as IsActive, NULL as InActiveDate,
 NULL as CreatedUser, NULL as CreateDate
from Loan_Organization
