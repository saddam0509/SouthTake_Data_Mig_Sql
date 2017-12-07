--select * from Mig_View_LoanTrx 
Create view Mig_View_LoanTrx as
--Loan Trx Details--
SELECT        
lli.LoanSlNo as LoanTrxID,
ltd.ColcDate AS TrxDate,
Null as LoanSummaryID,
NULL as OfficeID,
lli.OrgMemNo AS MemberID,
lli.ProductNo AS ProductID,
lli.OrgNo AS CenterID,
NUll as MemberCategoryID,
NUll as LoanTerm,
ltd.ColcDate AS InstallmentDate,
lli.PrincipalAmt AS PrincipalLoan, 
ltd.TotColc,
lli.PrincipalDue AS LoanDue,
ltd.PrinColc as LoanPaid, 
NULL as IntCharge,
lli.InterestDue as IntDue,
ltd.IntrColc as IntPaid,
0.0 as Advance,
NULL as DueRecovery,
NULL as TrxType,
lli.NoOfInstl AS InstallmentNo,
NULL as EmployeeID,
1 as InvestorID,
NULL AS OrgID,
1 as IsActive,
NULL as InActiveDate,
lli.Operator as CreateUser,
GETDATE() as CreateDate


--lli.DisbDate,
--lli.Duration, 
--lli.InstlAmt, 
--lli.PrincipalDue, 
--lli.InterestDue,  
--ltd.PrinColc, 
--lli.TotalDue
--ltd.ColcSlNo, 
--ltd.IntrColc

FROM Loan_LoanInfo AS lli

INNER JOIN Loan_LoanTranDetail0111 AS ltd ON lli.LoanNo = ltd.LoanNo 
AND lli.ProjectCode = ltd.ProjectCode

--and lli.ProductNo='003'
--and lli.OrgMemNo='000014'
--and lli.OrgNo='2062'


--SELECT * FROM Loan_LoanInfo