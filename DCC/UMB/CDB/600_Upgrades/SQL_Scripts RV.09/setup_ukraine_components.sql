
/* ==================================================================================
    	Source File		:	setup_ukraine_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Ukraine are set-up
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
WHERE	country_nm	=	'Ukraine';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Ukraine not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Region',
		level_2_address_component	=	'Raion',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Alchevs''ka',	'LH',	'AL');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Alushtyns''ka',	'KR',	'AL');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Amvrosiivs''kyi',	'DT',	'AS');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Anan''ivs''kyi',	'OD',	'AN');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Andrushivs''kyi',	'ZT',	'AN');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Antratsitivs''ka',	'LH',	'AM');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Antratsytivs''kyi',	'LH',	'AR');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Apostolivs''kyi',	'DP',	'AP');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Arbuzyns''kyi',	'MY',	'AR');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Armians''ka',	'KR',	'AR');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Artemivs''ka',	'DT',	'AM');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Artemivs''kyi',	'DT',	'AR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Artsyz''kyi',	'OD',	'AR');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Avdiivs''ka',	'DT',	'AV');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Bakhchysarais''kyi',	'KR',	'BA');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Bakhmats''kyi',	'CH',	'BA');
INSERT INTO @tbl VALUES ('Sevastopol'' City'            ,	     'Balaklavs''kyi',	'SC',	'BA');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Balakliis''kyi',	'KK',	'BL');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Balts''kyi',	'OD',	'BA');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Baranivs''kyi',	'ZT',	'BA');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Bars''kyi',	'VI',	'BA');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Barvinkivs''kyi',	'KK',	'BR');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Baryshivs''kyi',	'KV',	'BA');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Bashtans''kyi',	'MY',	'BA');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Berdians''ka',	'ZP',	'BM');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Berdians''kyi',	'ZP',	'BR');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Berdychivs''ka',	'ZT',	'BM');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Berdychivs''kyi',	'ZT',	'BR');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Berehivs''ka',	'ZK',	'BM');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Berehivs''kyi',	'ZK',	'BR');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Berezans''ka',	'KV',	'BE');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Berezans''kyi',	'MY',	'BE');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Berezhans''kyi',	'TP',	'BE');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Berezivs''kyi',	'OD',	'BE');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Bereznehuvats''kyi',	'MY',	'BH');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Bereznivs''kyi',	'RV',	'BE');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Bershads''kyi',	'VI',	'BE');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Beryslavs''kyi',	'KS',	'BE');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Bilhorod-Dnistrovs''ka',	'OD',	'BM');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Bilhorod-Dnistrovs''kyi',	'OD',	'BR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Biliaivs''kyi',	'OD',	'BL');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Bilohirs''kyi',	'KM',	'BI');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Bilohirs''kyi',	'KR',	'BI');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Bilokurakyns''kyi',	'LH',	'BK');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Bilopils''kyi',	'SM',	'BI');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Bilotserkivs''ka',	'KV',	'BT');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Bilotserkivs''kyi',	'KV',	'BI');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Bilovods''kyi',	'LH',	'BV');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Bilozers''kyi',	'KS',	'BI');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Blyzniukivs''kyi',	'KK',	'BZ');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Bobrovyts''kyi',	'CH',	'BB');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Bobrynets''kyi',	'KH',	'BO');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Bohodukhivs''kyi',	'KK',	'BH');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Bohorodchans''kyi',	'IF',	'BH');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Bohuslavs''kyi',	'KV',	'BH');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Bolekhivs''ka',	'IF',	'BL');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Bolhrads''kyi',	'OD',	'BO');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Borivs''kyi',	'KK',	'BO');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Borodians''kyi',	'KV',	'BD');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Borshchivs''kyi',	'TP',	'BO');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Boryslavs''ka',	'LV',	'BO');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Boryspil''s''ka',	'KV',	'BS');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Boryspil''s''kyi',	'KV',	'BR');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Borznians''kyi',	'CH',	'BZ');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Brats''kyi',	'MY',	'BR');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Briankivs''ka',	'LH',	'BR');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Brodivs''kyi',	'LV',	'BR');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Brovars''ka',	'KV',	'BO');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Brovars''kyi',	'KV',	'BV');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Brusylivs''kyi',	'ZT',	'BS');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Buchats''kyi',	'TP',	'BU');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Buryns''kyi',	'SM',	'BU');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Bus''kyi',	'LV',	'BU');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Chaplyns''kyi',	'KS',	'CH');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Chechel''nyts''kyi',	'VI',	'CC');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Chemerovets''kyi',	'KM',	'CH');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Cherkas''ka',	'CK',	'CM');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Cherkas''kyi',	'CK',	'CR');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Cherniakhivs''kyi',	'ZT',	'CK');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Chernihivs''ka',	'CH',	'CM');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Chernihivs''kyi',	'CH',	'CR');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Chernihivs''kyi',	'ZP',	'CH');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Chernivets''ka',	'CV',	'CH');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Chernivets''kyi',	'VI',	'CR');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Chervonoarmiis''kyi',	'ZT',	'CA');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Chervonohrads''ka',	'LV',	'CH');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Chops''ka',	'ZK',	'CH');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Chornobaivs''kyi',	'CK',	'CB');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Chornomors''kyi',	'KR',	'CH');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Chornukhyns''kyi',	'PL',	'CR');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Chortkivs''kyi',	'TP',	'CH');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Chudnivs''kyi',	'ZT',	'CD');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Chuhuivs''ka',	'KK',	'CM');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Chuhuivs''kyi',	'KK',	'CR');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Chutivs''kyi',	'PL',	'CT');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Chyhyryns''kyi',	'CK',	'CY');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Darnyts''kyi',	'KC',	'DA');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Debal''tsevs''ka',	'DT',	'DE');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Demydiv''s''kyi',	'RV',	'DE');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Derazhnians''kyi',	'KM',	'DE');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Derhachivs''kyi',	'KK',	'DE');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Desnians''kyi',	'KC',	'DE');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Dniprodzerzhyns''ka',	'DP',	'DD');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Dnipropetrovs''ka',	'DP',	'DM');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Dnipropetrovs''kyi',	'DP',	'DR');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Dniprovs''kyi',	'KC',	'DN');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Dobropil''s''ka',	'DT',	'DM');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Dobropil''s''kyi',	'DT',	'DR');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Dobrovelychkivs''kyi',	'KH',	'DB');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Dokuchaievs''ka',	'DT',	'DC');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Dolyns''kyi',	'IF',	'DO');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Dolyns''kyi',	'KH',	'DL');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Domanivs''kyi',	'MY',	'DO');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Donets''ka',	'DT',	'DN');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Drabivs''kyi',	'CK',	'DR');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Drohobyts''ka',	'LV',	'DM');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Drohobyts''kyi',	'LV',	'DR');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Druzhkivs''ka',	'DT',	'DK');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Dubens''kyi',	'RV',	'DB');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Dubnivs''ka',	'RV',	'DU');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Dubrovyts''kyi',	'RV',	'DR');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Dunaievets''kyi',	'KM',	'DU');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Dvorichans''kyi',	'KK',	'DV');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Dykans''kyi',	'PL',	'DY');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Dymytrivs''ka',	'DT',	'DY');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Dzerzhyns''ka',	'DT',	'DZ');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Dzhankois''ka',	'KR',	'DM');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Dzhankois''kyi',	'KR',	'DR');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Enerhodars''ka',	'ZP',	'EN');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Fastivs''ka',	'KV',	'FM');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Fastivs''kyi',	'KV',	'FR');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Feodosiis''ka',	'KR',	'FE');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Frunzivs''kyi',	'OD',	'FR');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Hadiats''kyi',	'PL',	'HA');
INSERT INTO @tbl VALUES ('Sevastopol'' City'            ,	     'Haharins''kyi',	'SC',	'HA');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Haisyns''kyi',	'VI',	'HA');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Haivorons''kyi',	'KH',	'HA');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Halyts''kyi',	'IF',	'HA');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Heniches''kyi',	'KS',	'HE');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Hertsaivs''kyi',	'CV',	'HE');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Hlobyns''kyi',	'PL',	'HL');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Hlukhivs''ka',	'SM',	'HM');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Hlukhivs''kyi',	'SM',	'HR');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Hlybots''kyi',	'CV',	'HL');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Holoprystans''kyi',	'KS',	'HL');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Holosiivs''kyi',	'KC',	'HO');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Holovanivs''kyi',	'KH',	'HO');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Horlivs''ka',	'DT',	'HO');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Hornostaivs''kyi',	'KS',	'HR');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Horodenkivs''kyi',	'IF',	'HO');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Horodnians''kyi',	'CH',	'HO');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Horodots''kyi',	'KM',	'HO');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Horodots''kyi',	'LV',	'HO');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Horodyshchens''kyi',	'CK',	'HO');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Horokhivs''kyi',	'VO',	'HO');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Hoshchans''kyi',	'RV',	'HO');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Hrebinkivs''kyi',	'PL',	'HR');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Huliaipil''s''kyi',	'ZP',	'HU');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Husiatyns''kyi',	'TP',	'HU');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Iahotyns''kyi',	'KV',	'IA');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Iakymivs''kyi',	'ZP',	'IA');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Ialtyns''ka',	'KR',	'IA');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Iampil''s''kyi',	'SM',	'IA');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Iampil''s''kyi',	'VI',	'IA');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Iaremchans''ka',	'IF',	'IA');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Iarmolynets''kyi',	'KM',	'IA');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Iasynuvats''ka',	'DT',	'IM');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Iasynuvats''kyi',	'DT',	'IR');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Iavorivs''kyi',	'LV',	'IA');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Ichnians''kyi',	'CH',	'IC');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Ielanets''kyi',	'MY',	'IE');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Iemil''chyns''kyi',	'ZT',	'IE');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Ienakiievs''ka',	'DT',	'IE');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Ievpatoriis''ka',	'KR',	'IE');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Illichivs''ka',	'OD',	'IL');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Illinets''kyi',	'VI',	'IL');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Irpins''ka',	'KV',	'IR');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Irshavs''kyi',	'ZK',	'IR');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Iurivs''kyi',	'DP',	'IU');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Iuzhnens''ka',	'OD',	'IU');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Iuzhnoukrains''ka',	'MY',	'IU');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Ivanivs''kyi',	'KS',	'IV');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Ivanivs''kyi',	'OD',	'IV');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Ivankivs''kyi',	'KV',	'IV');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Ivano-Frankivs''ka',	'IF',	'IV');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Ivanychivs''kyi',	'VO',	'IV');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Iziaslavs''kyi',	'KM',	'IZ');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Iziums''ka',	'KK',	'IM');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Iziums''kyi',	'KK',	'IR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Izmail''s''ka',	'OD',	'IM');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Izmail''s''kyi',	'OD',	'IR');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Kaharlyts''kyi',	'KV',	'KA');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Kakhovs''ka',	'KS',	'KM');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Kakhovs''kyi',	'KS',	'KR');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Kalanchats''kyi',	'KS',	'KC');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Kalus''ka',	'IF',	'KS');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Kalus''kyi',	'IF',	'KL');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Kalynivs''kyi',	'VI',	'KA');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Kamianets''-Podil''s''ka',	'KM',	'KA');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Kamianets''-Podil''s''kyi',	'KM',	'KP');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Kamianka-Buz''kyi',	'LV',	'KA');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Kamians''ko-Dniprovs''kyi',	'ZP',	'KA');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Kamians''kyi',	'CK',	'KN');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Kamin''-Kashyrs''kyi',	'VO',	'KA');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Kanivs''ka',	'CK',	'KM');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Kanivs''kyi',	'CK',	'KR');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Karlivs''kyi',	'PL',	'KA');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Katerynopil''s''kyi',	'CK',	'KT');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Kazankivs''kyi',	'MY',	'KA');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Kehychivs''kyi',	'KK',	'KE');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Kel''menets''kyi',	'CV',	'KE');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Kerchens''ka',	'KR',	'KE');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Kharkivs''ka',	'KK',	'KM');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Kharkivs''kyi',	'KK',	'KR');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Khartsyz''ka',	'DT',	'KH');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Khersons''ka',	'KS',	'KH');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Khmel''nyts''ka',	'KM',	'KM');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Khmel''nyts''kyi',	'KM',	'KR');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Khmil''nyts''ka',	'VI',	'KN');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Khmil''nyts''kyi',	'VI',	'KH');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Khorol''s''kyi',	'PL',	'KH');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Khotyns''kyi',	'CV',	'KH');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Khrystynivs''kyi',	'CK',	'KH');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Khusts''ka',	'ZK',	'KM');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Khusts''kyi',	'ZK',	'KR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Kiliis''kyi',	'OD',	'KL');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Kirovohrads''ka',	'KH',	'KM');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Kirovohrads''kyi',	'KH',	'KR');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Kirovs''ka',	'DT',	'KI');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Kirovs''ka',	'LH',	'KI');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Kirovs''kyi',	'KR',	'KI');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Kitsmans''kyi',	'CV',	'KI');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Kivertsivs''kyi',	'VO',	'KI');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Kobeliats''kyi',	'PL',	'KB');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Kodyms''kyi',	'OD',	'KD');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Kolomats''kyi',	'KK',	'KO');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Kolomyis''ka',	'IF',	'KM');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Kolomyis''kyi',	'IF',	'KR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Kominternivs''kyi',	'OD',	'KI');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Kompaniivs''kyi',	'KH',	'KO');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Komsomol''s''ka',	'PL',	'KS');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Konotops''ka',	'SM',	'KM');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Konotops''kyi',	'SM',	'KR');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Korets''kyi',	'RV',	'KR');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Koriukivs''kyi',	'CH',	'KK');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Korops''kyi',	'CH',	'KP');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Korostens''ka',	'ZT',	'KM');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Korostens''kyi',	'ZT',	'KR');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Korostyshivs''kyi',	'ZT',	'KS');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Korsun''-Shevchenkivs''kyi',	'CK',	'KO');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Kosivs''kyi',	'IF',	'KO');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Kostiantynivs''ka',	'DT',	'KT');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Kostiantynivs''kyi',	'DT',	'KS');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Kostopil''s''kyi',	'RV',	'KP');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Kotelevs''kyi',	'PL',	'KT');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Kotovs''ka',	'OD',	'KM');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Kotovs''kyi',	'OD',	'KR');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Kovel''s''ka',	'VO',	'KM');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Kovel''s''kyi',	'VO',	'KR');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Kozelets''kyi',	'CH',	'KZ');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Kozel''shchyns''kyi',	'PL',	'KZ');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Koziatyns''ka',	'VI',	'KM');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Koziatyns''kyi',	'VI',	'KR');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Kozivs''kyi',	'TP',	'KO');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Kramators''ka',	'DT',	'KM');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Krasnoarmiis''ka',	'DT',	'KA');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Krasnoarmiis''kyi',	'DT',	'KR');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Krasnodons''ka',	'LH',	'KM');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Krasnodons''kyi',	'LH',	'KR');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Krasnohrads''kyi',	'KK',	'KH');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Krasnohvardiis''kyi',	'KR',	'KH');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Krasnokuts''kyi',	'KK',	'KK');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Krasnoluts''ka',	'LH',	'KL');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Krasnolymans''ka',	'DT',	'KY');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Krasnolymans''kyi',	'DT',	'KL');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Krasnooknians''kyi',	'OD',	'KO');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Krasnoperekops''ka',	'KR',	'KM');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Krasnoperekops''kyi',	'KR',	'KR');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Krasnopil''s''kyi',	'SM',	'KP');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Krasylivs''kyi',	'KM',	'KL');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Kremenchuts''ka',	'PL',	'KM');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Kremenchuts''kyi',	'PL',	'KR');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Kremenets''kyi',	'TP',	'KR');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Kremins''kyi',	'LH',	'KN');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Krolevets''kyi',	'SM',	'KV');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Krynychans''kyi',	'DP',	'KC');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Kryvoozers''kyi',	'MY',	'KR');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Kryvoriz''ka',	'DP',	'KM');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Kryvoriz''kyi',	'DP',	'KR');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Kryzhopil''s''kyi',	'VI',	'KZ');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Kuibyshevs''kyi',	'ZP',	'KU');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Kulykivs''kyi',	'CH',	'KU');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Kupians''ka',	'KK',	'KP');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Kupians''kyi',	'KK',	'KU');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Kuznetsovs''ka',	'RV',	'KU');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Kyievo-Sviatoshyns''kyi',	'KV',	'KY');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Ladyzhyns''ka',	'VI',	'LA');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Lanovets''kyi',	'TP',	'LA');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Lebedyns''ka',	'SM',	'LM');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Lebedyns''kyi',	'SM',	'LR');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Lenins''kyi',	'KR',	'LE');
INSERT INTO @tbl VALUES ('Sevastopol'' City'            ,	     'Lenins''kyi',	'SC',	'LE');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Letychivs''kyi',	'KM',	'LE');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Lityns''kyi',	'VI',	'LI');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Liubars''kyi',	'ZT',	'LI');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Liubashivs''kyi',	'OD',	'LI');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Liubeshivs''kyi',	'VO',	'LS');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Liuboml''s''kyi',	'VO',	'LL');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Liubotyns''ka',	'KK',	'LI');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Lokachyns''kyi',	'VO',	'LO');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Lokhvyts''kyi',	'PL',	'LO');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Lozivs''ka',	'KK',	'LM');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Lozivs''kyi',	'KK',	'LR');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Lubens''ka',	'PL',	'LM');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Lubens''kyi',	'PL',	'LR');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Luhans''ka',	'LH',	'LH');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Luhyns''kyi',	'ZT',	'LU');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Luts''ka',	'VO',	'LM');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Luts''kyi',	'VO',	'LR');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Lutuhyns''kyi',	'LH',	'LT');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'L''vivs''ka',	'LV',	'LV');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Lypovets''kyi',	'VI',	'LY');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Lypovodolyns''kyi',	'SM',	'LY');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Lysians''kyi',	'CK',	'LY');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Lysychans''ka',	'LH',	'LY');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Mahdalynivs''kyi',	'DP',	'MD');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Makarivs''kyi',	'KV',	'MA');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Makiivs''ka',	'DT',	'MK');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Malovyskivs''kyi',	'KH',	'MA');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Malyns''kyi',	'ZT',	'MA');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Manevyts''kyi',	'VO',	'MA');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Man''kivs''kyi',	'CK',	'MA');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Marhanets''ka',	'DP',	'MR');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Marins''kyi',	'DT',	'MN');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Mariupol''s''ka',	'DT',	'MP');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Markivs''kyi',	'LH',	'MA');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Mashivs''kyi',	'PL',	'MA');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Melitopol''s''ka',	'ZP',	'MM');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Melitopol''s''kyi',	'ZP',	'MR');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Mens''kyi',	'CH',	'ME');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Mezhivs''kyi',	'DP',	'ME');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Milovs''kyi',	'LH',	'MI');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Mizhhirs''kyi',	'ZK',	'MI');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Mlynivs''kyi',	'RV',	'ML');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Mohyliv-Podil''s''ka',	'VI',	'MM');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Mohyliv-Podil''s''kyi',	'VI',	'MR');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Monastyryshchens''kyi',	'CK',	'MO');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Monastyrys''kyi',	'TP',	'MO');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Morshyns''ka',	'LV',	'MR');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Mostys''kyi',	'LV',	'MS');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Mukachivs''ka',	'ZK',	'MM');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Mukachivs''kyi',	'ZK',	'MR');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Murovano-Kurylovets''kyi',	'VI',	'MU');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Mykhailivs''kyi',	'ZP',	'MY');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Mykolaivs''ka',	'MY',	'MM');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Mykolaivs''kyi',	'LV',	'MY');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Mykolaivs''kyi',	'MY',	'MR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Mykolaivs''kyi',	'OD',	'MY');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Myrhorods''ka',	'PL',	'MM');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Myrhorods''kyi',	'PL',	'MR');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Myronivs''kyi',	'KV',	'MY');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Nadvirnians''kyi',	'IF',	'NA');
INSERT INTO @tbl VALUES ('Sevastopol'' City'            ,	     'Nakhimovs''kyi',	'SC',	'NA');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Narodyts''kyi',	'ZT',	'NA');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Nedryhailivs''kyi',	'SM',	'NE');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Nemyrivs''kyi',	'VI',	'NE');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Netishyns''ka',	'KM',	'NE');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Nikopol''s''ka',	'DP',	'NP');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Nikopol''s''kyi',	'DP',	'NK');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Nizhyns''ka',	'CH',	'NM');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Nizhyns''kyi',	'CH',	'NR');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Nosivs''kyi',	'CH',	'NO');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Novhorodkivs''kyi',	'KH',	'NH');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Novhorod-Sivers''kyi',	'CH',	'NS');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Novoaidars''kyi',	'LH',	'NA');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Novoarkhanhel''s''kyi',	'KH',	'NA');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Novoazovs''kyi',	'DT',	'NA');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Novobuz''kyi',	'MY',	'NB');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Novodnistrovs''ka',	'CV',	'NO');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Novohrad-Volyns''ka',	'ZT',	'NM');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Novohrad-Volyns''kyi',	'ZT',	'NR');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Novohrodivs''ka',	'DT',	'NH');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Novokahovs''ka',	'KS',	'NK');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Novomoskovs''ka',	'DP',	'NM');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Novomoskovs''kyi',	'DP',	'NV');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Novomykolaivs''kyi',	'ZP',	'NO');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Novomyrhorods''kyi',	'KH',	'NM');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Novoodes''kyi',	'MY',	'NO');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Novopskovs''kyi',	'LH',	'NP');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Novorozdol''s''ka',	'LV',	'NO');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Novosanzhars''kyi',	'PL',	'NO');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Novoselits''kyi',	'CV',	'NS');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Novotroits''kyi',	'KS',	'NT');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Novoukrains''kyi',	'KH',	'NU');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Novoushyts''kyi',	'KM',	'NO');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Novovodolaz''kyi',	'KK',	'NO');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Novovolyns''ka',	'VO',	'NO');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Novovorontsovs''kyi',	'KS',	'NV');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Nyzhn''ohirs''kyi',	'KR',	'NY');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Nyzhn''osirohoz''kyi',	'KS',	'NY');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Obolons''kyi',	'KC',	'OB');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Obukhivs''kyi',	'KV',	'OB');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Ochakivs''ka',	'MY',	'OM');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Ochakivs''kyi',	'MY',	'OR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Odes''ka',	'OD',	'OD');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Okhtyrs''ka',	'SM',	'OM');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Okhtyrs''kyi',	'SM',	'OR');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Oleksandriis''ka',	'KH',	'OM');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Oleksandriis''kyi',	'KH',	'OR');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Oleksandrivs''kyi',	'DT',	'OL');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Oleksandrivs''kyi',	'KH',	'OV');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Olevs''kyi',	'ZT',	'OL');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Onufriivs''kyi',	'KH',	'ON');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Orativs''kyi',	'VI',	'OR');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Ordzhonikidzevs''ka',	'DP',	'OR');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Orikhivs''kyi',	'ZP',	'OR');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Orzhyts''kyi',	'PL',	'OR');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Ostroz''ka',	'RV',	'OM');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Ostroz''kyi',	'RV',	'OR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Ovidiopol''s''kyi',	'OD',	'OV');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Ovruts''kyi',	'ZT',	'OV');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Pavlohrads''ka',	'DP',	'PM');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Pavlohrads''kyi',	'DP',	'PR');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Pecheniz''kyi',	'KK',	'PC');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Pechers''kyi',	'KC',	'PE');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Perechyns''kyi',	'ZK',	'PE');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Pereiaslav-Khmel''nyts''ka',	'KV',	'PM');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Pereiaslav-Khmel''nyts''kyi',	'KV',	'PR');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Peremyshlians''kyi',	'LV',	'PE');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Pereval''s''kyi',	'LH',	'PL');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Pershotravens''ka',	'DP',	'PE');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Pershotravnevyi',	'DT',	'PE');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Pervomais''ka',	'KK',	'PM');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Pervomais''ka',	'LH',	'PM');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Pervomais''ka',	'MY',	'PM');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Pervomais''kyi',	'KK',	'PR');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Pervomais''kyi',	'KR',	'PE');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Pervomais''kyi',	'MY',	'PR');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Petrivs''kyi',	'KH',	'PE');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Petropavlivs''kyi',	'DP',	'PP');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Petrykivs''kyi',	'DP',	'PK');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Piatykhats''kyi',	'DP',	'PI');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Pidhaiets''kyi',	'TP',	'PH');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Pidvolochys''kyi',	'TP',	'PV');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Pishchans''kyi',	'VI',	'PI');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Podil''s''kyi',	'KC',	'PO');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Pohrebyshchens''kyi',	'VI',	'PO');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Pokrovs''kyi',	'DP',	'PO');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Polis''kyi',	'KV',	'PO');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Polohivs''kyi',	'ZP',	'PO');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Polons''kyi',	'KM',	'PO');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Poltavs''ka',	'PL',	'PM');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Poltavs''kyi',	'PL',	'PR');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Popasnians''kyi',	'LH',	'PO');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Popil''nians''kyi',	'ZT',	'PO');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Pryazovs''kyi',	'ZP',	'PZ');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Pryluts''ka',	'CH',	'PM');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Pryluts''kyi',	'CH',	'PR');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Prymors''kyi',	'ZP',	'PM');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Prypiats''ka (1)',	'KV',	'PP');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Pustomytivs''kyi',	'LV',	'PU');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Putyl''s''kyi',	'CV',	'PU');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Putyvl''s''kyi',	'SM',	'PU');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Pyriatyns''kyi',	'PL',	'PY');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Radekhivs''kyi',	'LV',	'RA');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Radomyshl''s''kyi',	'ZT',	'RA');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Radyvylivs''kyi',	'RV',	'RA');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Rakhivs''kyi',	'ZK',	'RA');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Ratnivs''kyi',	'VO',	'RA');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Reniis''kyi',	'OD',	'RE');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Reshetylivs''kyi',	'PL',	'RE');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Ripkyns''kyi',	'CH',	'RI');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Rivnens''ka',	'RV',	'RM');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Rivnens''kyi',	'RV',	'RR');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Rohatyns''kyi',	'IF',	'RH');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Rokytnians''kyi',	'KV',	'RO');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Rokytnivs''kyi',	'RV',	'RO');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Romanivs''kyi',	'ZT',	'RO');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Romens''ka',	'SM',	'RM');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Romens''kyi',	'SM',	'RR');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Roven''kivs''ka',	'LH',	'RO');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Rozdil''nias''kyi',	'OD',	'RO');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Rozdol''nens''kyi',	'KR',	'RO');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Rozhniativs''kyi',	'IF',	'RZ');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Rozhyshchens''kyi',	'VO',	'RO');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Rozivs''kyi',	'ZP',	'RO');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Rubezhans''ka',	'LH',	'RU');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Ruzhyns''kyi',	'ZT',	'RU');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Rzhyshchivs''ka',	'KV',	'RZ');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Sakhnovshchyns''kyi',	'KK',	'SA');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Saks''ka',	'KR',	'SS');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Saks''kyi',	'KR',	'SK');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Sambirs''ka',	'LV',	'SM');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Sambirs''kyi',	'LV',	'SR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Sarats''kyi',	'OD',	'SR');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Sarnens''kyi',	'RV',	'SA');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Savrans''kyi',	'OD',	'SV');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Selydovs''ka',	'DT',	'SE');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Semenivs''kyi',	'CH',	'SE');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Semenivs''kyi',	'PL',	'SE');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Seredyno-Buds''kyi',	'SM',	'SE');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Shakhtars''ka',	'DT',	'SK');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Shakhtars''kyi',	'DT',	'SH');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Sharhorods''kyi',	'VI',	'SH');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Shats''kyi',	'VO',	'SH');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Shchors''kyi',	'CH',	'SH');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Shepetivs''ka',	'KM',	'SP');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Shepetivs''kyi',	'KM',	'SH');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Shevchenkivs''kyi',	'KC',	'SH');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Shevchenkivs''kyi',	'KK',	'SH');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Shostkins''ka',	'SM',	'SK');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Shostkins''kyi',	'SM',	'SH');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Shpolians''kyi',	'CK',	'SH');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Shums''kyi',	'TP',	'SH');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Shyriaivs''kyi',	'OD',	'SH');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Shyrokivs''kyi',	'DP',	'SH');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Shyshats''kyi',	'PL',	'SH');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Sieverodonets''ka',	'LH',	'SI');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Simferopol''s''ka',	'KR',	'SM');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Simferopol''s''kyi',	'KR',	'SR');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Skadovs''kyi',	'KS',	'SK');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Skolivs''kyi',	'LV',	'SK');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Skvyrs''kyi',	'KV',	'SK');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Slavuts''ka',	'KM',	'SV');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Slavuts''kyi',	'KM',	'SL');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Slavutyts''ka',	'KV',	'SL');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Slovianoserbs''kyi',	'LH',	'SS');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Slovians''ka',	'DT',	'SV');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Slovians''kyi',	'DT',	'SL');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Smilians''ka',	'CK',	'SM');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Smilians''kyi',	'CK',	'SR');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Sniatyns''kyi',	'IF',	'SN');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Snihurivs''kyi',	'MY',	'SN');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Snizhnens''ka',	'DT',	'SN');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Sofiivs''kyi',	'DP',	'SF');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Sokal''s''kyi',	'LV',	'SO');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Sokyrians''kyi',	'CV',	'SO');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Solomians''kyi',	'KC',	'SO');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Solonians''kyi',	'DP',	'SL');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Sosnyts''kyi',	'CH',	'SO');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Soviets''kyi',	'KR',	'SO');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Sribnians''kyi',	'CH',	'SR');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Stakhanivs''ka',	'LH',	'SK');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Stanychno-Luhans''kyi',	'LH',	'SL');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Starobeshivs''kyi',	'DT',	'ST');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Starobil''s''kyi',	'LH',	'SB');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Starokostiantynivs''ka',	'KM',	'ST');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Starokostiantynivs''kyi',	'KM',	'SK');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Starosambirs''kyi',	'LV',	'SS');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Starosyniavs''kyi',	'KM',	'SS');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Starovyzhivs''kyi',	'VO',	'ST');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Stavyshchens''kyi',	'KV',	'ST');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Storozhynets''kyi',	'CV',	'ST');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Stryis''ka',	'LV',	'SY');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Stryis''kyi',	'LV',	'ST');
INSERT INTO @tbl VALUES ('Crimea'            ,	     'Sudats''ka',	'KR',	'SU');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Sums''ka',	'SM',	'SM');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Sums''kyi',	'SM',	'SR');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Svaliavs''kyi',	'ZK',	'SV');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Svativs''kyi',	'LH',	'SV');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Sverdlovs''ka',	'LH',	'SM');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Sverdlovs''kyi',	'LH',	'SR');
INSERT INTO @tbl VALUES ('Kiev City'            ,	     'Sviatoshyns''kyi',	'KC',	'SV');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Svitlovods''ka',	'KH',	'SM');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Svitlovods''kyi',	'KH',	'SR');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Synel''nykivs''ka',	'DP',	'SM');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Synel''nykivs''kyi',	'DP',	'SR');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Talalaivs''kyi',	'CH',	'TA');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Tal''nivs''kyi',	'CK',	'TA');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Tarashchans''kyi',	'KV',	'TA');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Tarutyns''kyi',	'OD',	'TR');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Tatarbunars''kyi',	'OD',	'TT');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Tel''manivs''kyi',	'DT',	'TE');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Teofipol''s''kyi',	'KM',	'TE');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Teplodars''ka',	'OD',	'TE');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Teplyts''kyi',	'VI',	'TE');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Terebovlians''kyi',	'TP',	'TB');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Ternivs''ka',	'DP',	'TE');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Ternopil''s''ka',	'TP',	'TM');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Ternopil''s''kyi',	'TP',	'TR');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Tetiivs''kyi',	'KV',	'TE');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Tiachivs''kyi',	'ZK',	'TI');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Tlumats''kyi',	'IF',	'TL');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Tokmats''ka',	'ZP',	'TM');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Tokmats''kyi',	'ZP',	'TR');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Tomakivs''kyi',	'DP',	'TO');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Tomashpil''s''kyi',	'VI',	'TO');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Torez''ka',	'DT',	'TO');
INSERT INTO @tbl VALUES ('Luhans''k'            ,	     'Troits''kyi',	'LH',	'TR');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Trostianets''kyi',	'SM',	'TR');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Trostianets''kyi',	'VI',	'TR');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Truskavets''ka',	'LV',	'TR');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Tsarychans''kyi',	'DP',	'TS');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Tsiurupyns''kyi',	'KS',	'TS');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Tul''chyns''kyi',	'VI',	'TU');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Turiis''kyi',	'VO',	'TU');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Turkivs''kyi',	'LV',	'TU');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Tysmenyts''kyi',	'IF',	'TY');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Tyvrivs''kyi',	'VI',	'TY');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Ul''ianovs''kyi',	'KH',	'UL');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Umans''ka',	'CK',	'UM');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Umans''kyi',	'CK',	'UR');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Ustynivs''kyi',	'KH',	'US');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Uzhhorods''ka',	'ZK',	'UM');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Uzhhorods''kyi',	'ZK',	'UR');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Valkivs''kyi',	'KK',	'VA');
INSERT INTO @tbl VALUES ('Chernihiv'            ,	     'Varvyns''kyi',	'CH',	'VA');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Vasylivs''kyi',	'ZP',	'VA');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Vasyl''kivs''ka',	'KV',	'VM');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Vasyl''kivs''kyi',	'DP',	'VA');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Vasyl''kivs''kyi',	'KV',	'VR');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Vatutins''ka',	'CK',	'VA');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Velykobahachans''kyi',	'PL',	'VE');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Velykobereznians''kyi',	'ZK',	'VE');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Velykobilozers''kyi',	'ZP',	'VB');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Velykoburluts''kyi',	'KK',	'VE');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Velykolepetys''kyi',	'KS',	'VL');
INSERT INTO @tbl VALUES ('Odessa'            ,	     'Velykomykhailivs''kyi',	'OD',	'VE');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Velykonovosilkivs''kyi',	'DT',	'VE');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Velykooleksandrivs''kyi',	'KS',	'VO');
INSERT INTO @tbl VALUES ('Sumy'            ,	     'Velykopysarivs''kyi',	'SM',	'VE');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Verkhn''odniprovs''kyi',	'DP',	'VE');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Verkhn''orohachyts''kyi',	'KS',	'VR');
INSERT INTO @tbl VALUES ('Ivano-Frankivs''k'            ,	     'Verkhovyns''kyi',	'IF',	'VE');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Veselivs''kyi',	'ZP',	'VS');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Veselynivs''kyi',	'MY',	'VE');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Vil''nians''kyi',	'ZP',	'VI');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Vil''nohirs''ka',	'DP',	'VI');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Vil''shans''kyi',	'KH',	'VI');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Vin''kovets''kyi',	'KM',	'VI');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Vinnyts''ka',	'VI',	'VM');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Vinnyts''kyi',	'VI',	'VR');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Volnovas''kyi',	'DT',	'VV');
INSERT INTO @tbl VALUES ('Khmel''nyts''kyy'            ,	     'Volochys''kyi',	'KM',	'VO');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Volodars''ko-Volyns''kyi',	'ZT',	'VO');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Volodars''kyi',	'DT',	'VD');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Volodars''kyi',	'KV',	'VO');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Volodymyrets''kyi',	'RV',	'VO');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Volodymyr-Volyns''ka',	'VO',	'VM');
INSERT INTO @tbl VALUES ('Volyn'            ,	     'Volodymyr-Volyns''kyi',	'VO',	'VR');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Volovets''kyi',	'ZK',	'VO');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Vovchans''kyi',	'KK',	'VO');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Voznesens''ka',	'MY',	'VM');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Voznesens''kyi',	'MY',	'VR');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Vradiivs''kyi',	'MY',	'VD');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Vuhledars''ka',	'DT',	'VU');
INSERT INTO @tbl VALUES ('Transcarpathia'            ,	     'Vynohradivs''kyi',	'ZK',	'VY');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Vyshhorods''kyi',	'KV',	'VY');
INSERT INTO @tbl VALUES ('Kherson'            ,	     'Vysokopil''s''kyi',	'KS',	'VY');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Vyzhnyts''kyi',	'CV',	'VY');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Zachepylivs''kyi',	'KK',	'ZA');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Zalishchyts''kyi',	'TP',	'ZA');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Zaporiz''ka',	'ZP',	'ZM');
INSERT INTO @tbl VALUES ('Zaporizhzhya'            ,	     'Zaporiz''kyi',	'ZP',	'ZR');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Zarichnens''kyi',	'RV',	'ZA');
INSERT INTO @tbl VALUES ('Chernivtsi'            ,	     'Zastavnets''kyi',	'CV',	'ZA');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Zbaraz''kyi',	'TP',	'ZZ');
INSERT INTO @tbl VALUES ('Ternopil'''            ,	     'Zborivs''kyi',	'TP',	'ZV');
INSERT INTO @tbl VALUES ('Rivne'            ,	     'Zdolbunivs''kyi',	'RV',	'ZD');
INSERT INTO @tbl VALUES ('Kiev'            ,	     'Zgurivs''kyi',	'KV',	'ZG');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Zhashkivs''kyi',	'CK',	'ZH');
INSERT INTO @tbl VALUES ('Donets''k'            ,	     'Zhdanivs''ka',	'DT',	'ZH');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Zhmeryns''ka',	'VI',	'ZM');
INSERT INTO @tbl VALUES ('Vinnytsya'            ,	     'Zhmeryns''kyi',	'VI',	'ZR');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Zhovkivs''kyi',	'LV',	'ZV');
INSERT INTO @tbl VALUES ('Mykolayiv'            ,	     'Zhovtnevyi',	'MY',	'ZH');
INSERT INTO @tbl VALUES ('Dnipropetrovs''k'            ,	     'Zhovtovods''ka',	'DP',	'ZH');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Zhydachivs''kyi',	'LV',	'ZD');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Zhytomyrs''ka',	'ZT',	'ZM');
INSERT INTO @tbl VALUES ('Zhytomyr'            ,	     'Zhytomyrs''kyi',	'ZT',	'ZR');
INSERT INTO @tbl VALUES ('Poltava'            ,	     'Zin''kivs''kyi',	'PL',	'ZI');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Zmiivs''kyi',	'KK',	'ZM');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Znamians''ka',	'KH',	'ZM');
INSERT INTO @tbl VALUES ('Kirovohrad'            ,	     'Znamians''kyi',	'KH',	'ZR');
INSERT INTO @tbl VALUES ('Kharkiv'            ,	     'Zolochivs''kyi',	'KK',	'ZO');
INSERT INTO @tbl VALUES ('L''viv'            ,	     'Zolochivs''kyi',	'LV',	'ZO');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Zolotonis''ka',	'CK',	'ZM');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Zolotonis''kyi',	'CK',	'ZR');
INSERT INTO @tbl VALUES ('Cherkasy'            ,	     'Zvenyhorods''kyi',	'CK',	'ZV');

SET NOCOUNT OFF

INSERT INTO level_1_address_components ( country_id, level_1_address_component_nm, level_1_address_component_cd ) 
	SELECT	DISTINCT @country_id, level_1_nm, level_1_cd
	FROM	@tbl;

-- ======================================================================


INSERT INTO level_2_address_components ( level_2_address_component_nm, level_2_address_component_cd, level_1_address_component_id )
	SELECT	level_2_nm, level_2_cd, level_1_address_component_id
	FROM	@tbl	t
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

