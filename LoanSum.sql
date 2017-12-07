--select * from Mig_View_LoanSum 
create view Mig_View_LoanSum as
--Loan_Sum---
(
SELECT 
	Null as LoanSummaryID,
	Null as OfficeID,
	lli.OrgMemNo as MemberID,
	lli.ProjectCode as ProductID,
	lli.OrgNo as CenterID,
	Null as MemberCategoryID,
	Null as LoanTerm,
	Null as PurposeID,
	lli.LoanNo  as LoanNo, 
	lli.PrincipalAmt as PrincipalLoan,
	Null as ApproveDate,
	lli.DisbDate as DisburseDate,
	lli.Duration as Duration,
	Null as LoanRepaid,
	Null as IntCharge,
	Null as IntPaid,
	Null as LoanInstallment,
	NUll as IntInstallment,
	0.06 as InterestRate,
	Null as InstallmentStartDate,
	Null as InstallmentNo,
	Null as DropInstallment,
	Null as Holidays,
	Null as InstallmentDate,
	Null as TransType,
	Null as ContinuousDrop,
	Null as LoanStatus,
	NULL as Balance,
	Null as Advance,
	NUll as DueRecovery,
	Null as LoanCloseDate,
	Null as OverdueDate,
	Null as EmployeeId,
	Null as InvestorID,
	Null as ExcessPay,
	Null as CurLoan,
	Null as PreLoan,
	Null as CumLoanDue,
	NUll as WriteOffLoan,
	Null as WriteOffInterest,
	Null as Posted,
	Null as OrgID,
	Null as IsActive,
	Null as InActiveDate,
	Null as CreateUser,
	Null as CreateDate,
	Null as BankName,
	Null as ChequeNo,
	Null as IsApproved,
	Null as CoApplicantName,
	Null as Guarantor,
	Null as MemberPassBookRegisterID,
	Null as ChequeIssueDate,
	Null as CumIntDue,
	Null as ApprovedAmount,
	Null as PartialAmount,
	Null as FinalDisbursement,
	Null as DisbursementType,
	Null as PartialIntCharge,
	Null as PartialIntPaid,
	Null as FirstInstallmentDate


FROM Loan_LoanInfo as lli
LEFT JOIN Loan_LoanHistory as lhis ON lli.ProjectCode = lhis.ProjectCode AND lli.LoanNo = lhis.LoanNo 
INNER JOIN Loan_Scheme AS lschm ON lli.SchmCode = lschm.SchmCode
LEFT JOIN Loan_Sector AS lsec ON lschm.SectorCode = lsec.SectorCode
)


