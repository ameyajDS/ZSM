/* ==================================================================================
	Source File		:	setup_system_codes.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Fri Nov 12 14:22 IST 2010
	Module ID		:	ZSM
	Language		:	TRANSACT-SQL
	Last updated	:	16-Nov-2016
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------

	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------
	 JL : 16-Nov-2016
	 	* System code and values added for Fingerprint Scanning.
	 JL : 24-Sep-2013
	 	* System code added for earliest Year of Appointment that can be used in Bulk Registration.
	 AJ/JL : 13-Jun-2012
	 	* System code added for Status that will be allowed for tracking of badges.
     AJ : 29-Jul-2012
		* System code SwdStsArea added for new report Area-wise Sewadars List
	 JL : 13-Jun-2012
	 	* System codes added for Default Values of Country, State, District, Sewa Samiti 
		  and Security Approvers.
     JL : 30-Dec-2011
		* System information code SttsRglSwd has been added that allows the Status of Sewadar
		  than can be allowed in Sewadars Information Screen.
     JL : 28-Dec-2011
		* System information values of 'Trn' and 'Open' added to codes SttsPhtClck and SttsActv.
     JL : 18-Dec-2011
		* System information codes SttsBdgPrn and SttsBdgTrnPrn removed as there is the Status is managed
		  separately for Badge Templates.
     JL : 17-Dec-2011
		* System information name for SttsTrn and SttsOpen corrected.
     JL : 15-Dec-2011
		* System information code SttsTrnsfr dropped, and SttsScrTrf and SttsSysTrf introduced to
		  differentiate between the Transfers allowed from Screen and transfers allowed within System.
     JL : 1o-Dec-2011
		* System Information Codes and Values set for SttsRefUse, SttsApprv, SttsTrnsfr,
		  SttsAttnd, SttsBdgPrn and SttsSwSmry.
     JL : 12-21-Nov-2010
		*   Initial versions
	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- =============================================================================
--	Information Code and Values
-- =============================================================================

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsDefault',	'Status - Default Value');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsDefault',	'Temp'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsOpn',	'Status - Open Sewadar');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsOpn',	'Open'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsTrn',	'Status - Trainee Sewadar');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'Sttstrn',	'Trn'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsActv',	'Status - Active');
																								--			~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsActv',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsActv',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsActv',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsActv',	'UnFt'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsActv',	'Trn'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsActv',	'Open'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsCnstSewa',	'Status - Construction Sewa');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsCnstSewa',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsCnstSewa',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsCnstSewa',	'NI'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsPhtClck',	'Status - Photo Clicking');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPhtClck',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPhtClck',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPhtClck',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPhtClck',	'UnFt'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPhtClck',	'Retd'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPhtClck',	'Trn'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPhtClck',	'Open'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsGenUse',	'Status - General Use');
																								--				~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsGenUse',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsGenUse',	'Temp'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsCntrXfrIn',	'Status - Centre Transfer In');
																								--					~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsCntrXfrIn',	'Temp'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsCntrXfrOut',	'Status - Centre Transfer Out');
																								--					~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsCntrXfrOut',	'Shft'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'TsIntInSec',	'TimeStamp - Interval in Sec');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'TsIntInSec',	5	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'RtrAgeGnts',	'Retirement Age Gents');
																								--				~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'RtrAgeGnts',	70	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'RtrAgeLds',	'Retirement Age Ladies');
																								--				~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'RtrAgeLds',	70	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'BdgExpYr',		'Badge Expiry Year');
																								--				~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'BdgExpYr',		2015	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'BdgLstPrntDys',	'Badge Last Printed Days');
																								--					~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'BdgLstPrntDys',	30	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsRefUse',	'Status - Ref Use');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'Retd'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRefUse',	'Shft'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsApprv',	'Status - Approver Use');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsApprv',	'Perm'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsScrTrf',	'Status - Transfers from Screen');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsScrTrf',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsScrTrf',	'Temp'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsSysTrf',	'Status - Transfers in System ');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSysTrf',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSysTrf',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSysTrf',	'Trn'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSysTrf',	'Open'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsAttnd',	'Status - Attendance Use');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsAttnd',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsAttnd',	'Temp'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsSwSmry',	'Status - Sewa Summary Use');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Retd'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'UnFt'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Left'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsSwSmry',	'Shft'	);

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsRglSwd',	'Status - Sewadars Information');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'Retd'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'UnFt'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'Left'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'Shft'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'InAc'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'WL'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsRglSwd',	'Cncl'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsPrtclr',	'Status - Sewadar Particular');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPrtclr',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPrtclr',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPrtclr',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsPrtclr',	'UnFt'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SwdStsArea',	'Status - For Area Report');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SwdStsArea',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SwdStsArea',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SwdStsArea',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SwdStsArea',	'Retd'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsBdgTrk',	'Status - Badges tracking');
																								--				~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsBdgTrk',	'Perm'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsBdgTrk',	'Temp'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsBdgTrk',	'NI'	);
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	VALUES 	(	'SttsBdgTrk',	'Retd'	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'SttsInaSrc',	'Inactive Source Sewadars');
INSERT INTO		system_information_values	(	system_info_cd, value_varchar	)	
SELECT 'SttsInaSrc', ss.sewadar_status_cd FROM sewadar_status ss
LEFT OUTER JOIN system_information_values siv ON siv.system_info_cd = 'SttsActv' AND siv.system_info_value = ss.sewadar_status_cd
WHERE siv.system_info_cd IS NULL

	--- Following defaults are used for addresses in Sewadars Details Screen
			--- -Indore Centre
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflCntry',	'Default - Country ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'IDflCntry',	1	);		-- India

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflState',	'Default - State ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'IDflState',	123	);		-- Madhya Pradesh

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflDstrct',	'Default - District ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'IDflDstrct',	315	);		-- Indore

			--- -Mumbai Centre
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'MDflCntry',	'Default - Country ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'MDflCntry',	1	);		-- India

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'MDflState',	'Default - State ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'MDflState',	124	);		-- Maharashtra

			--- -Kolkata Centre
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'KDflCntry',	'Default - Country ID');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'KDflCntry',	1	);		-- India

	--- Following defaults are used in Sewadars Information Screen
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflSSApr',	'Default - Sewa Samiti Approver');
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'IDflSecApr',	'Default - Security Approver');

-- ===========================================================================================

	--- Following System Code is used for defining the earliest appointment year that can be allowed in bulk registration.
	--- For example, for Raipur, earliest appointment year is 2008.
INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm, remarks	)
									VALUES 	(	'YOABlkRgst',	'Earliest YOA', 'Earliest Year of Appointment that is allowed in Bulk Registration');
INSERT INTO		system_information_values	(	system_info_cd, value_int	)		VALUES 	(	'YOABlkRgst',	2008	);


-- =============================================================================
--	Information Code and Values for Processing Fingerprint Scanned Data
-- =============================================================================

INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'MinHalfDayMin',	'Minimum minutes for Half Day');
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'MinHalfDayMin',	180	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'MinFullDayMin',	'Minimum minutes for Full Day');
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'MinFullDayMin',	360	);


INSERT INTO		system_information_codes	(	system_info_cd, system_info_nm	)	VALUES 	(	'CutOff2ndHalf',	'Cut-off hours for 2nd Half Day');
																								 --					 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
INSERT INTO		system_information_values	(	system_info_cd, value_int		)	VALUES 	(	'CutOff2ndHalf',	1100	);

-- =============================================================================

-- vim:ts=4 ht=8 sw=4
