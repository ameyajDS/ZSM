use CDB
go 

/*
drop table branches
drop table bank_centres
drop table banks
*/

create table bank_centres 
(
	bank_centre_id	int constraint pk_BankCentres_BankCentreId primary key identity(1,1)
	,bank_centre_nm varchar(100)	not null
	,district_id		int				not null		--constraint FK_BankCentres_DistrictOrCity_DistrictId	references districts_or_cities
	,level_2_address_component_id	int				not null	constraint FK_BankCentres_Level2AddressComponentId references level_2_address_components
	,	constraint uk_BankCentres_bankCentreName_DistrictId
			unique(bank_centre_nm,district_id)
)
go

create table banks
(
	bank_id					smallint constraint PK_Banks_bank_id primary key identity(1,1) 
	,bank_nm				varchar(100) 	not null constraint UK_Banks_bankName unique
	,bank_cd				varchar(10)	 	not null constraint UK_Banks_BankCode unique	
	,bank_alias				varchar(100)		null
	,parent_bank_id			SMALLINT			NULL constraint FK_Banks_Parent_BankId
														REFERENCES banks
	,effective_from_dt		date			not null
	,effective_till_dt		date			not null	
	,is_active				as (
								case when (getdate() between effective_from_dt and effective_till_dt) then convert(bit,1)
								else convert(bit,0) end
								)
)
GO

create table branches
(
	branch_id			int								constraint PK_Branches_BranchId			primary key identity(1,1)
	,bank_id			smallint		not null		constraint FK_Branches_Banks_BankId		references banks
	,bank_centre_id		int					null		constraint FK_Branches_BankCentres_bankCentreId	references bank_centres

	,branch_nm			varchar(300)	not null
	-- Same as IFSC code
	,branch_cd			varchar(11)		not null		constraint UK_Branches_BranchCode		unique
														constraint Branches_CK_BranchCD
															check (LEN (branch_cd) = 11)
	,address			varchar(600)	not null				
	,effective_from_dt		date	not null
	,effective_till_dt		date	not null
	,is_active				as (
								case when (getdate() between effective_from_dt and effective_till_dt) then convert(bit,1)
								else convert(bit,0) end
								)
	,branch_full_name	as (branch_nm + ' : ' +branch_cd)
)
go

-- ================== TEMP TABLE FOR IMPORTING EXCEL DATA =================================
-- Excel file downloaded via rbi site (currently can change if other source is found) and data is placed in this table.
-- From here we do insert/update and mark ineffective records in bank & branch.
create table temp_bank_branch
(
	bank_nm				varchar(100)	not null,

	-- Not given in excel file but we derive from ifsc code. For eg. if ifsc is ABHY0065001 then bank code becomes 
	-- ABHY [stripping numerics and just taking alphabets]
	bank_cd				varchar(10)		not null,		--constraint TempBankBranch_U1_BankCode unique,

	-- Same as IFSC code
	branch_cd			varchar(20)		not null		constraint TempBankBranch_U1_BranchCode unique,

	branch_nm			varchar(300)	not null,

	address				varchar(600)	not null,

	excel_row_no		int				not null,

	-- This is used to identify rows which are to be deleted after import operation is over.
	audit_log_id		audit_log_id	not null		constraint TempBankBranch_FK_AuditLogID references audit_logs,
)
go

