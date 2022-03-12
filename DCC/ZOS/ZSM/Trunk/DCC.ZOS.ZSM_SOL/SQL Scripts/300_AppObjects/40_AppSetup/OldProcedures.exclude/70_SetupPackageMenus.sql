
DELETE FROM user_role_menus WHERE user_role_id IN ('ZSM_RDR', 'ZSM_ATM', 'ZSM_USR', 'ZSM_SUP', 'ZSM_ADM', 'ZSM_CU', 'ZSM_PC');
DELETE FROM user_role_menu_groups WHERE user_role_id IN ('ZSM_RDR', 'ZSM_ATM', 'ZSM_USR', 'ZSM_SUP', 'ZSM_ADM', 'ZSM_CU', 'ZSM_PC');
GO

--=============Photo Clicker====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_PC';

---INSERTING DETAILS IN Table:dbo.user_role_menu_groups

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ACT', NULL, 'Activities', 'Activities', 'A', 1 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'PHT', NULL, 'Photo Clicking', 'Photo Clicking', 'P', 3 )

-- INSERTING DETAILS INTO MENU GROUP :  Activities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars', 'Sewadars', 'S', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Details', 'Sewadars Details', 'D', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Information', 'Sewadars Information', 'I', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Trainee Sewadars', 'Trainee Sewadars', 'T', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Open Sewadars', 'Open Sewadars', 'O', 6 )

-- INSERTING DETAILS INTO MENU GROUP :  Photo Clicking;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'PHT', 'Sewadars Photo-clicking', 'Sewadars Photo-clicking', 'E', 1)

GO

--=============Reader====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_RDR';

---INSERTING DETAILS IN Table:dbo.user_role_menu_groups

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ACT', NULL, 'Activities', 'Activities', 'A', 1 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'RPT', NULL, 'Reports', 'Reports', 'R', 2 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'PHT', NULL, 'Photo Clicking', 'Photo Clicking', 'P', 3 )

-- INSERTING DETAILS INTO MENU GROUP :  Activities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars', 'Sewadars', 'S', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Details', 'Sewadars Details', 'D', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Information', 'Sewadars Information', 'I', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Particulars', 'Sewadars Particulars', 'P', 4 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Trainee Sewadars', 'Trainee Sewadars', 'T', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Open Sewadars', 'Open Sewadars', 'O', 6 )

-- INSERTING DETAILS INTO MENU GROUP :  Reports;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Sewadars Reports', 'Sewadars Reports', 'S', 1)

-- INSERTING DETAILS INTO MENU GROUP :  Photo Clicking;

--INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
--VALUES  ( @p_user_role_id, 'PHT', 'Existing Sewadars Photo-clicking', 'Existing Sewadars Photo-clicking', 'E', 1)
--
--INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
--VALUES  ( @p_user_role_id, 'PHT', 'New Sewadars Photo-clicking', 'New Sewadars Photo-clicking', 'N', 2)

GO

--=============Attendance Marker====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_ATM';

---INSERTING DETAILS IN Table:dbo.user_role_menu_groups

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ACT', NULL, 'Activities', 'Activities', 'A', 1 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ATT', NULL, 'Attendance', 'Attendance', 'T', 2 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'RPT', NULL, 'Reports', 'Reports', 'R', 3 )

-- INSERTING DETAILS INTO MENU GROUP :  Activities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars', 'Sewadars', 'S', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Details', 'Sewadars Details', 'D', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Information', 'Sewadars Information', 'I', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Particulars', 'Sewadars Particulars', 'P', 4 )
INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Trainee Sewadars', 'Trainee Sewadars', 'T', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Open Sewadars', 'Open Sewadars', 'O', 6 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scan Badges', 'Scan Badges', 'G', 7 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scanning Control Dates', 'Scanning Control Dates', 'A', 8 )

-- INSERTING DETAILS INTO MENU GROUP :  Attendance;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Day-wise)', 'Team - Daily (Day-wise) ', 'D', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Sewadar-wise)', 'Team - Daily (Sewadar-wise)', 'T', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Daily Presences', 'Arbitrary - Daily Presences', 'P', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Shift Presences', 'Arbitrary - Shift Presences', 'S', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Summarised Exemptions', 'Arbitrary - Summarised Exemptions', 'E', 5)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Summary (Sewadar-wise)', 'Summary (Sewadar-wise)', 'M', 6)

-- INSERTING DETAILS INTO MENU GROUP :  Reports;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Sewadars Reports', 'Sewadars Reports', 'S', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Attendance Reports', 'Attendance Reports', 'A', 2)

GO
--====================Centre User=======================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_CU';

---INSERTING DETAILS IN Table:dbo.user_role_menu_groups

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ACT', NULL, 'Activities', 'Activities', 'A', 1 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ATT', NULL, 'Attendance', 'Attendance', 'T', 2 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'RPT', NULL, 'Reports', 'Reports', 'R', 3 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ENT', NULL, 'Entities', 'Entities', 'E', 4 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'SETUP', NULL, 'Setup', 'Setup', 'S', 5 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'PHT', NULL, 'Photo Clicking', 'Photo Clicking', 'P', 6 )

-- INSERTING DETAILS INTO MENU GROUP :  Activities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars', 'Sewadars', 'S', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Details', 'Sewadars Details', 'D', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Information', 'Sewadars Information', 'I', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Particulars', 'Sewadars Particulars', 'P', 4 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Trainee Sewadars', 'Trainee Sewadars', 'T', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Open Sewadars', 'Open Sewadars', 'O', 6 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Department Transfers', 'Department Transfers', 'X', 7 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Badge Printing', 'Badge Printing', 'B', 8 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Roster Printing', 'Roster Printing', 'R', 9 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scan Badges', 'Scan Badges', 'G', 10 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scanning Control Dates', 'Scanning Control Dates', 'A', 11 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Lists', 'Sewadars Lists', 'L', 12 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars in Sewadar List', 'Sewadars in Sewadar List', 'W', 13 )

-- INSERTING DETAILS INTO MENU GROUP :  Attendance;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Day-wise)', 'Team - Daily (Day-wise) ', 'D', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Sewadar-wise)', 'Team - Daily (Sewadar-wise)', 'T', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Daily Presences', 'Arbitrary - Daily Presences', 'P', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Shift Presences', 'Arbitrary - Shift Presences', 'S', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Summarised Exemptions', 'Arbitrary - Summarised Exemptions', 'E', 5)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Summary (Sewadar-wise)', 'Summary (Sewadar-wise)', 'M', 6)

-- INSERTING DETAILS INTO MENU GROUP :  Reports;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Sewadars Reports', 'Sewadars Reports', 'S', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Attendance Reports', 'Attendance Reports', 'A', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Miscellaneous Reports', 'Miscellaneous Reports', 'M', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Discrepancy Reports', 'Discrepancy Reports', 'D', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Photo Reports', 'Photo Reports', 'P', 5)
 
-- INSERTING DETAILS INTO MENU GROUP :  Entities;

--INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
--VALUES  ( @p_user_role_id, 'ENT', 'Colours', 'Colours', 'L', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Countries', 'Countries', 'C', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Departments', 'Departments', 'D', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Districts', 'Districts', 'I', 4 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Post Offices / Cities', 'Post Offices / Cities', 'P', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Qualifications', 'Qualifications', 'Q', 6 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Qualification Subjects', 'Qualification Subjects', 'U', 7 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Relations', 'Relations', 'R', 8 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Satsang Centres', 'Satsang Centres', 'T', 9 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Sewa Exemptions', 'Sewa Exemptions', 'E', 10 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Skills', 'Skills', 'K', 11 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'States', 'States', 'S', 12 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Weekly Sewa Locations', 'Weekly Sewa Locations', 'W', 13 )


-- INSERTING DETAILS INTO MENU GROUP :  Setup;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Credit Specifications', 'Credit Specifications', 'N', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Generic Attributes', 'Generic Attributes', 'G', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Scanning Jobs', 'Scanning Jobs', 'J', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Scanning Jobs Validations', 'Scanning Jobs Validations', 'V', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Sewas', 'Sewas', 'S', 5)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Sewa Teams', 'Sewa Teams', 'T', 6)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'System Information Codes', 'System Information Codes', 'I', 7)

GO

--=============User====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_USR';

---INSERTING DETAILS IN Table:dbo.user_role_menu_groups

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ACT', NULL, 'Activities', 'Activities', 'A', 1 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ATT', NULL, 'Attendance', 'Attendance', 'T', 2 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'RPT', NULL, 'Reports', 'Reports', 'R', 3 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ENT', NULL, 'Entities', 'Entities', 'E', 4 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'SETUP', NULL, 'Setup', 'Setup', 'S', 5 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'PHT', NULL, 'Photo Clicking', 'Photo Clicking', 'P', 6 )

-- INSERTING DETAILS INTO MENU GROUP :  Activities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars', 'Sewadars', 'S', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Details', 'Sewadars Details', 'D', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Information', 'Sewadars Information', 'I', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Particulars', 'Sewadars Particulars', 'P', 4 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Trainee Sewadars', 'Trainee Sewadars', 'T', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Open Sewadars', 'Open Sewadars', 'O', 6 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Department Transfers', 'Department Transfers', 'X', 7 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Badge Printing', 'Badge Printing', 'B', 8 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scan Badges', 'Scan Badges', 'G', 9 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scanning Control Dates', 'Scanning Control Dates', 'A', 10 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Lists', 'Sewadars Lists', 'L', 11 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars in Sewadar List', 'Sewadars in Sewadar List', 'W', 12 )


-- INSERTING DETAILS INTO MENU GROUP :  Attendance;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Day-wise)', 'Team - Daily (Day-wise) ', 'D', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Sewadar-wise)', 'Team - Daily (Sewadar-wise)', 'T', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Daily Presences', 'Arbitrary - Daily Presences', 'P', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Shift Presences', 'Arbitrary - Shift Presences', 'S', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Summarised Exemptions', 'Arbitrary - Summarised Exemptions', 'E', 5)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Summary (Sewadar-wise)', 'Summary (Sewadar-wise)', 'M', 6)

-- INSERTING DETAILS INTO MENU GROUP :  Reports;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Sewadars Reports', 'Sewadars Reports', 'S', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Attendance Reports', 'Attendance Reports', 'A', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Miscellaneous Reports', 'Miscellaneous Reports', 'M', 3)

-- INSERTING DETAILS INTO MENU GROUP :  Entities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Colours', 'Colours', 'L', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Countries', 'Countries', 'C', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Departments', 'Departments', 'D', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Districts', 'Districts', 'I', 4 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Post Offices / Cities', 'Post Offices / Cities', 'P', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Qualifications', 'Qualifications', 'Q', 6 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Qualification Subjects', 'Qualification Subjects', 'U', 7 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Relations', 'Relations', 'R', 8 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Satsang Centres', 'Satsang Centres', 'T', 9 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Sewa Exemptions', 'Sewa Exemptions', 'E', 10 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Skills', 'Skills', 'K', 11 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'States', 'States', 'S', 12 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Weekly Sewa Locations', 'Weekly Sewa Locations', 'W', 13 )

-- INSERTING DETAILS INTO MENU GROUP :  Setup;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Badge Templates', 'Badge Templates', 'B', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Credit Specifications', 'Credit Specifications', 'N', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Generic Attributes', 'Generic Attributes', 'G', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Scanning Jobs', 'Scanning Jobs', 'J', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Scanning Jobs Validations', 'Scanning Jobs Validations', 'V', 5)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Sewas', 'Sewas', 'S', 6)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Sewa Teams', 'Sewa Teams', 'T', 7)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'System Information Codes', 'System Information Codes', 'I', 8)

-- INSERTING DETAILS INTO MENU GROUP :  Photo Clicking;

--INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
--VALUES  ( @p_user_role_id, 'PHT', 'Existing Sewadars Photo-clicking', 'Existing Sewadars Photo-clicking', 'E', 1)
--
--INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
--VALUES  ( @p_user_role_id, 'PHT', 'New Sewadars Photo-clicking', 'New Sewadars Photo-clicking', 'N', 2)

GO

--=============Supervisor====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_SUP';

---INSERTING DETAILS IN Table:dbo.user_role_menu_groups

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ACT', NULL, 'Activities', 'Activities', 'A', 1 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ATT', NULL, 'Attendance', 'Attendance', 'T', 2 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'RPT', NULL, 'Reports', 'Reports', 'R', 3 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ENT', NULL, 'Entities', 'Entities', 'E', 4 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'SETUP', NULL, 'Setup', 'Setup', 'S', 5 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'PHT', NULL, 'Photo Clicking', 'Photo Clicking', 'P', 6 )

-- INSERTING DETAILS INTO MENU GROUP :  Activities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars', 'Sewadars', 'S', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Details', 'Sewadars Details', 'D', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Information', 'Sewadars Information', 'I', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Particulars', 'Sewadars Particulars', 'P', 4 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Trainee Sewadars', 'Trainee Sewadars', 'T', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Open Sewadars', 'Open Sewadars', 'O', 6 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Department Transfers', 'Department Transfers', 'X', 7 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Satsang Centre Transfers', 'Satsang Centre Transfers', 'C', 8 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Badge Printing', 'Badge Printing', 'B', 9 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Roster Printing', 'Roster Printing', 'R', 10 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Import Existing Sewadars Photos', 'Import Existing Sewadars Photos', 'E', 11 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Import New Sewadars Photos', 'Import New Sewadars Photos', 'N', 12 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scan Badges', 'Scan Badges', 'G', 13 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scanning Control Dates', 'Scanning Control Dates', 'A', 14 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Lists', 'Sewadars Lists', 'L', 15 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars in Sewadar List', 'Sewadars in Sewadar List', 'W', 16 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Merge Sewadars', 'Merge Sewadars', 'M', 17 )

-- INSERTING DETAILS INTO MENU GROUP :  Attendance;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Day-wise)', 'Team - Daily (Day-wise) ', 'D', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Sewadar-wise)', 'Team - Daily (Sewadar-wise)', 'T', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Daily Presences', 'Arbitrary - Daily Presences', 'P', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Shift Presences', 'Arbitrary - Shift Presences', 'S', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Summarised Exemptions', 'Arbitrary - Summarised Exemptions', 'E', 5)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Summary (Sewadar-wise)', 'Summary (Sewadar-wise)', 'M', 6)

-- INSERTING DETAILS INTO MENU GROUP :  Reports;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Sewadars Reports', 'Sewadars Reports', 'S', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Attendance Reports', 'Attendance Reports', 'A', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Miscellaneous Reports', 'Miscellaneous Reports', 'M', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Discrepancy Reports', 'Discrepancy Reports', 'D', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Photo Reports', 'Photo Reports', 'P', 5)
 
-- INSERTING DETAILS INTO MENU GROUP :  Entities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Colours', 'Colours', 'L', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Countries', 'Countries', 'C', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Departments', 'Departments', 'D', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Districts', 'Districts', 'I', 4 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Post Offices / Cities', 'Post Offices / Cities', 'P', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Qualifications', 'Qualifications', 'Q', 6 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Qualification Subjects', 'Qualification Subjects', 'U', 7 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Relations', 'Relations', 'R', 8 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Satsang Centres', 'Satsang Centres', 'T', 9 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Sewa Exemptions', 'Sewa Exemptions', 'E', 10 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Skills', 'Skills', 'K', 11 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'States', 'States', 'S', 12 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Weekly Sewa Locations', 'Weekly Sewa Locations', 'W', 13 )

-- INSERTING DETAILS INTO MENU GROUP :  Setup;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Badge Templates', 'Badge Templates', 'B', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Credit Specifications', 'Credit Specifications', 'N', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Generic Attributes', 'Generic Attributes', 'G', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Scanning Jobs', 'Scanning Jobs', 'J', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Scanning Jobs Validations', 'Scanning Jobs Validations', 'V', 5)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Sewas', 'Sewas', 'S', 6)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Sewa Teams', 'Sewa Teams', 'T', 7)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'System Information Codes', 'System Information Codes', 'I', 8)

-- INSERTING DETAILS INTO MENU GROUP :  Photo Clicking;

--INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
--VALUES  ( @p_user_role_id, 'PHT', 'Existing Sewadars Photo-clicking', 'Existing Sewadars Photo-clicking', 'E', 1)
--
--INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
--VALUES  ( @p_user_role_id, 'PHT', 'New Sewadars Photo-clicking', 'New Sewadars Photo-clicking', 'N', 2)

GO

--=============Administrator====================

DECLARE @p_user_role_id AS user_role_id;
SET @p_user_role_id = 'ZSM_ADM';

---INSERTING DETAILS IN Table:dbo.user_role_menu_groups

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ACT', NULL, 'Activities', 'Activities', 'A', 1 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ATT', NULL, 'Attendance', 'Attendance', 'T', 2 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'RPT', NULL, 'Reports', 'Reports', 'R', 3 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'ENT', NULL, 'Entities', 'Entities', 'E', 4 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'SETUP', NULL, 'Setup', 'Setup', 'S', 5 )

INSERT  INTO user_role_menu_groups ( user_role_id, menu_group_id, parent_menu_group_id, menu_group_nm, menu_group_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id,  'PHT', NULL, 'Photo Clicking', 'Photo Clicking', 'P', 6 )

-- INSERTING DETAILS INTO MENU GROUP :  Activities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars', 'Sewadars', 'S', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Details', 'Sewadars Details', 'D', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Information', 'Sewadars Information', 'I', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Particulars', 'Sewadars Particulars', 'P', 4 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Trainee Sewadars', 'Trainee Sewadars', 'T', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Open Sewadars', 'Open Sewadars', 'O', 6 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Department Transfers', 'Department Transfers', 'X', 7 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Satsang Centre Transfers', 'Satsang Centre Transfers', 'C', 8 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Badge Printing', 'Badge Printing', 'B', 9 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Roster Printing', 'Roster Printing', 'R', 10 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Import Existing Sewadars Photos', 'Import Existing Sewadars Photos', 'E', 11 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Import New Sewadars Photos', 'Import New Sewadars Photos', 'N', 12 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scan Badges', 'Scan Badges', 'G', 13 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Scanning Control Dates', 'Scanning Control Dates', 'A', 14 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars Lists', 'Sewadars Lists', 'L', 15 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Sewadars in Sewadar List', 'Sewadars in Sewadar List', 'W', 16 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ACT', 'Merge Sewadars', 'Merge Sewadars', 'M', 17 )

-- INSERTING DETAILS INTO MENU GROUP :  Attendance;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Day-wise)', 'Team - Daily (Day-wise) ', 'D', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Team - Daily (Sewadar-wise)', 'Team - Daily (Sewadar-wise)', 'T', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Daily Presences', 'Arbitrary - Daily Presences', 'P', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Shift Presences', 'Arbitrary - Shift Presences', 'S', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Arbitrary - Summarised Exemptions', 'Arbitrary - Summarised Exemptions', 'E', 5)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ATT', 'Summary (Sewadar-wise)', 'Summary (Sewadar-wise)', 'M', 6)

-- INSERTING DETAILS INTO MENU GROUP :  Reports;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Sewadars Reports', 'Sewadars Reports', 'S', 1)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Attendance Reports', 'Attendance Reports', 'A', 2)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Miscellaneous Reports', 'Miscellaneous Reports', 'M', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Discrepancy Reports', 'Discrepancy Reports', 'D', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'RPT', 'Photo Reports', 'Photo Reports', 'P', 5)
 
-- INSERTING DETAILS INTO MENU GROUP :  Entities;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Colours', 'Colours', 'L', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Countries', 'Countries', 'C', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Departments', 'Departments', 'D', 3 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Districts', 'Districts', 'I', 4 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Post Offices / Cities', 'Post Offices / Cities', 'P', 5 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Qualifications', 'Qualifications', 'Q', 6 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Qualification Subjects', 'Qualification Subjects', 'U', 7 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Relations', 'Relations', 'R', 8 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Satsang Centres', 'Satsang Centres', 'T', 9 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Sewa Exemptions', 'Sewa Exemptions', 'E', 10 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Skills', 'Skills', 'K', 11 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'States', 'States', 'S', 12 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'ENT', 'Weekly Sewa Locations', 'Weekly Sewa Locations', 'W', 13 )

-- INSERTING DETAILS INTO MENU GROUP :  Setup;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Badge Templates', 'Badge Templates', 'B', 1 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Credit Specifications', 'Credit Specifications', 'N', 2 )

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Generic Attributes', 'Generic Attributes', 'G', 3)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Scanning Jobs', 'Scanning Jobs', 'J', 4)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Scanning Jobs Validations', 'Scanning Jobs Validations', 'V', 5)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Sewas', 'Sewas', 'S', 6)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'Sewa Teams', 'Sewa Teams', 'T', 7)

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'SETUP', 'System Information Codes', 'System Information Codes', 'I', 8)

-- INSERTING DETAILS INTO MENU GROUP :  Photo Clicking;

INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
VALUES  ( @p_user_role_id, 'PHT', 'Sewadars Photo-clicking', 'Existing Sewadars Photo-clicking', 'E', 1)
--
--INSERT  INTO user_role_menus ( user_role_id, menu_group_id, menu_nm, menu_dsc, ctrl_Key_accessor, display_order )
--VALUES  ( @p_user_role_id, 'PHT', 'New Sewadars Photo-clicking', 'New Sewadars Photo-clicking', 'N', 2)

GO

