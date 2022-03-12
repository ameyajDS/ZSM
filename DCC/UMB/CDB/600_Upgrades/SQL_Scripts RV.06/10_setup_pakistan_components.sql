/* ==================================================================================
    Source File		:	setup_pakistan_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	Tue Sep 18 12:46 2014
	Module ID		:	CDB
	Last updated	:	Sep 16, 2014
	==================================================================================
																		   Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Pakistan are set-up
	==================================================================================
																	  Revision History
	----------------------------------------------------------------------------------

	==================================================================================*/

SET QUOTED_IDENTIFIER OFF
GO

SET ANSI_NULLS ON
GO

-- ======================================================================

DECLARE
	@country_id		INT;

-- ======================================================================
SELECT	@country_id	=	country_id
FROM	countries
WHERE	country_nm	=	'Pakistan';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Pakistan not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

/*	 These statements should NOT be uncommented; and should be used with extreme caution
DELETE	l3
FROM	level_3_address_components	l3
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_id	=	l3.level_2_address_component_id
			)
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);

DELETE	l2
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


DELETE	level_1_address_components
WHERE	country_id	=	@country_id;
*/

-- ======================================================================

DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50) PRIMARY KEY, level_1_cd varchar (5) UNIqUE);

INSERT INTO @tbl VALUES ( 'Azad Kashmir', 'AK')
INSERT INTO @tbl VALUES ( 'Balochistan', 'BA')
INSERT INTO @tbl VALUES ( 'Federally Administered Tribal Areas', 'TA')
INSERT INTO @tbl VALUES ( 'Gilgit-Baltistan', 'GB')
INSERT INTO @tbl VALUES ( 'Islamabad', 'IS')
INSERT INTO @tbl VALUES ( 'Khyber-Pakhtunkhwa', 'KP')
INSERT INTO @tbl VALUES ( 'Punjab', 'PB')
INSERT INTO @tbl VALUES ( 'Sindh', 'SD')

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	@country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl2	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Bhimber', 'BH')
INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Kotli', 'K')
INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Mirpur', 'MP')
INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Muzaffarabad', 'MZ')
INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Hattian', 'HT')
INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Neelam', 'N')
INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Poonch', 'P')
INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Haveli', 'HV')
INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Bagh', 'B')
INSERT INTO @tbl2 VALUES ( 'Azad Kashmir', 'Sudhnoti', 'S')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Awaran', 'A')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Barkhan', 'B')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Chagai', 'C')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Dera Bugti', 'D')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Gwadar', 'G')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Harnai', 'H')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Jaffarabad', 'JB')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Jhall Magsi', 'JM')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Kachi (Bolan)', 'KC')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Kalat', 'KL')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Kech (Turbat)', 'KH')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Kharan', 'KR')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Khuzdar', 'KZ')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Killa Abdullah', 'KA')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Killa Saifullah', 'KS')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Kohlu', 'KO')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Lasbela', 'LB')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Lehri', 'LH')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Loralai', 'LL')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Mastung', 'MT')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Musakhail', 'MK')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Nasirabad', 'NB')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Nushki', 'NS')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Panjgur', 'PG')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Pishin', 'PS')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Quetta', 'Q')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Sheerani', 'SH')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Sibi', 'SB')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Sohbatpur', 'SP')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Washuk', 'W')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Zhob', 'ZH')
INSERT INTO @tbl2 VALUES ( 'Balochistan', 'Ziarat', 'ZR')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'Bajaur Agency', 'B')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'Khyber Agency', 'KH')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'Kurram Agency', 'KR')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'Mohmand Agency', 'M')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'North Waziristan Agency', 'NW')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'Orakzai Agency', 'O')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'South Waziristan Agency', 'SW')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'FR Bannu', 'FRB')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'FR Dera Ismail Khan', 'FRD')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'FR Kohat', 'FRK')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'FR Lakki Marwat', 'FRL')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'FR Peshawar', 'FRP')
INSERT INTO @tbl2 VALUES ( 'Federally Administered Tribal Areas', 'FR Tank', 'FRT')
INSERT INTO @tbl2 VALUES ( 'Gilgit-Baltistan', 'Ghanche', 'G')
INSERT INTO @tbl2 VALUES ( 'Gilgit-Baltistan', 'Skardu', 'S')
INSERT INTO @tbl2 VALUES ( 'Gilgit-Baltistan', 'Astore', 'A')
INSERT INTO @tbl2 VALUES ( 'Gilgit-Baltistan', 'Diamer', 'D')
INSERT INTO @tbl2 VALUES ( 'Gilgit-Baltistan', 'Ghizer', 'GZ')
INSERT INTO @tbl2 VALUES ( 'Gilgit-Baltistan', 'Gilgit', 'GG')
INSERT INTO @tbl2 VALUES ( 'Gilgit-Baltistan', 'Hunza-Nagar', 'H')
INSERT INTO @tbl2 VALUES ( 'Gilgit-Baltistan', 'Kharmang', 'K')
INSERT INTO @tbl2 VALUES ( 'Islamabad', 'Islamabad', 'I')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Abbottabad', 'A')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Bannu', 'BN')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Battagram', 'BT')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Buner', 'BR')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Charsadda', 'CS')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Chitral', 'CT')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Dera Ismail Khan', 'D')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Hangu', 'HG')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Haripur', 'HP')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Karak', 'KR')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Kohat', 'KH')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Kohistan', 'KS')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Lakki Marwat', 'LM')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Lower Dir', 'LD')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Malakand', 'MK')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Mansehra', 'MS')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Mardan', 'MD')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Nowshera', 'N')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Peshawar', 'P')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Shangla', 'SG')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Swabi', 'SB')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Swat', 'ST')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Tank', 'TK')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Tor Ghar', 'TG')
INSERT INTO @tbl2 VALUES ( 'Khyber-Pakhtunkhwa', 'Upper Dir', 'U')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Attock', 'A')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Bahawalnagar', 'BN')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Bahawalpur', 'BP')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Bhakkar', 'B')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Chakwal', 'CK')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Chiniot', 'CN')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Dera Ghazi Khan', 'D')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Faisalabad', 'F')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Gujranwala', 'GW')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Gujrat', 'G')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Hafizabad', 'H')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Jhang', 'JG')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Jhelum', 'JM')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Kasur', 'KS')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Khanewal', 'KN')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Khushab', 'KH')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Lahore', 'LH')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Layyah', 'LY')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Lodhran', 'LD')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Mandi Bahauddin', 'MB')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Mianwali', 'MW')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Multan', 'ML')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Muzaffargarh', 'MZ')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Narowal', 'NR')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Nankana Sahib', 'NS')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Okara', 'O')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Pakpattan', 'P')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Rahim Yar Khan', 'RY')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Rajanpur', 'RJ')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Rawalpindi', 'RW')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Sahiwal', 'SW')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Sargodha', 'SG')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Sheikhupura', 'SP')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Sialkot', 'SK')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Toba Tek Singh', 'T')
INSERT INTO @tbl2 VALUES ( 'Punjab', 'Vehari', 'V')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Badin', 'B')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Dadu', 'D')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Ghotki', 'G')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Hyderabad', 'H')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Jacobabad', 'JB')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Jamshoro', 'JS')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Karachi ', 'KR')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Kashmore', 'KM')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Khairpur', 'KP')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Larkana', 'L')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Matiari', 'MT')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Mirpurkhas', 'MP')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Naushahro Firoze', 'N')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Shaheed Benazirabad', 'SB')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Kambar Shahdadkot', 'KS')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Sanghar', 'SG')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Shikarpur', 'SP')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Sukkur', 'SK')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Tando Allahyar', 'TA')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Tando Muhammad Khan', 'TM')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Tharparkar', 'TP')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Thatta', 'TT')
INSERT INTO @tbl2 VALUES ( 'Sindh', 'Umerkot', 'U')


SET NOCOUNT OFF

INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl2	t
		LEFT JOIN	level_1_address_components	l1
			ON	(	l1.level_1_address_component_nm	=	t.level_1_nm
				AND	l1.country_id					=	@country_id
				)

-- ======================================================================

UPDATE	l2
	SET	is_authentic	=	1
FROM	level_2_address_components	l2
	JOIN	level_1_address_components	l1
		ON	(	l1.level_1_address_component_id	=	l2.level_1_address_component_id
			AND	l1.country_id	=	@country_id
			);


UPDATE	level_1_address_components
	SET	is_authentic	=	1
WHERE	country_id	=	@country_id;

-- ======================================================================


