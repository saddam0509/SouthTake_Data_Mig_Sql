--select * from Mig_View_SavTrx
create view Mig_View_SavTrx as 
--View_Savings_trx--

--SELECT  

--Null as SavingTrxID,
--Null as SavingSummaryID,
--Null as OfficeID,
--Null as MemberID ,
--Null as ProductID,
--Null as CenterID,
--Null as NoOfAccount,
--st.TranDate as TransactionDate,
--Null as  Deposit,
--Null as Withdrawal,
--Null as Balance,
--Null as Penalty,
--Null as TransType,
--0.06 as MonthlyInterest,
--Null as PresenceInd,
--NUll as TransferDeposit,
--Null as TransferWithdrawal,
--Null as EmployeeID,
--Null as MemberCategoryID,
--Null as OrgID,
--Null as IsActive,
--Null as InActiveDate,
--Null as CreateUser,
--getDate() as CreateDate  

------------------------------------------------
select
	Null as SavingTrxID,
	Null as SavingSummaryID,
	Null as OfficeID,
	SavTrx.OrgMemNo as MemberID,
	SavTrx.ProjectCode as ProductID, 
	SavTrx.OrgNo as CenterID,
	0 as NoOfAccount,
	SavTrx.TranDate as TrxDate,
	SavTrx.Deposit as Deposit, 
	SavTrx.Witdrawl as Witdrawl,
	SavTrx.SavBalan as Balance,
	0.00 as Penalty,
	SavTrx.TransType as TransType,
	0.06 as MonthlyInterest,
	Null as PresenceInd,
	SavTrx.TransferDeposit as TransferDeposit,
	SavTrx.TransferWithdrawal as TransferWithdrawal,
	Null as EmployeeID,
	Null as MemberCategoryID,
	Null as OrgID,
	Null as IsActive,
	Null as InActiveDate,
	Null as CreateUser,
	getDate() as CreateDate  
 
 from
	(
	
	select OrgNo, OrgMemNo, ProjectCode, TranDate, TranAmount as Deposit, 0 as Witdrawl ,SavBalan, 0 as CumInterest, 0 as TransferWithdrawal, 0 as TransferDeposit, 10 TransType
	from Loan_SavTran0111
	where EntryInitial='SC'
		
		union all

	select OrgNo, OrgMemNo, ProjectCode, TranDate, 0 as Deposit, TranAmount as Witdrawl , SavBalan, 0 as CumInterest, 0 AS TransferWithdrawal, 0 as TransferDeposit, 10 TransType
	from Loan_SavTran0111
	where EntryInitial in('SD','FS')


	union all

	select OrgNo, OrgMemNo, ProjectCode, TranDate, 0 as Deposit, 0 as Witdrawl , SavBalan, TranAmount as CumInterest, 0 as TransferWithdrawal, 0 as TransferDeposit, 10 TransType
	from Loan_SavTran0111
	where EntryInitial='YI'


	union all

	select OrgNo, OrgMemNo, ProjectCode, TranDate, 0 as Deposit, TranAmount as Witdrawl , SavBalan, 0 as CumInterest, 0 as TransferWithdrawal, 0 as TransferDeposit, 21 TransType
	from Loan_SavTran0111
	where EntryInitial='ST'

	union all

	select OrgNo, OrgMemNo, ProjectCode, TranDate, TranAmount as Deposit, 0 as Witdrawl , SavBalan, 0 as CumInterest, 0 as TransferWithdrawal, 0 as TransferDeposit, 21 TransType
	from Loan_SavTran0111
	where EntryInitial='TS'

	) as SavTrx

	--SELECT *
	----EntryInitial,sum(TranAmount)
	-- from Loan_SavTran0104
	-- Where 
	-- OrgMemNo='000025'
	-- --EntryInitial= 'FS'
	-- And ProjectCode='002'
	--AND OrgNo='1001'
	--ORDER by TranDate
	------and EntryInitial='ST'
	