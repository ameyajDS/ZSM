/* ==================================================================================
    Source File		:	3_setup_data.sql
    Author(s)		:	JP
    Started On		:	07 Aug 2007
    Version		:	1.00
    Last updated	:	
    Module ID		:	AMS (Assets Management System)
    Language		:	TRANSACT-SQL
    Reviewed By		:
    Reviewed On		:
    ==================================================================================
									 Revision History
    ----------------------------------------------------------------------------------
		Setup data for Centres, Zones and Asset Types
    ===================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS OFF
GO

INSERT INTO	centre_types (centre_type) VALUES ('Centre')
INSERT INTO	centre_types (centre_type) VALUES ('Sub-Centre')
INSERT INTO	centre_types (centre_type) VALUES ('Point')

INSERT INTO	zones (zone_nm) VALUES ('North Zone') 
INSERT INTO	zones (zone_nm) VALUES ('South Zone') 
INSERT INTO	zones (zone_nm) VALUES ('East Zone') 
INSERT INTO	zones (zone_nm) VALUES ('West Zone')
INSERT INTO	zones (zone_nm) VALUES ('Central Zone')

INSERT INTO	asset_types (asset_type_cd, asset_type_nm) VALUES ('VCH', 'Vehicles')
INSERT INTO	asset_types (asset_type_cd, asset_type_nm) VALUES ('FNF', 'Furniture & Fixtures')
INSERT INTO	asset_types (asset_type_cd, asset_type_nm) VALUES ('ACCF', 'Air-Conditioners / Coolers / Fridge')
INSERT INTO	asset_types (asset_type_cd, asset_type_nm) VALUES ('OEC', 'Office Equipment & Computers')
INSERT INTO	asset_types (asset_type_cd, asset_type_nm) VALUES ('AVE', 'Audio Video Equipment')
INSERT INTO	asset_types (asset_type_cd, asset_type_nm) VALUES ('EA', 'Electrical Assets')
INSERT INTO	asset_types (asset_type_cd, asset_type_nm) VALUES ('MIKI', 'Misc. Items - Kitchen Items')

