
EXEC GrantObjectPermissions 'ZSM', 'ZSM_RDR, ZSM_ATM, ZSM_USR, ZSM_SUP, ZSM_ADM, ZSM_CU, ZSM_PC', 'Yes';
EXEC GrantObjectPermissions 'CDB', 'ZSM_RDR, ZSM_ATM, ZSM_USR, ZSM_SUP, ZSM_ADM, ZSM_CU, ZSM_PC', 'Yes';
EXEC GrantObjectPermissions 'ZSM_Photos', 'ZSM_RDR, ZSM_ATM, ZSM_USR, ZSM_SUP, ZSM_ADM, ZSM_CU, ZSM_PC', 'Yes';
EXEC GrantObjectPermissions 'SYSADMIN', 'ZSM_SUP, ZSM_ADM', 'Yes';

EXEC GrantTableTypePermissions 'ZSM', 'ZSM_RDR, ZSM_ATM, ZSM_USR, ZSM_SUP, ZSM_ADM, ZSM_CU, ZSM_PC';
GO


-- ====================================================================================================
--	NOTE. These are temporary permissions until we figure out the root cause for this.
-- ====================================================================================================
USE ZSM_Photos
GO

GRANT	SELECT, INSERT, UPDATE, DELETE	ON	sewadars_photos	TO	ZSM_ADM, ZSM_SUP, ZSM_USR, ZSM_PC;
GO

USE ZSM
GO

GRANT	DELETE							ON	sewadars_remarks		TO	ZSM_ADM, ZSM_SUP, ZSM_USR, ZSM_PC;
GO

GRANT	INSERT							ON	generic_sewadar_lists_sewadars	TO	ZSM_ADM, ZSM_SUP;
GO

GRANT	INSERT, DELETE					ON	mgr_tmp_sewadars	TO	ZSM_ADM, ZSM_SUP, ZSM_USR;
GO

--	GRANT	INSERT, DELETE					ON	tmp_bulk_registrations	TO	ZSM_ADM, ZSM_SUP, ZSM_USR;
--	GO

USE SysAdmin
GO
