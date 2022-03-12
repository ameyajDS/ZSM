/* ==================================================================================
    Source File		:	setup_nepal_components.sql
    Author(s)		:	Jitendra Loyal
    Started On		:	Mon Aug 18, 2014
    Module ID		:	CDB
    Language		:	TRANSACT-SQL
    Last updated	:	18-Aug-2014
    ==================================================================================
																		   Usage Notes
    ----------------------------------------------------------------------------------
		Set-up data for CDB Address Components of Nepal
    ==================================================================================
								   									  Revision History
    ----------------------------------------------------------------------------------
		18-Aug-2014 : JL
			* Initial version
    ==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO


-- ====================================================================================================
--	Set the Address Component Names for Nepal
-- ====================================================================================================

DECLARE
	@country_id	INT,
	@lvl_cid	INT

SELECT	@country_id	=	country_id
FROM	countries
WHERE	country_nm	=	'Nepal';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country ID for Nepal not found', 16, 1);
	RETURN
END

UPDATE	countries
	SET	level_1_address_component	=	'Zone',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ====================================================================================================
--	Data of the Address Components of Nepal
-- ====================================================================================================

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'MC', 'Mechi', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'J',	'Jhapa', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'I',	'Ilam', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'P',	'Panchthar (Phidim)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'T',	'Taplejung', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'Ks', 'Koshi', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'M',	'Morang (Biratnagar)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'Ss',	'Sunsari (Inaruwa)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'B',	'Bhojpur', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'D',	'Dhankuta', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'T',	'Terhathum (Myanglung)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'SK',	'Sankhuwasabha (Khandbari)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'SM', 'Sagarmatha', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'ST',	'Saptari (Rajbiraj)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'SH',	'Siraha', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'U',	'Udayapur (Triyuga)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'K',	'Khotang (Diktel)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'O',	'Okhaldhunga', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'S',	'Solukhumbu (Salleri)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'J', 'Janakpur', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'DN',	'Dhanusa (Janakpur)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'M',	'Mahottari (Jaleswar)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'SL',	'Sarlahi (Malangwa)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'SD',	'Sindhuli (Kamalamai)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'R',	'Ramechhap (Manthali)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'DL',	'Dolakha (Charikot)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'BM', 'Bagmati', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'B',	'Bhaktapur', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'D',	'Dhading (Dhading Besi)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'KM',	'Kathmandu', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'KC',	'Kavrepalanchok (Dhulikhel)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'L',	'Lalitpur', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'N',	'Nuwakot (Bidur)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'R',	'Rasuwa (Dhunche)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'S',	'Sindhupalchok (Chautara)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'N', 'Narayani', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'B',	'Bara (Kalaiya)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'P',	'Parsa (Birganj)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'R',	'Rautahat (Gaur)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'C',	'Chitwan (Bharatpur)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'M',	'Makwanpur (Hetauda)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'G', 'Gandaki', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'G',	'Gorkha', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'K',	'Kaski (Pokhara)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'L',	'Lamjung (Besisahar)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'S',	'Syangja', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'T',	'Tanahu (Byas)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'M',	'Manang (Chame)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'L', 'Lumbini', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'K',	'Kapilvastu', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'N',	'Nawalparasi (Parasi)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'R',	'Rupandehi (Siddharthanagar)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'A',	'Arghakhanchi (Sandhikharka)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'G',	'Gulmi (Tamghas)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'P',	'Palpa (Tansen)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'D', 'Daulagiri', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'B',	'Baglung', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'MG',	'Myagdi (Beni)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'P',	'Parbat (Kusma)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'MT',	'Mustang (Jomsom)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'R', 'Rapti', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'D',	'Dang Deukhuri (Tribuvannagar)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'P',	'Pyuthan (Pyuthan Khalanga)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'RL',	'Rolpa (Liwang)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'RK',	'Rukum (Musikot)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'S',	'Salyan (Salyan Khalanga)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'KN', 'Karnali', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'D',	'Dolpa (Dunai)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'H',	'Humla (Simikot)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'J',	'Jumla (Jumla Khalanga)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'K',	'Kalikot (Manma)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'M',	'Mugu (Gamgadhi)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'BR', 'Bheri', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'BN',	'Banke (Nepalganj)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'BR',	'Bardiya (Gulariya)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'S',	'Surkhet (Birendranagar)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'D',	'Dailekh (Narayan)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'J',	'Jajarkot (Khalanga)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'ST', 'Seti', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'K',	'Kailali (Dhangadhi)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'A',	'Achham (Mangalsen)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'D',	'Doti (Dipayal)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'BH',	'Bajhang (Chainpur)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'BJ',	'Bajura (Martadi)', @lvl_cid, 1	)

INSERT INTO	level_1_address_components
		(	level_1_address_component_cd, level_1_address_component_nm, country_id, is_authentic	)	VALUES	(	'MK', 'Mahakali', @country_id, 1	)
SET @lvl_cid = SCOPE_IDENTITY();

INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'K',	'Kanchanpur (Bhim Datta)', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'DD',	'Dadeldhura', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'B',	'Baitadi', @lvl_cid, 1	)
INSERT INTO	level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic	)	VALUES	(	'DC',	'Darchula', @lvl_cid, 1	)

