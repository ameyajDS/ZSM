use cdb
go

/*===============================================================================================================
	To drop below tables and additional column; run below script

	alter table sim..items drop column hsn_id
	drop table hsn_gst_rates
	drop function fnValidateHSNEffectiveDates
	drop table hsn_codes
	drop table hsn_code_from_excel
==================================================================================================================*/

-- dump the list of hsn_codes along with their description from government site
-- description is required because one HSN code can have multiple GSTs applied; example: 0202 has Nill as well as 12% GST
-- hsn_id will be stored in items table

		--	Following two tables are to be dropped after MMS goes live, as MMS is not using these tables ---- [
create	table	hsn_codes
(
	hsn_id			int				not null	identity(1,1)	constraint	HsnCodes_PK_HsnId	primary key	nonclustered,
	hsn_code		varchar(8)		not	null,
	hsn_desc		varchar(max)	not null
)
go

-- gst rates to be stored against hsn_id
-- hsn_id can have multiple gst rates (revisions) with different effective dates
-- when a revised gst rate in added for a hsn_id, update previous effective_till_dt one day lesser than current effective_from_dt
create table hsn_gst_rates
(
	hsn_gst_rate_id		int				not null	identity(1,1)	constraint HsnGstRates_PK_HsnGstRateID	primary key	nonclustered,
	hsn_id				int				not null	constraint	HsnGstRate_FK_HsnId	references	hsn_codes,
	hsn_code			varchar(8)		not	null,
	igst				int				not null,
	cgst				decimal(12,1)	not null,
	sgst				decimal(12,1)	not null,
	effective_from_dt	date			not null,
	effective_till_dt	date			not null	constraint	HsnGstRate_DF_EffTillDt	default	'31-Dec-9999',
	display_order		int				not null,	
	gst_cess			decimal(12,1)		null,

	constraint	HsnGstRates_CK1_EffectiveDates
		check	(effective_from_dt	<=	effective_till_dt),

	constraint	HsnGstRates_CK2_Gst
		check	(cgst	=	sgst	and	igst = 2 * cgst),

	constraint	HsnGstRates_UK1_SlabEffectiveDates
		unique	(hsn_id, igst, effective_from_dt, effective_till_dt),

	constraint	HsnGstRates_CK3_ValidateEffectiveDates
		check	(dbo.fnValidateHSNEffectiveDates(hsn_id) = 1),

	constraint	HsnGstRates_UK2_DisplayOrder
		unique	(hsn_id, display_order),
		
	constraint	HsnGstRates_UK3_GstRates
		unique	(hsn_code, igst, cgst, sgst, effective_from_dt, effective_till_dt),
)
go
		--	above two tables are to be dropped after MMS goes live ---- ]



--	====================================================================================================
--	This table is used for validating the GSTIN for a Party for considering the State of Registration
--	====================================================================================================

CREATE	TABLE	gst_states
(
 		--	This column contains the state number as given by GST Council
	gst_state_no			CHAR (2)				NOT	NULL	CONSTRAINT	GSTRates_PK_GSTStateNo
																	PRIMARY	KEY	CLUSTERED,

		--	Corresponding State ID in Level 1 Address Components
	level_1_component_id	address_component_id	NOT NULL	CONSTRAINT	GSTRates_FK_Level1AddressComponentID
																	REFERENCES	level_1_address_components,

		--	This column need to be dropped when we get out of older structure of address components (states, districts, post_offices)
    state_id				state_id				NOT NULL	CONSTRAINT	GSTRates_FK_StateID
																	REFERENCES	states,
	effective_from_dt		DATE					NOT	NULL	CONSTRAINT	GSTRates_DF_EffectiveFromDate
																	DEFAULT	GetDate(),
	effective_till_dt		DATE					NOT	NULL	CONSTRAINT	GSTRates_DF_EffectiveTillDate
																	DEFAULT	'31-Dec-9999',

		CONSTRAINT	GSTRates_UK_GSTStateNo_EffectiveFromDate
			UNIQUE	NONCLUSTERED	(	gst_state_no, effective_from_dt	)
)
GO


--	====================================================================================================
--	Tables for managing the GST Rates along with HSN codes... used in MMS
--	====================================================================================================

/*		We are not keeping the description of HSN codes initially. If need arises, this table will be used

	--	This table maintains the HSN codes, and also for Service Sections of Chapter 99
CREATE	TABLE	gst_hsn_codes
(
 	hsn_cd					TTXT			NOT	NULL	CONSTRAINT	GSTHSNCodes_PK_HSNCode
															PRIMARY	KEY
														CONSTRAINT	,
															CHECK	( 4,6,8)
	hsn_desc				LTXT			NOT	NULL	CONSTRAINT	GSTHSNCodes_UK_HSNDescription
															UNIQUE,
	effective_from_dt		DATE			NOT NULL,
		--	LATER. In case of UPDATE, the corresponding effective till date of the corresponding GST Rate is also changed; DML trigger does it
	effective_till_dt		DATE			NOT NULL,

	txn_ts					TIMESTAMP		NOT NULL,
	audit_log_id			INTEGER			NOT	NULL	CONSTRAINT	GSTHSNCodes_FK_AuditLogID
															REFERENCES	audit_logs,

		CONSTRAINT	GSTHSNCodes_CK_EffectiveFromDate_EffectiveTillDate
			CHECK	(	effective_from_dt	<=	effective_till_dt	)
);

*/
	---	No front-end for this table
	--	Objective is to allow only the permissible rates for IGST, CGST, etc in the front-end; in that sense it is a configuration table

