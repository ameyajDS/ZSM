
DELETE FROM user_role_granted_actions WHERE package_id	=	'ZSM';
GO

--=============Photo Clicker====================

DECLARE @p_user_role_id AS user_role_id
SET @p_user_role_id = 'ZSM_PC'

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Details',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewa Summary',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar History',5

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Information',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar History',4


GO

--=============Reader====================

DECLARE @p_user_role_id AS user_role_id
SET @p_user_role_id = 'ZSM_RDR'

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Details',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewa Summary',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar History',5

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Information',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_22', 'Cancel',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_23', 'Cancel',1

GO

--=============Attendance Marker====================

DECLARE @p_user_role_id AS user_role_id
SET @p_user_role_id = 'ZSM_ATM'

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Details',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewa Summary',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar History',5

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Information',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_22', 'Cancel',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_23', 'Cancel',1

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Open',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Close',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Process',3

GO

--=============User====================

DECLARE @p_user_role_id AS user_role_id
SET @p_user_role_id = 'ZSM_CU'

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Details',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewa Summary',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar History',5
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Print Details',6

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Information',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Open',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Close',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Process',3

GO

--=============User====================

DECLARE @p_user_role_id AS user_role_id
SET @p_user_role_id = 'ZSM_USR'

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Details',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'History',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Change Status',5
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Add Photo',6
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Change Photo',7
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Delete Photo', 8

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewa Summary',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar History',5
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Print Details',6

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Information',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_22', 'Cancel',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_23', 'Cancel',1

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Open',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Close',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Process',3

GO

--=============Supervisor====================

DECLARE @p_user_role_id AS user_role_id
SET @p_user_role_id = 'ZSM_SUP'

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Details',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'History',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Change Status',5
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Add Photo',6
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Change Photo',7
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Delete Photo', 8

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewa Summary',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar History',5
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Print Details',6

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Information',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_22', 'Cancel',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_23', 'Cancel',1

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Open',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Close',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Process',3

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'SET_05', 'Accept Team',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'SET_03', 'Accept All Teams',1


GO

--=============Administrator====================

DECLARE @p_user_role_id AS user_role_id
SET @p_user_role_id = 'ZSM_ADM'

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Details',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'History',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Change Status',5
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Add Photo',6
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Change Photo',7
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_01', 'Delete Photo', 8

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Information',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_02', 'History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar Particulars',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewa Summary',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Sewadar History',5
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_03', 'Print Details',6

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Details',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar Information',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_04', 'Sewadar History',4

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_22', 'Cancel',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_23', 'Cancel',1

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_12', 'Make Sewa Team',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_12', 'Grant Exemption',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_12', 'Assign Attribute',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_12', 'Remove Attribute',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_12', 'Union',5
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_12', 'Intersect',6
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_12', 'Minus',7

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Open',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Close',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'ACT_19', 'Process',3

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'RPT_01', 'Delete All Reports',1

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'RPT_02', 'Delete All Reports',1

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'RPT_03', 'Delete All Reports',1

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'RPT_04', 'Delete All Reports',1

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'RPT_05', 'Delete All Reports',1

EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'SET_05', 'Accept Team',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'SET_03', 'Accept All Teams',1
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'SET_03', 'Lock Sewa',2
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'SET_03', 'Unlock Sewa',3
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'SET_03', 'Summarise Sewa',4
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'SET_03', 'Archive Sewa',5
EXEC insUserRoleGrantedAction 'ZSM', @p_user_role_id, 'SET_03', 'Deactivate Sewadars',6

GO

