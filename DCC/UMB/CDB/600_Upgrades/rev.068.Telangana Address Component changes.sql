BEGIN TRAN;
--ROLLBACK;
--COMMIT;

DECLARE
	@fdt	DATE	=	GETDATE(),
	@tdt	DATE	=	'31 Dec 9999',
	@al		INTEGER,	--	audit_log_id
	@sid	INTEGER,	--	State ID
	@d_cd	VARCHAR (10),	--	Code for the new district
	@cnt1	INTEGER,
	@cnt2	INTEGER,
	@cnt3	INTEGER;

DECLARE	@l2_renames	TABLE
	(	l2_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l2_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL
	);

DECLARE	@l3_renames	TABLE
	(	l3_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l3_nm	VARCHAR (40)	NOT	NULL,
		new_nm	VARCHAR (40)	NOT	NULL
	);

DECLARE	@ineffective_districts	TABLE
	(	d_id	INTEGER			PRIMARY	KEY,
		d_nm	VARCHAR (40)	UNIQUE
	);

DECLARE	@districts	TABLE
	(	d_cd	VARCHAR (10)	PRIMARY	KEY,
		d_nm	VARCHAR (40)	UNIQUE
	);

DECLARE	@l3_components	TABLE
	(	d_cd	VARCHAR (10)	NOT	NULL,
		l3_cd	VARCHAR (10)		NULL,
		l3_nm	VARCHAR (40)	NOT	NULL,
--			PRIMARY	KEY	(	d_cd, l3_cd	),
			UNIQUE		(	d_cd, l3_nm	)
	);

SELECT	@sid = level_1_address_component_id
FROM	level_1_address_components
WHERE	level_1_address_component_nm = 'Telangana';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev068', 'Telangana-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();


--	==================================================
--	New Districts and their Level 3 components
--	==================================================

SET @d_cd = 'HK';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Hanmakonda'	);
SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Hanmakonda'	),
										(	@d_cd,	'Parkal'		);
SET @cnt2 = @@ROWCOUNT;

DECLARE	@tbl	TABLE
	(	nm		VARCHAR (40)	PRIMARY KEY	);

INSERT INTO	@tbl	VALUES
		( 'Allipur'), ( 'Ambala'), ( 'Ammavaripet'), ( 'Arvapalle'), ( 'Baopet'), ( 'Battupalli'), ( 'Bheemadevarapalli'), ( 'Bhimaram'), ( 'Bhimpalle'), ( 'Bollikunta Sangam'), ( 'Chinthagattu'),
		( 'Damera'), ( 'Dandepalli'), ( 'Deshaipeta'), ( 'Desharajpalle'), ( 'Devannapet'), ( 'Devnoor'), ( 'Dharmapur'), ( 'Dharmasagar'), ( 'Elkathurthi'), ( 'Elkurthy'), ( 'Enumamula'),
		( 'Errabelli'), ( 'Gadepalle'), ( 'Garmillapalle'), ( 'Gatlanarsingapur'), ( 'Girmajipet'), ( 'Gopalpur'), ( 'Gudur'), ( 'Gunded'), ( 'Gundla Sagar'), ( 'Guniparthi'), ( 'Hasanparthy'),
		( 'Inavolu'), ( 'Jaigiri'), ( 'Jeelgul'), ( 'Jhanakipur'), ( 'Jujnoor'), ( 'Kadipikonda'), ( 'Kakkiralapalli'), ( 'Kamalapur'), ( 'Kammaripet'), ( 'Kanapatrthy'), ( 'Kaniparthi'),
		( 'Kannaram Bheemdevrapalli'), ( 'Kannur'), ( 'Keshawapur'), ( 'Khazipet'), ( 'Khila Warangal'), ( 'Kondaparthy'), ( 'Koppur'), ( 'Kothakonda'), ( 'Kothapalle'), ( 'Kothapalli'), ( 'Kothapet Hanamkonda'),
		( 'Kothulnaduma'), ( 'Kumarpalle'), ( 'Kyathampalli'), ( 'Laknavaram'), ( 'Lashkarsingaram'), ( 'Laxmipur'), ( 'Madannapeta'), ( 'Maddelagudem'), ( 'Madikonda'), ( 'Mallakpalli'), ( 'Mallaram'),
		( 'Mallareddipalle'), ( 'Mallikudurla'), ( 'Mamnoor'), ( 'Manikyapur'), ( 'Marripalligudem'), ( 'Mattewada'), ( 'Mulkanoor'), ( 'Mupparam'), ( 'Musthafpur'), ( 'Mutcherla'), ( 'Mutharam'),
		( 'Nagaram'), ( 'Nakkalapalli'), ( 'Nandanam'), ( 'Narayanagiri'), ( 'Nerella'), ( 'Paidipally'), ( 'Palivelpula'), ( 'Panthini'), ( 'Peddapendyal'), ( 'Peechara'), ( 'Pegadapalle'),
		( 'Pembarthy'), ( 'Penchikalapeta'), ( 'Punnole'), ( 'Ramannapet'), ( 'Rampur'), ( 'Rangasaipet'), ( 'Ratnagiri'), ( 'Sanigaram'), ( 'Shalapally'), ( 'Shaympet'), ( 'Siddhapoor'),
		( 'Singaram'), ( 'Sodashapalli'), ( 'Somadevrapalli'), ( 'Somidi'), ( 'Stambampalle'), ( 'Sudanpalle'), ( 'Suraram'), ( 'Tharalapalli'), ( 'Thatikayala'), ( 'Thimmapur Hanamkonda'), ( 'Thimmapur'),
		( 'Unikicherla'), ( 'Uppal'), ( 'Urus Warangal'), ( 'Vallabhapur'), ( 'Vanamala Hanamkonda'), ( 'Vangapahad'), ( 'Vangapalle'), ( 'Vangara'), ( 'Vasanthapur Geesugonda'), ( 'Veeranarayanapur'), ( 'Velair'),
		( 'Venkatapuram Zaffargadh'), ( 'Venkateswarlapally'), ( 'Waddepally'), ( 'Warangal'), ( 'Yellapur');
INSERT	INTO	@l3_components	(	d_cd, l3_nm	)
	SELECT	@d_cd, nm
	FROM	@tbl;

SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================
--	Remove if any existing from Warrangal District (23)
--	==================================================

UPDATE	l3
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
FROM	level_3_address_components	l3
	JOIN	@l3_components	d
		ON	(	l3.level_3_address_component_nm	=	d.l3_nm
			AND	l3.level_2_address_component_id	=	23
			);


--	==================================================
--	==================================================

SET @d_cd = 'BK';		--	Bhadradri Kothagudem

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Allapalli'       	),
										(	@d_cd,	'Annapureddypalli'  ),
										(	@d_cd,	'Aswapuram'         ),
										(	@d_cd,	'Aswaraopeta'       ),
										(	@d_cd,	'Bhadrachalam'      ),
										(	@d_cd,	'Burgampadu'        ),
										(	@d_cd,	'Chandrugonda'      ),
										(	@d_cd,	'Cherla'            ),
										(	@d_cd,	'Chunchupalli'      ),
										(	@d_cd,	'Dammapeta'         ),
										(	@d_cd,	'Dummugudem'        ),
										(	@d_cd,	'Gundala'           ),
										(	@d_cd,	'Julurupadu'        ),
										(	@d_cd,	'Karakagudem'       ),
										(	@d_cd,	'Laxmidevipalli'    ),
										(	@d_cd,	'Manuguru'          ),
										(	@d_cd,	'Mulakalapally'     ),
										(	@d_cd,	'Palvancha'         ),
										(	@d_cd,	'Pinapaka'          ),
										(	@d_cd,	'Sarapaka'          ),
										(	@d_cd,	'SujathaNagar'      ),
										(	@d_cd,	'Tekulapally'       ),
										(	@d_cd,	'Yellandu'          );
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================

SET @d_cd = 'JT';		--	Jagitial

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Beerpur'       	),
										(	@d_cd,	'Buggaram'      	),
										(	@d_cd,	'Dharmapuri'    	),
										(	@d_cd,	'Gollapalli'    	),
										(	@d_cd,	'Jagitial Urban'	),
										(	@d_cd,	'Jagitial Rural'	),
										(	@d_cd,	'Kodimial'      	),
										(	@d_cd,	'Mallial'       	),
										(	@d_cd,	'Pegadapalli'   	),
										(	@d_cd,	'Raikal'        	),
										(	@d_cd,	'Sarangapur'    	),
										(	@d_cd,	'Velgatoor'     	),
										(	@d_cd,	'METPALLY'      	),
										(	@d_cd,	'Ibrahimpatnam' 	),
										(	@d_cd,	'Mallapur'      	),
										(	@d_cd,	'Kathalapur'    	),
										(	@d_cd,	'Korutla'       	),
										(	@d_cd,	'Medipalli'     	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'JN';		--	Jangaon

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Abdulnagaram'          	),
										(	@d_cd,	'Adavikeshvapur'        	),
										(	@d_cd,	'Akkerajepalle'         	),
										(	@d_cd,	'Alimpur'               	),
										(	@d_cd,	'Aliyabad'              	),
										(	@d_cd,	'Ammapur'               	),
										(	@d_cd,	'Ankushapuram'          	),
										(	@d_cd,	'Ashwaraopalle'         	),
										(	@d_cd,	'Ayyangaripalle'        	),
										(	@d_cd,	'Bachannapet'           	),
										(	@d_cd,	'Bandanagaram'          	),
										(	@d_cd,	'Basireddipalle'        	),
										(	@d_cd,	'Bhanjipeta'            	),
										(	@d_cd,	'Bommakur'              	),
										(	@d_cd,	'Bommera'               	),
										(	@d_cd,	'Bonthagattunagaram'    	),
										(	@d_cd,	'Chagal'                	),
										(	@d_cd,	'Cheetakodur'           	),
										(	@d_cd,	'Cheeturu'              	),
										(	@d_cd,	'Chennur'               	),
										(	@d_cd,	'Chilpur'               	),
										(	@d_cd,	'Chinnapendyala'        	),
										(	@d_cd,	'Chinnarajpet'          	),
										(	@d_cd,	'Chinnaramancherla'     	),
										(	@d_cd,	'Chowdaram'             	),
										(	@d_cd,	'Chowdarpalle'          	),
										(	@d_cd,	'Chowdur'               	),
										(	@d_cd,	'Dardepalle'            	),
										(	@d_cd,	'Devaruppula'           	),
										(	@d_cd,	'Dharamapur'            	),
										(	@d_cd,	'Dubbaguntapalle'       	),
										(	@d_cd,	'Edunuthala'            	),
										(	@d_cd,	'Fathepur'              	),
										(	@d_cd,	'Fatheshapur'           	),
										(	@d_cd,	'Gabbeta'               	),
										(	@d_cd,	'Gandiramaram'          	),
										(	@d_cd,	'Gangapur'              	),
										(	@d_cd,	'Gangupahad'            	),
										(	@d_cd,	'Ghanpur'               	),
										(	@d_cd,	'Gollapalle'            	),
										(	@d_cd,	'Goparajpalle'          	),
										(	@d_cd,	'Govardhanagiri'        	),
										(	@d_cd,	'Gudur'                 	),
										(	@d_cd,	'Guduru'                	),
										(	@d_cd,	'Gummadavelli'          	),
										(	@d_cd,	'Hanmanthapur'          	),
										(	@d_cd,	'Ibrahimpur'            	),
										(	@d_cd,	'Ippagudem'             	),
										(	@d_cd,	'Iravennu'              	),
										(	@d_cd,	'Itikyalapalle'         	),
										(	@d_cd,	'Jeedikal'              	),
										(	@d_cd,	'Kadavendi'             	),
										(	@d_cd,	'Kallem'                	),
										(	@d_cd,	'Kalvalapalle'          	),
										(	@d_cd,	'Kanchanpalle'          	),
										(	@d_cd,	'Kannaipalle'           	),
										(	@d_cd,	'Katkoor'               	),
										(	@d_cd,	'Kesireddipalle'        	),
										(	@d_cd,	'Kodakandla'            	),
										(	@d_cd,	'Kodavatoor'            	),
										(	@d_cd,	'Koduru'                	),
										(	@d_cd,	'Kolkonda'              	),
										(	@d_cd,	'Komalla'               	),
										(	@d_cd,	'Konaichelam'           	),
										(	@d_cd,	'Kondapur'              	),
										(	@d_cd,	'Kondapuram'            	),
										(	@d_cd,	'Konne'                 	),
										(	@d_cd,	'Kothalabad'            	),
										(	@d_cd,	'Kothapalle'            	),
										(	@d_cd,	'Kothapalli'            	),
										(	@d_cd,	'Krishnajigudem'        	),
										(	@d_cd,	'Kundaram'              	),
										(	@d_cd,	'Kunoor Thamadapalle'   	),
										(	@d_cd,	'Kurchapalle'           	),
										(	@d_cd,	'Lakshmakkapalle'       	),
										(	@d_cd,	'Lakshmapur'            	),
										(	@d_cd,	'Lakshminarayana Puram' 	),
										(	@d_cd,	'Lingalaghanpur'        	),
										(	@d_cd,	'Lingampalle'           	),
										(	@d_cd,	'Lingampalli'           	),
										(	@d_cd,	'Machupahad'            	),
										(	@d_cd,	'Madhapuram'            	),
										(	@d_cd,	'Madharam'              	),
										(	@d_cd,	'Madoorkalan'           	),
										(	@d_cd,	'Madoorkhurd'           	),
										(	@d_cd,	'Mailaram'              	),
										(	@d_cd,	'Malakpet'              	),
										(	@d_cd,	'Malkapur'              	),
										(	@d_cd,	'Mallampalle'           	),
										(	@d_cd,	'Manchuppula'           	),
										(	@d_cd,	'Manpahad'              	),
										(	@d_cd,	'Mansanpalle'           	),
										(	@d_cd,	'Marigadi'              	),
										(	@d_cd,	'Meedigonda'            	),
										(	@d_cd,	'Mekalagattu'           	),
										(	@d_cd,	'Mondrai'               	),
										(	@d_cd,	'Mutharam'              	),
										(	@d_cd,	'Nagaram'               	),
										(	@d_cd,	'Nagireddipalle'        	),
										(	@d_cd,	'Namilakonda'           	),
										(	@d_cd,	'Narayanapur'           	),
										(	@d_cd,	'Narmetta'              	),
										(	@d_cd,	'Narsapur'              	),
										(	@d_cd,	'Narsingapur'           	),
										(	@d_cd,	'Nashkal'               	),
										(	@d_cd,	'Neermiala'             	),
										(	@d_cd,	'Nellutla'              	),
										(	@d_cd,	'Nidigonda'             	),
										(	@d_cd,	'Nyalapogula'           	),
										(	@d_cd,	'Oblakeshvapur'         	),
										(	@d_cd,	'Obulapur'              	),
										(	@d_cd,	'Padamati Keshavapur'   	),
										(	@d_cd,	'Pakala'                	),
										(	@d_cd,	'Palakurthi'            	),
										(	@d_cd,	'Pallagutta'            	),
										(	@d_cd,	'Pamunuru'              	),
										(	@d_cd,	'Pasarmadla'            	),
										(	@d_cd,	'Peddapahad'            	),
										(	@d_cd,	'Peddaramancherla'      	),
										(	@d_cd,	'Pembarthy'             	),
										(	@d_cd,	'Pochannapet'           	),
										(	@d_cd,	'Potharam'              	),
										(	@d_cd,	'Pullaguda'             	),
										(	@d_cd,	'Quileshapur'           	),
										(	@d_cd,	'Raghavapur'            	),
										(	@d_cd,	'Raghunathpalle'        	),
										(	@d_cd,	'Rajavaram'             	),
										(	@d_cd,	'Ramachandrapur'        	),
										(	@d_cd,	'Ramavaram'             	),
										(	@d_cd,	'Ramrajpalle'           	),
										(	@d_cd,	'Rangapur'              	),
										(	@d_cd,	'Regula'                	),
										(	@d_cd,	'Sagaram'               	),
										(	@d_cd,	'Salvapur'              	),
										(	@d_cd,	'Samudrala'             	),
										(	@d_cd,	'Shamirpet'             	),
										(	@d_cd,	'Shapalle Thammadapalle'	),
										(	@d_cd,	'Shatapuram'            	),
										(	@d_cd,	'Shivunipalli'          	),
										(	@d_cd,	'Siddenki'              	),
										(	@d_cd,	'Singarajpalle'         	),
										(	@d_cd,	'Siripuram'             	),
										(	@d_cd,	'Solipuram'             	),
										(	@d_cd,	'Sreepathipalli'        	),
										(	@d_cd,	'Srimannarayanapur'     	),
										(	@d_cd,	'Suraram'               	),
										(	@d_cd,	'Tammadapalle'          	),
										(	@d_cd,	'Thanadarpalli'         	),
										(	@d_cd,	'Tharigoppula'          	),
										(	@d_cd,	'Thatikonda'            	),
										(	@d_cd,	'Theegaram'             	),
										(	@d_cd,	'Thidugu'               	),
										(	@d_cd,	'Thimmampet'            	),
										(	@d_cd,	'Thimmapur'             	),
										(	@d_cd,	'Thirmalagiri'          	),
										(	@d_cd,	'Thorrur'               	),
										(	@d_cd,	'Uppugal'               	),
										(	@d_cd,	'Valmidi'               	),
										(	@d_cd,	'Vanaparthy'            	),
										(	@d_cd,	'Vavilala'              	),
										(	@d_cd,	'Veldanda'              	),
										(	@d_cd,	'Veldi'                 	),
										(	@d_cd,	'Venkatadripet'         	),
										(	@d_cd,	'Venkriyala'            	),
										(	@d_cd,	'Vishwanathpur'         	),
										(	@d_cd,	'Visnoor'               	),
										(	@d_cd,	'Waddicherla'           	),
										(	@d_cd,	'Wadlakonda'            	),
										(	@d_cd,	'Yellamla'              	),
										(	@d_cd,	'Yerragollapahad'       	),
										(	@d_cd,	'Yeswanthapur'          	),
										(	@d_cd,	'Zaffergadh'            	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'JB';		--	Jayashankar Bhupalpally

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Adivarampet'             	),
										(	@d_cd,	'Advalapally'             	),
										(	@d_cd,	'Akinepalle'              	),
										(	@d_cd,	'Ambatipalli'             	),
										(	@d_cd,	'Amudalapally'            	),
										(	@d_cd,	'Andukuthanda'            	),
										(	@d_cd,	'Ankusapur'               	),
										(	@d_cd,	'Ankushapur'              	),
										(	@d_cd,	'Annaram'                 	),
										(	@d_cd,	'Ansanpalli'              	),
										(	@d_cd,	'Appaiahpally'            	),
										(	@d_cd,	'Arepally'                	),
										(	@d_cd,	'Ashireddipalle'          	),
										(	@d_cd,	'Azamnagar'               	),
										(	@d_cd,	'Bandapally'              	),
										(	@d_cd,	'Banglapally'             	),
										(	@d_cd,	'Baswarajpalle'           	),
										(	@d_cd,	'Bavusinghpally'          	),
										(	@d_cd,	'Bayyaram'                	),
										(	@d_cd,	'Begloor'                 	),
										(	@d_cd,	'Bhagirthipeta'           	),
										(	@d_cd,	'Bhavusinghpalle'         	),
										(	@d_cd,	'Bommapur'                	),
										(	@d_cd,	'Borlagudem'              	),
										(	@d_cd,	'Bornapalle'              	),
										(	@d_cd,	'Brahmanapally'           	),
										(	@d_cd,	'Budharam'                	),
										(	@d_cd,	'Burrakayalagudem'        	),
										(	@d_cd,	'Chainpaka'               	),
										(	@d_cd,	'Challagarige'            	),
										(	@d_cd,	'Chandrupally'            	),
										(	@d_cd,	'Chelpur'                 	),
										(	@d_cd,	'Chenchupally'            	),
										(	@d_cd,	'Chennapoor'              	),
										(	@d_cd,	'Chidnepalli'             	),
										(	@d_cd,	'Chinathundla'            	),
										(	@d_cd,	'Chinnakodepaka'          	),
										(	@d_cd,	'Chintakani'              	),
										(	@d_cd,	'Chinthakuntaramaiahpally'	),
										(	@d_cd,	'Chinthalapalle'          	),
										(	@d_cd,	'Chityal'                 	),
										(	@d_cd,	'Damaranchapally'         	),
										(	@d_cd,	'Damerakunta'             	),
										(	@d_cd,	'Dammannapet'             	),
										(	@d_cd,	'Dammur'                  	),
										(	@d_cd,	'Deekshakunta'            	),
										(	@d_cd,	'Dhanwada'                	),
										(	@d_cd,	'Dharmaraopet'            	),
										(	@d_cd,	'Dharmasagar'             	),
										(	@d_cd,	'Doothpalle'              	),
										(	@d_cd,	'Dubbapeta'               	),
										(	@d_cd,	'Dubyala'                 	),
										(	@d_cd,	'Dudekulapalle'           	),
										(	@d_cd,	'Dumpillapally'           	),
										(	@d_cd,	'Dwarakapet'              	),
										(	@d_cd,	'Edapally'                	),
										(	@d_cd,	'Edlapalli'               	),
										(	@d_cd,	'Elekeshwaram'            	),
										(	@d_cd,	'Ellareddypally'          	),
										(	@d_cd,	'Empaid'                  	),
										(	@d_cd,	'Enkapalli'               	),
										(	@d_cd,	'Gandhinagar'             	),
										(	@d_cd,	'Gandikamaram'            	),
										(	@d_cd,	'Gangaram'                	),
										(	@d_cd,	'Garmillapalle'           	),
										(	@d_cd,	'Geneshpalle'             	),
										(	@d_cd,	'Ghanpur'                 	),
										(	@d_cd,	'Giddemutharam'           	),
										(	@d_cd,	'Gollabudharam'           	),
										(	@d_cd,	'Gollapally'              	),
										(	@d_cd,	'Gopalapur'               	),
										(	@d_cd,	'Gorlaveedu'              	),
										(	@d_cd,	'Gudadpalle'              	),
										(	@d_cd,	'Gudepalle'               	),
										(	@d_cd,	'Gudipahad'               	),
										(	@d_cd,	'Gummadavelli'            	),
										(	@d_cd,	'Gummalapalli'            	),
										(	@d_cd,	'Gundlakarthi'            	),
										(	@d_cd,	'Gundurathpalli'          	),
										(	@d_cd,	'Gunturpally'             	),
										(	@d_cd,	'Gurrampet'               	),
										(	@d_cd,	'Ibrahimpalli'            	),
										(	@d_cd,	'Ijjaiahpally'            	),
										(	@d_cd,	'Ippalapalli'             	),
										(	@d_cd,	'Ippalapally'             	),
										(	@d_cd,	'Issipet'                 	),
										(	@d_cd,	'Jadalpet'                	),
										(	@d_cd,	'Jadaraopet'              	),
										(	@d_cd,	'Jaggaiahpet'             	),
										(	@d_cd,	'Jeelapally'              	),
										(	@d_cd,	'Jookal'                  	),
										(	@d_cd,	'Kailapur'                	),
										(	@d_cd,	'Kaleshwaram'             	),
										(	@d_cd,	'Kalvapally'              	),
										(	@d_cd,	'Kamalapur'               	),
										(	@d_cd,	'Kanaparthy'              	),
										(	@d_cd,	'Kanukunoor'              	),
										(	@d_cd,	'Karkapalle'              	),
										(	@d_cd,	'Kasulapahad'             	),
										(	@d_cd,	'Kataram'                 	),
										(	@d_cd,	'Kodavatancha'            	),
										(	@d_cd,	'Kompalli'                	),
										(	@d_cd,	'Konaraopet'              	),
										(	@d_cd,	'Kondampet'               	),
										(	@d_cd,	'Kondapur'                	),
										(	@d_cd,	'Korikishala'             	),
										(	@d_cd,	'Korlakunta'              	),
										(	@d_cd,	'Kothapalle'              	),
										(	@d_cd,	'Kothapalli'              	),
										(	@d_cd,	'Kothapalligori'          	),
										(	@d_cd,	'Kothapally'              	),
										(	@d_cd,	'Kothapeta'               	),
										(	@d_cd,	'Koyyur'                  	),
										(	@d_cd,	'Kudurupalli'             	),
										(	@d_cd,	'Kundanpalle'             	),
										(	@d_cd,	'Lambadi thanda'          	),
										(	@d_cd,	'Lambadithanda'           	),
										(	@d_cd,	'Laximipurthanda'         	),
										(	@d_cd,	'Laxmareddypally'         	),
										(	@d_cd,	'Lenkalagadda'            	),
										(	@d_cd,	'Lingala'                 	),
										(	@d_cd,	'Madathapalli'            	),
										(	@d_cd,	'Maddulapalli'            	),
										(	@d_cd,	'Maddulapally'            	),
										(	@d_cd,	'Madharam'                	),
										(	@d_cd,	'Mahaboobpalli'           	),
										(	@d_cd,	'Mahadevpoor'             	),
										(	@d_cd,	'Malhar rao'              	),
										(	@d_cd,	'Mallampally'             	),
										(	@d_cd,	'Mallaram'                	),
										(	@d_cd,	'Mandaloripally'          	),
										(	@d_cd,	'Medarametla'             	),
										(	@d_cd,	'Medipally'               	),
										(	@d_cd,	'Metpalli'                	),
										(	@d_cd,	'Mettupalle'              	),
										(	@d_cd,	'Modedu'                  	),
										(	@d_cd,	'Mogullapalle'            	),
										(	@d_cd,	'Moranchapalle'           	),
										(	@d_cd,	'Motlapalle'              	),
										(	@d_cd,	'Muchiniparthy'           	),
										(	@d_cd,	'Muknur'                  	),
										(	@d_cd,	'Mulkalapalle'            	),
										(	@d_cd,	'Mulugupalli'             	),
										(	@d_cd,	'Mutharam'                	),
										(	@d_cd,	'Mylaram'                 	),
										(	@d_cd,	'Nacharam'                	),
										(	@d_cd,	'Nagaram'                 	),
										(	@d_cd,	'Nagarampalle'            	),
										(	@d_cd,	'Nagurlapally'            	),
										(	@d_cd,	'Nallakunta'              	),
										(	@d_cd,	'Nandigama'               	),
										(	@d_cd,	'Narayanapur'             	),
										(	@d_cd,	'Narsingapur'             	),
										(	@d_cd,	'Nasturpalli'             	),
										(	@d_cd,	'Nawabpeta'               	),
										(	@d_cd,	'Neelampally'             	),
										(	@d_cd,	'Neredpalle'              	),
										(	@d_cd,	'Nimmagudem'              	),
										(	@d_cd,	'Ninepaka'                	),
										(	@d_cd,	'Nizampalli'              	),
										(	@d_cd,	'Odipilavancha'           	),
										(	@d_cd,	'Palgula'                 	),
										(	@d_cd,	'Palimela'                	),
										(	@d_cd,	'Pambapur'                	),
										(	@d_cd,	'Pangidipalle'            	),
										(	@d_cd,	'Pankena'                 	),
										(	@d_cd,	'Parlapalle'              	),
										(	@d_cd,	'Parushurampally'         	),
										(	@d_cd,	'Pashigaddathanda'        	),
										(	@d_cd,	'Patha issipeta'          	),
										(	@d_cd,	'Peddakomatipalle'        	),
										(	@d_cd,	'Peddamapally'            	),
										(	@d_cd,	'Peddampally'             	),
										(	@d_cd,	'Peddampet'               	),
										(	@d_cd,	'Peddapur'                	),
										(	@d_cd,	'Peddathundla'            	),
										(	@d_cd,	'Pegadapally'             	),
										(	@d_cd,	'Pidisilla'               	),
										(	@d_cd,	'Pochampalli'             	),
										(	@d_cd,	'Polaram'                 	),
										(	@d_cd,	'Ponugondla'              	),
										(	@d_cd,	'Pothugul'                	),
										(	@d_cd,	'Prathapagiri'            	),
										(	@d_cd,	'Premnagar'               	),
										(	@d_cd,	'Raghavapur'              	),
										(	@d_cd,	'Raghavareddipet'         	),
										(	@d_cd,	'Rajakkapally'            	),
										(	@d_cd,	'Ramagundalapally'        	),
										(	@d_cd,	'Ramakishthapur'          	),
										(	@d_cd,	'Ramakistapur'            	),
										(	@d_cd,	'Ramannagudem'            	),
										(	@d_cd,	'Rampur'                  	),
										(	@d_cd,	'Ranagaiahpalli'          	),
										(	@d_cd,	'Rangapuram'              	),
										(	@d_cd,	'Rapally kota'            	),
										(	@d_cd,	'Reddipalli'              	),
										(	@d_cd,	'Regonda'                 	),
										(	@d_cd,	'Regulagudem'             	),
										(	@d_cd,	'Repaka palli'            	),
										(	@d_cd,	'Repaka'                  	),
										(	@d_cd,	'Roopireddi palli'        	),
										(	@d_cd,	'Royapalli'               	),
										(	@d_cd,	'Rudraram'                	),
										(	@d_cd,	'Sarvaipet'               	),
										(	@d_cd,	'Seetharampur'            	),
										(	@d_cd,	'Shamnagar'               	),
										(	@d_cd,	'Shankarpalli'            	),
										(	@d_cd,	'Singampalli'             	),
										(	@d_cd,	'Singaram'                	),
										(	@d_cd,	'Somanapelli'             	),
										(	@d_cd,	'Stambampally'            	),
										(	@d_cd,	'Subbakkapalle'           	),
										(	@d_cd,	'Subbakkapally'           	),
										(	@d_cd,	'Sulthanpur'              	),
										(	@d_cd,	'Suraram'                 	),
										(	@d_cd,	'Tekumatla'               	),
										(	@d_cd,	'Thadicherla'             	),
										(	@d_cd,	'Thirumalapur'            	),
										(	@d_cd,	'Tirumalagiri'            	),
										(	@d_cd,	'Vajinepalli'             	),
										(	@d_cd,	'Vajnapally'              	),
										(	@d_cd,	'Vallamkunta'             	),
										(	@d_cd,	'Varikolpally'            	),
										(	@d_cd,	'Veerapur'                	),
										(	@d_cd,	'Velchal'                 	),
										(	@d_cd,	'Vellampalle'             	),
										(	@d_cd,	'Vemulapalle'             	),
										(	@d_cd,	'Vencharami'              	),
										(	@d_cd,	'Venkateshwarlapally'     	),
										(	@d_cd,	'Venkateshwarlaplly'      	),
										(	@d_cd,	'Venkatraopalle'          	),
										(	@d_cd,	'Vilasagar'               	),
										(	@d_cd,	'Vodithal'                	),
										(	@d_cd,	'Yamanpally'              	),
										(	@d_cd,	'Yatnaram'                	),
										(	@d_cd,	'Yelletiramaiahpally'     	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'JG';		--	Jogulamba Gadwal

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Aiza'               	),
										(	@d_cd,	'Alampur'            	),
										(	@d_cd,	'Dharoor'            	),
										(	@d_cd,	'Gattu'              	),
										(	@d_cd,	'Itikyala'           	),
										(	@d_cd,	'Kalur Thimman Doddi'	),
										(	@d_cd,	'Maldakal'           	),
										(	@d_cd,	'Manopad'            	),
										(	@d_cd,	'Rajoli'             	),
										(	@d_cd,	'Undavelly'          	),
										(	@d_cd,	'Waddepally'         	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = '024';		--	Kamareddy

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Banswada'      	),
										(	@d_cd,	'Bhiknoor'      	),
										(	@d_cd,	'Bibipet'       	),
										(	@d_cd,	'Bichkunda'     	),
										(	@d_cd,	'Birkoor'       	),
										(	@d_cd,	'Domakonda'     	),
										(	@d_cd,	'Gandhari'      	),
										(	@d_cd,	'Jukkal'        	),
										(	@d_cd,	'Lingampet'     	),
										(	@d_cd,	'Machareddy'    	),
										(	@d_cd,	'Madnoor'       	),
										(	@d_cd,	'Nagareddipet'  	),
										(	@d_cd,	'Nasrullabad'   	),
										(	@d_cd,	'Nizamsagar'    	),
										(	@d_cd,	'Pedda Kodapgal'	),
										(	@d_cd,	'Pitlam'        	),
										(	@d_cd,	'Rajampet'      	),
										(	@d_cd,	'Ramareddy'     	),
										(	@d_cd,	'Sadasivanagar' 	),
										(	@d_cd,	'Tadwai'        	),
										(	@d_cd,	'Yellareddy'    	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'KB';		--	Kumuram Bheem

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Jainoor'          	),
										(	@d_cd,	'Kerameri'         	),
										(	@d_cd,	'Rebbena'          	),
										(	@d_cd,	'Tiryani'          	),
										(	@d_cd,	'Wankidi'          	),
										(	@d_cd,	'Sirpur-U'         	),
										(	@d_cd,	'Lingapur'         	),
										(	@d_cd,	'Kagaznagar'       	),
										(	@d_cd,	'Bejjur'           	),
										(	@d_cd,	'Koutala'          	),
										(	@d_cd,	'Sirpur-T'         	),
										(	@d_cd,	'Dahegaon'         	),
										(	@d_cd,	'Chintalamanepalli'	),
										(	@d_cd,	'Penchikalpet'     	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'MB';		--	Mahabubabad

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Kuravi'       	),
										(	@d_cd,	'Kesamudram'   	),
										(	@d_cd,	'Dornakal'     	),
										(	@d_cd,	'Gudur'        	),
										(	@d_cd,	'Kothaguda'    	),
										(	@d_cd,	'Gangaram'     	),
										(	@d_cd,	'Bayyaram'     	),
										(	@d_cd,	'Garla'        	),
										(	@d_cd,	'Chinnagudur'  	),
										(	@d_cd,	'Danthalapally'	),
										(	@d_cd,	'Thorrur'      	),
										(	@d_cd,	'Nellikudur'   	),
										(	@d_cd,	'Maripeda'     	),
										(	@d_cd,	'Narsimhulapet'	),
										(	@d_cd,	'Peddavangara' 	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'MR';		--	Mancherial

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Chennur'        	),
										(	@d_cd,	'Jaipur'         	),
										(	@d_cd,	'Bheemaram (new)'	),
										(	@d_cd,	'Kotapally'      	),
										(	@d_cd,	'Luxettipet'     	),
										(	@d_cd,	'Naspur'         	),
										(	@d_cd,	'Hajipur'        	),
										(	@d_cd,	'Mandamarri'     	),
										(	@d_cd,	'Dandepally'     	),
										(	@d_cd,	'Jannaram'       	),
										(	@d_cd,	'Kasipet'        	),
										(	@d_cd,	'Bellampally'    	),
										(	@d_cd,	'Vemanpally'     	),
										(	@d_cd,	'Nennel'         	),
										(	@d_cd,	'Tandur'         	),
										(	@d_cd,	'Bheemini'       	),
										(	@d_cd,	'Kannepally'     	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'MM';		--	Medchal–Malkajgiri

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Alwal'                 	),
										(	@d_cd,	'Medchal'               	),
										(	@d_cd,	'Medipally'             	),
										(	@d_cd,	'Quthbullapur'          	),
										(	@d_cd,	'Uppal'                 	),
										(	@d_cd,	'Bachupally'            	),
										(	@d_cd,	'Balanagar'             	),
										(	@d_cd,	'Dundigal Gandimaisamma'	),
										(	@d_cd,	'Ghatkesar'             	),
										(	@d_cd,	'Muduchintalpalli'         	),
										(	@d_cd,	'Kapra'                 	),
										(	@d_cd,	'Keesara'               	),
										(	@d_cd,	'Kukatpally'            	),
										(	@d_cd,	'Malkajgiri'            	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'MU';		--	Mulugu

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Venkatapur'   	),
										(	@d_cd,	'Govindaraopet'	),
										(	@d_cd,	'Eturnagaram'  	),
										(	@d_cd,	'Mangapet'     	),
										(	@d_cd,	'Kannaigudem'  	),
										(	@d_cd,	'S S Tadvai'   	),
										(	@d_cd,	'Venkatapuram' 	),
										(	@d_cd,	'Wazeedu'      	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'NK';		--	Nagarkurnool

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Bijinapally'    	),
										(	@d_cd,	'Tadoor'         	),
										(	@d_cd,	'Thimmajipet'    	),
										(	@d_cd,	'Telkapally'     	),
										(	@d_cd,	'Peddakothapally'	),
										(	@d_cd,	'Kollapur'       	),
										(	@d_cd,	'Pentlavelli'    	),
										(	@d_cd,	'Kodair'         	),
										(	@d_cd,	'Padara'         	),
										(	@d_cd,	'Lingala'        	),
										(	@d_cd,	'Balmoor'        	),
										(	@d_cd,	'Uppununtala'    	),
										(	@d_cd,	'Achampet'       	),
										(	@d_cd,	'Amrabad'        	),
										(	@d_cd,	'Kalwakurty'     	),
										(	@d_cd,	'Veldanda'       	),
										(	@d_cd,	'Vangoor'        	),
										(	@d_cd,	'Charakonda'     	),
										(	@d_cd,	'Urkonda'        	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'NP';		--	Narayanpet

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'DAMARGIDDA'	),
										(	@d_cd,	'DHANWADA'  	),
										(	@d_cd,	'KOSGI'     	),
										(	@d_cd,	'KRISHNA'   	),
										(	@d_cd,	'MADDUR'    	),
										(	@d_cd,	'MAGANOOR'  	),
										(	@d_cd,	'MAKTHAL'   	),
										(	@d_cd,	'MARIKAL'   	),
										(	@d_cd,	'NARWA'     	),
										(	@d_cd,	'UTKOOR'    	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'N';		--	Nirmal

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Dilawarpur'    	),
										(	@d_cd,	'Kaddem'        	),
										(	@d_cd,	'Khanapur'      	),
										(	@d_cd,	'Laxmanchanda'  	),
										(	@d_cd,	'Mamada'        	),
										(	@d_cd,	'Sarangapur'    	),
										(	@d_cd,	'Soan'          	),
										(	@d_cd,	'Nirmal (Rural)'	),
										(	@d_cd,	'Narsapur'      	),
										(	@d_cd,	'Pembi'         	),
										(	@d_cd,	'Dasturabad'    	),
										(	@d_cd,	'Bhainsa'       	),
										(	@d_cd,	'Kubeer'        	),
										(	@d_cd,	'Kuntala'       	),
										(	@d_cd,	'Lokeshwaram'   	),
										(	@d_cd,	'Mudhole'       	),
										(	@d_cd,	'Tanoor'        	),
										(	@d_cd,	'Basar'         	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'PP';		--	Peddapalli

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Anthergoan'     	),
										(	@d_cd,	'Kalvasrirampoor'	),
										(	@d_cd,	'Eligaid'        	),
										(	@d_cd,	'Julapalli'      	),
										(	@d_cd,	'Odela'          	),
										(	@d_cd,	'Palakurthy'     	),
										(	@d_cd,	'Dharmaram'      	),
										(	@d_cd,	'Sulthanabad'    	),
										(	@d_cd,	'Ramagundam'     	),
										(	@d_cd,	'Kamanpoor'      	),
										(	@d_cd,	'Manthani'       	),
										(	@d_cd,	'Mutharam'       	),
										(	@d_cd,	'Ramaguiri'      	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'RS';		--	Rajanna Sircilla

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Boinpally'             	),
										(	@d_cd,	'Chandurthy'            	),
										(	@d_cd,	'Ellanthakunta'         	),
										(	@d_cd,	'Gambhiraopet'          	),
										(	@d_cd,	'Konaraopet'            	),
										(	@d_cd,	'Mustabad'              	),
										(	@d_cd,	'Rudrangi'              	),
										(	@d_cd,	'Rajanna Sircilla Urban'	),
										(	@d_cd,	'Thangallapalli'        	),
										(	@d_cd,	'Vemulawada'            	),
										(	@d_cd,	'Vemulawada Rural'      	),
										(	@d_cd,	'Veernapalli'           	),
										(	@d_cd,	'Yellareddipet'         	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'SR';		--	Sangareddy

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Kandi'          	),
										(	@d_cd,	'Kondapur'       	),
										(	@d_cd,	'Sadasivpet'     	),
										(	@d_cd,	'Patancheru'     	),
										(	@d_cd,	'Ameenpur'       	),
										(	@d_cd,	'Ramchandrapuram'	),
										(	@d_cd,	'Munipally'      	),
										(	@d_cd,	'Jinnaram'       	),
										(	@d_cd,	'Gummadidala'    	),
										(	@d_cd,	'Pulkal'         	),
										(	@d_cd,	'Andole'         	),
										(	@d_cd,	'Vatpally'       	),
										(	@d_cd,	'Hathnoora'      	),
										(	@d_cd,	'Zaheerabad'     	),
										(	@d_cd,	'Mogudampally'   	),
										(	@d_cd,	'Nyalkal'        	),
										(	@d_cd,	'Jharasangam'    	),
										(	@d_cd,	'Kohir'          	),
										(	@d_cd,	'Raikode'        	),
										(	@d_cd,	'Narayankhed'    	),
										(	@d_cd,	'Kangti'         	),
										(	@d_cd,	'Kalher'         	),
										(	@d_cd,	'Sirgapoor'      	),
										(	@d_cd,	'Manoor'         	),
										(	@d_cd,	'Nagilgidda'     	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'SP';		--	Siddipet

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Siddipet (URBAN)'	),
										(	@d_cd,	'Siddipet (RURAL)'	),
										(	@d_cd,	'Cinnakodur'      	),
										(	@d_cd,	'Nangnoor'        	),
										(	@d_cd,	'Dubbak'          	),
										(	@d_cd,	'Doulthabad'      	),
										(	@d_cd,	'Mirdoddi'        	),
										(	@d_cd,	'Thoguta'         	),
										(	@d_cd,	'Komuravelli'     	),
										(	@d_cd,	'Cheriyal'        	),
										(	@d_cd,	'Narayanaraopet'  	),
										(	@d_cd,	'Gajwel'          	),
										(	@d_cd,	'Wargal'          	),
										(	@d_cd,	'Mulugu'          	),
										(	@d_cd,	'Jagadevpur'      	),
										(	@d_cd,	'Markook'         	),
										(	@d_cd,	'Kondapak'        	),
										(	@d_cd,	'Raipole'         	),
										(	@d_cd,	'Husnabad'        	),
										(	@d_cd,	'Maddur'          	),
										(	@d_cd,	'Akkannapet'      	),
										(	@d_cd,	'Koheda'          	),
										(	@d_cd,	'Bejjanki'        	),
										(	@d_cd,	'Dhoolmitta'      	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'SU';		--	Suryapet

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Chivvemla'      	),
										(	@d_cd,	'Mothey'         	),
										(	@d_cd,	'Jajireddygudem' 	),
										(	@d_cd,	'Nuthankal'      	),
										(	@d_cd,	'Penpahad'       	),
										(	@d_cd,	'Athmakur'       	),
										(	@d_cd,	'Thirumalagiri'  	),
										(	@d_cd,	'Thungathurthy'  	),
										(	@d_cd,	'Nagaram'        	),
										(	@d_cd,	'Maddirala'      	),
										(	@d_cd,	'Chilkur'        	),
										(	@d_cd,	'Ananthagiri'    	),
										(	@d_cd,	'Kodad'          	),
										(	@d_cd,	'Munagala'       	),
										(	@d_cd,	'Nadigudem'      	),
										(	@d_cd,	'Palakeedu'      	),
										(	@d_cd,	'Huzurnagar'     	),
										(	@d_cd,	'Mellachervu'    	),
										(	@d_cd,	'Mallareddygudem'	),
										(	@d_cd,	'Mattampally'    	),
										(	@d_cd,	'Nereducherla'   	),
										(	@d_cd,	'Garidepally'    	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'VK';		--	Vikarabad

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Mominpet'   	),
										(	@d_cd,	'Marpally'   	),
										(	@d_cd,	'Bantwaram'  	),
										(	@d_cd,	'Peddemul'   	),
										(	@d_cd,	'Tandur'     	),
										(	@d_cd,	'Basheerabad'	),
										(	@d_cd,	'Yalal'      	),
										(	@d_cd,	'Dharur'     	),
										(	@d_cd,	'Nawabpet'   	),
										(	@d_cd,	'Pudur'      	),
										(	@d_cd,	'Parigi'     	),
										(	@d_cd,	'Doma'       	),
										(	@d_cd,	'Kulkacherla'	),
										(	@d_cd,	'Kotepally'  	),
										(	@d_cd,	'Bomraspet'  	),
										(	@d_cd,	'Doulthabad' 	),
										(	@d_cd,	'Kodangal'   	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'WP';		--	Wanaparthy

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Agaram'            	),
										(	@d_cd,	'Ajjakollu'         	),
										(	@d_cd,	'Almaipalle'        	),
										(	@d_cd,	'Alwal'             	),
										(	@d_cd,	'Amadabakula'       	),
										(	@d_cd,	'Amarchintha'       	),
										(	@d_cd,	'Ammaipalle'        	),
										(	@d_cd,	'Annaram'           	),
										(	@d_cd,	'Anthaipalle'       	),
										(	@d_cd,	'Apparala'          	),
										(	@d_cd,	'Appareddipalle'    	),
										(	@d_cd,	'Arepalle'          	),
										(	@d_cd,	'Atmakur'           	),
										(	@d_cd,	'Ayyavaripalle'     	),
										(	@d_cd,	'Balakistapur'      	),
										(	@d_cd,	'Balijapalle'       	),
										(	@d_cd,	'Bandapalle'        	),
										(	@d_cd,	'Bandaraipakula'    	),
										(	@d_cd,	'Bekkam'            	),
										(	@d_cd,	'Bollaram'          	),
										(	@d_cd,	'Boothpur'          	),
										(	@d_cd,	'Buddharam'         	),
										(	@d_cd,	'Bunyadpur'         	),
										(	@d_cd,	'Burdipadu'         	),
										(	@d_cd,	'Busireddipalle'    	),
										(	@d_cd,	'Chakalpalle'       	),
										(	@d_cd,	'Chandraghad'       	),
										(	@d_cd,	'Cheerkapalle'      	),
										(	@d_cd,	'Chelimilla'        	),
										(	@d_cd,	'Chellepahad'       	),
										(	@d_cd,	'Chennaram'         	),
										(	@d_cd,	'Chennur'           	),
										(	@d_cd,	'Cherlapalle'       	),
										(	@d_cd,	'Chikkepalle'       	),
										(	@d_cd,	'Chinnamandadi'     	),
										(	@d_cd,	'Chinnamarur'       	),
										(	@d_cd,	'Chinnambavi'       	),
										(	@d_cd,	'Chintakunta'       	),
										(	@d_cd,	'Chinthareddipalle' 	),
										(	@d_cd,	'Dagada'            	),
										(	@d_cd,	'Dagadapalle'       	),
										(	@d_cd,	'Dantanoor'         	),
										(	@d_cd,	'Davajipalle'       	),
										(	@d_cd,	'Devarapalle'       	),
										(	@d_cd,	'Dharmapur'         	),
										(	@d_cd,	'Dondaipalle'       	),
										(	@d_cd,	'Duppalle'          	),
										(	@d_cd,	'Dwarakanagar'      	),
										(	@d_cd,	'Erladinne'         	),
										(	@d_cd,	'Gaddabaswapuram'   	),
										(	@d_cd,	'Gatlakhanapur'     	),
										(	@d_cd,	'Ghanpur'           	),
										(	@d_cd,	'Gopaldinne'        	),
										(	@d_cd,	'Gopalpet'          	),
										(	@d_cd,	'Gopalpur'          	),
										(	@d_cd,	'Gopanpeta'         	),
										(	@d_cd,	'Govardhangiri'     	),
										(	@d_cd,	'Govindahalli'      	),
										(	@d_cd,	'Gummadam'          	),
										(	@d_cd,	'Guntipalle'        	),
										(	@d_cd,	'Jagathpalle'       	),
										(	@d_cd,	'Jain Thirumalapur' 	),
										(	@d_cd,	'Jammapur'          	),
										(	@d_cd,	'Janampeta'         	),
										(	@d_cd,	'Jangamaipalle'     	),
										(	@d_cd,	'Janumpalle'        	),
										(	@d_cd,	'Jurial'            	),
										(	@d_cd,	'Kadirepad'         	),
										(	@d_cd,	'Kalloor'           	),
										(	@d_cd,	'Kalvarala'         	),
										(	@d_cd,	'Kamaluddinpur'     	),
										(	@d_cd,	'Kamballapur'       	),
										(	@d_cd,	'Kanaipalle'        	),
										(	@d_cd,	'Kanchiraopalle'    	),
										(	@d_cd,	'Kanimetta'         	),
										(	@d_cd,	'Kankanvanipalle'   	),
										(	@d_cd,	'Karvena'           	),
										(	@d_cd,	'Kathepalle'        	),
										(	@d_cd,	'Kesampeta'         	),
										(	@d_cd,	'Kethepalle'        	),
										(	@d_cd,	'Khanapur'          	),
										(	@d_cd,	'Kistampalle'       	),
										(	@d_cd,	'Kistapur'          	),
										(	@d_cd,	'Konkalapalle'      	),
										(	@d_cd,	'Konnur'            	),
										(	@d_cd,	'Koppunur'          	),
										(	@d_cd,	'Korlakunta'        	),
										(	@d_cd,	'Kothakota'         	),
										(	@d_cd,	'Kothapalle'        	),
										(	@d_cd,	'Lakshmipalle'      	),
										(	@d_cd,	'Madanapur'         	),
										(	@d_cd,	'Maddigatla'        	),
										(	@d_cd,	'Madhavaraopalle'   	),
										(	@d_cd,	'Mahammadapur'      	),
										(	@d_cd,	'Malkapur'          	),
										(	@d_cd,	'Malkimianpalle'    	),
										(	@d_cd,	'Mallaipalle'       	),
										(	@d_cd,	'Mamidimada'        	),
										(	@d_cd,	'Manajipet'         	),
										(	@d_cd,	'Manigilla'         	),
										(	@d_cd,	'Mastipur'          	),
										(	@d_cd,	'Medepalle'         	),
										(	@d_cd,	'Miraspalle'        	),
										(	@d_cd,	'Mittanandimalla'   	),
										(	@d_cd,	'Miyapuram'         	),
										(	@d_cd,	'Mojerla'           	),
										(	@d_cd,	'Motlampalle'       	),
										(	@d_cd,	'Mulamalla'         	),
										(	@d_cd,	'Mummallapalle'     	),
										(	@d_cd,	'Munagamanudinne'   	),
										(	@d_cd,	'Munnanur'          	),
										(	@d_cd,	'Nagalkadumur'      	),
										(	@d_cd,	'Nagapur'           	),
										(	@d_cd,	'Nagarala'          	),
										(	@d_cd,	'Nagasanipalle'     	),
										(	@d_cd,	'Nancharammapet'    	),
										(	@d_cd,	'Nandimalla'        	),
										(	@d_cd,	'Narsingapur'       	),
										(	@d_cd,	'Natavalli'         	),
										(	@d_cd,	'Nelividi'          	),
										(	@d_cd,	'Nirven'            	),
										(	@d_cd,	'Nizamabad'         	),
										(	@d_cd,	'Palem'             	),
										(	@d_cd,	'Pamapur'           	),
										(	@d_cd,	'Pamireddipalle'    	),
										(	@d_cd,	'Pangal'            	),
										(	@d_cd,	'Parwathapur'       	),
										(	@d_cd,	'Pathajangamaipalle'	),
										(	@d_cd,	'Pathapalle'        	),
										(	@d_cd,	'Pebbair'           	),
										(	@d_cd,	'Peddamandaddi'     	),
										(	@d_cd,	'Peddamarur'        	),
										(	@d_cd,	'Penchikalpadu'     	),
										(	@d_cd,	'Polkepahad'        	),
										(	@d_cd,	'Pulgarcherla'      	),
										(	@d_cd,	'Pullareddikunta'   	),
										(	@d_cd,	'Ramakrishnapur'    	),
										(	@d_cd,	'Ramammapeta'       	),
										(	@d_cd,	'Ramanpadu'         	),
										(	@d_cd,	'Ramapur'           	),
										(	@d_cd,	'Ramnathpur'        	),
										(	@d_cd,	'Rangapur'          	),
										(	@d_cd,	'Rayanipalle'       	),
										(	@d_cd,	'Rayanpet'          	),
										(	@d_cd,	'Remaddula'         	),
										(	@d_cd,	'Revally'           	),
										(	@d_cd,	'Sakhapur'          	),
										(	@d_cd,	'Salkalapur'        	),
										(	@d_cd,	'Sampatraopalle'    	),
										(	@d_cd,	'Sanginepalle'      	),
										(	@d_cd,	'Sankireddipalle'   	),
										(	@d_cd,	'Satyahalli'        	),
										(	@d_cd,	'Shakhapur'	     		),
										(	@d_cd,	'Shanaipalle'       	),
										(	@d_cd,	'Shankarampeta'     	),
										(	@d_cd,	'Shapur'            	),
										(	@d_cd,	'Singampeta'        	),
										(	@d_cd,	'Solipur'           	),
										(	@d_cd,	'Solipuram'         	),
										(	@d_cd,	'Somsagar'          	),
										(	@d_cd,	'Srirangapur'       	),
										(	@d_cd,	'Sugur'             	),
										(	@d_cd,	'Suraipalle'        	),
										(	@d_cd,	'Thadparthy'        	),
										(	@d_cd,	'Thalpunur'         	),
										(	@d_cd,	'Thatipamula'       	),
										(	@d_cd,	'Thellarallapalle'  	),
										(	@d_cd,	'Thippadampalle'    	),
										(	@d_cd,	'Thippaipalle'      	),
										(	@d_cd,	'Thirumalaipalle'   	),
										(	@d_cd,	'Thomalapalle'      	),
										(	@d_cd,	'Thoompalle'        	),
										(	@d_cd,	'Toomkunta'         	),
										(	@d_cd,	'Upparapalle'       	),
										(	@d_cd,	'Vallabhanpalle'    	),
										(	@d_cd,	'Vallabhapur'       	),
										(	@d_cd,	'Veeraipalle'       	),
										(	@d_cd,	'Veeraraghavapur'   	),
										(	@d_cd,	'Velgonda'          	),
										(	@d_cd,	'Vellatur'          	),
										(	@d_cd,	'Veltoor'           	),
										(	@d_cd,	'Vengalaipalle'     	),
										(	@d_cd,	'Venkatampalle'     	),
										(	@d_cd,	'Venkatapur'    		),
										(	@d_cd,	'Waddawata'         	),
										(	@d_cd,	'Weepangandla'      	),
										(	@d_cd,	'Yaparla'           	),
										(	@d_cd,	'Yedula'            	),
										(	@d_cd,	'Yedutla'           	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================


SET @d_cd = 'YB';		--	Yadadri Bhuvanagiri

INSERT	INTO	@l3_components	(	d_cd, l3_nm	)	VALUES
										(	@d_cd,	'Addagudur'          	),
										(	@d_cd,	'Alair'              	),
										(	@d_cd,	'Atmakur'            	),
										(	@d_cd,	'Bibinagar'          	),
										(	@d_cd,	'Bommalaramaram'     	),
										(	@d_cd,	'Motakondur'         	),
										(	@d_cd,	'Mothkur'            	),
										(	@d_cd,	'Rajapet'            	),
										(	@d_cd,	'Turkapally'         	),
										(	@d_cd,	'Yadagirigutta'      	),
										(	@d_cd,	'B.Pochampally'      	),
										(	@d_cd,	'Choutuppal'         	),
										(	@d_cd,	'Ramannapet'         	),
										(	@d_cd,	'Samstan Narayanpoor'	),
										(	@d_cd,	'Valigonda'          	),
										(	@d_cd,	'Gundala'            	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;
PRINT @cnt2

--	==================================================

--	===========================================================
--	Check whether Level 3 Code has been provided, and is UNIQUE
--	===========================================================

UPDATE	@l3_components
	SET	l3_cd	=	SUBSTRING (l3_nm, 1, 1)
WHERE	l3_cd	IS	NULL;

WITH dups AS (
	SELECT	d_cd, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY d_cd, l3_cd
		HAVING 	COUNT (*)	>	1
),
uniq AS	(
	SELECT	d.l3_cd + CONVERT (VARCHAR, ROW_NUMBER () OVER (PARTITION BY d.d_cd, d.l3_cd ORDER BY l3.l3_nm)) l3_cd, d.d_cd, l3.l3_nm
	FROM	dups	d
		JOIN	@l3_components	l3
			ON	(	d.d_cd	=	l3.d_cd
				AND	d.l3_cd	=	l3.l3_cd
				)
)
UPDATE	l3
	SET	l3_cd	=	d.l3_cd
FROM	uniq	d
	JOIN	@l3_components	l3
		ON	(	d.d_cd	=	l3.d_cd
			AND	d.l3_nm	=	l3.l3_nm
			);

WITH dups AS (
	SELECT	d_cd, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY d_cd, l3_cd
		HAVING 	COUNT (*)	>	1
)
SELECT	*
FROM	dups;
IF (@@ROWCOUNT > 0)
BEGIN
	RAISERROR ('Codes of Level 3 within Level 2 are NOT unique', 16, 1, @cnt1, @cnt3);
	ROLLBACK;
	RETURN;
END

--	=================================================
--	We now INSERT into Level 2 & 3 Address Components
--	=================================================

INSERT INTO level_2_address_components
		(	level_2_address_component_cd, level_2_address_component_nm, level_1_address_component_id, is_authentic, effective_from, effective_till, frro_level2_nm, audit_log_id	)
	SELECT	d_cd, d_nm, @sid, 1, @fdt, @tdt, d_nm, @al
	FROM	@districts;
SET @cnt3 = @@ROWCOUNT;
IF (@cnt1 != @cnt3)
BEGIN
	RAISERROR ('Row counts of New Districts mis-match; should be %d, but added only %d', 16, 1, @cnt1, @cnt3);
	ROLLBACK;
	RETURN;
END

INSERT INTO level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id	)
	SELECT	l3_cd, l3_nm, l2.level_2_address_component_id, 1, @fdt, @tdt, l3_nm, @al
	FROM	@l3_components	l3
		JOIN	level_2_address_components	l2
			ON	(	l2.level_1_address_component_id	=	@sid
				AND	l2.level_2_address_component_cd	=	l3.d_cd
				);
SET @cnt3 = @@ROWCOUNT;
IF (@cnt2 != @cnt3)
BEGIN
	RAISERROR ('Row counts of New Level 3 Address Components mis-match; should be %d, but added only %d', 16, 1, @cnt2, @cnt3);
	ROLLBACK;
	RETURN;
END

--	=================================================

SELECT	*
FROM	level_2_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 3;

SELECT	*
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;
