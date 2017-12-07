--SELECT * from Mig_View_Member
--order BY MemberID asc
	

CREATE view Mig_View_Member as
SELECT     
distinct 
m.MemberNo as MemberID, 
lom.OrgMemNo as MemberCode,
NULL as OfficeID,
lom.OrgNo as CenterID,
NULL as GroupID,
m.MemberName as FirstName,
NULL as MiddleName,
NULL as LastName,
NULL as AddressLine1,
NULL as AddressLine2,
NULL as CountryID,
NULL as DivisionCode,
mfi.District as DistrictCode,
mfi.Upozilla as UpozillaCode,
mfi.[Union] as UnionCode,
mfi.Village as VillageCode,
md.Information as RefereeName,
m.DateOfBirth as BirthDate,
NULL as PlaceOfBirth,
NULL as Cityzenship,
m.SetupDate AS memJoinDte,
Case 
	When m.MemSexID=2 then  'Female'
	When m.MemSexID=1 then 'Male'
	Else m.MemSexID END as Gender,
m.NationalIDNo AS NationalID,
NULL as Location,
NULL as HomeType,
NULL as GroupType,
NULL as Education,
mfi.Nooffamilymembe as FamilyMember,
NULL as TotalWealth,
NULL as EconomicActivity,
NULL as FatherName,
NULL as MotherName,
 m.SpouseName as CoApplicantName,
NULL as MemberCategoryID,
m.Status  as  MemberStatus,
NULL as ReleaseDate,
NULL as City,
NULL as StateName,
NULL as ZipCode,
NULL as CountryOfIssue,
NULL as NIDComments,
NULL as IDType,
NULL as Race,
NULL as Ethnicity,
NULL as Email,
 m.ContractNo as PhoneNo,
 NULL as nsAccountNo,
 NULL as MemberType,
 NULL as MemCategory,
mfi.MaritalStatus as MaritalStatus,
NULL as MemberImg,
NULL as ThumbImg,
NULL as PwdStatus,
NULL as OrgID,
NULL as OldMemberCode,
1 as IsActive,
null as InActiveDate,
m.Operator as CreateUser,
getDate() as CreateDate


FROM Loan_Member AS m 
    INNER JOIN Loan_OrgMember as lom ON m.MemberNo = lom.MemberNo 
	INNER JOIN Loan_Organization lo ON lom.OrgNo = lo.OrgNo 
	Left JOIN  Loan_MemFamilyinformation as mfi on mfi.MemberNo=m.MemberNo
	Left Join (Select * From Loan_MemberDetail Where CaptionID=1) md ON m.MemberNo=md.MemberNo
	
	


	