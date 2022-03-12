BEGIN TRAN;
--ROLLBACK;
--COMMIT;

DECLARE
	@fdt	DATE	=	GETDATE(),
	@tdt	DATE	=	'31 Dec 9999',
	@al		INTEGER,	--	audit_log_id
	@sid	INTEGER,	--	State ID
	@d_id	INTEGER,	--	ID of a district
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

DECLARE	@l3_components	TABLE
	(	d_id	INTEGER			NOT	NULL,
		l3_cd	VARCHAR (10)		NULL,
		l3_nm	VARCHAR (40)	NOT	NULL,
--			PRIMARY	KEY	(	d_cd, l3_cd	),
			UNIQUE		(	d_id, l3_nm	)
	);

SELECT	@sid = level_1_address_component_id
FROM	level_1_address_components
WHERE	level_1_address_component_nm = 'Orissa';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev061', 'Orissa-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	Corrections	- Level 1
--	==================================================

UPDATE	level_1_address_components
	SET		level_1_address_component_nm	=	'Odisha',
			audit_log_id	=	@al
WHERE	level_1_address_component_id	=	@sid;

IF (@@ROWCOUNT != 1)
BEGIN
	ROLLBACK;
	RAISERROR ('Row count of Level 1 RENAMES mis-match; should have been 1', 16, 1);
	RETURN;
END

--	==================================================
--	Corrections	- Level 2
--	==================================================

INSERT	INTO	@l2_renames		VALUES	(	437,	'Jajapur',		'Jajpur'					),
										(	442,	'KENDUJHAR',	'KENDUJHAR (not in use)'	),
										(	449,	'NABARANGAPUR',	'NABARANGPUR'				),
										(	445,	'KHURDA',		'Khordha'					),
										(	456,	'SONAPUR',		'SUBARNAPUR'				);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l2
	SET		level_2_address_component_nm	=	d.new_nm,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@l2_renames	d
		ON	(	l2.level_2_address_component_id	=	d.l2_id
			AND	l2.level_2_address_component_nm	=	d.l2_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	SELECT	d.*
	FROM	@l2_renames	d
		LEFT JOIN	level_2_address_components	l2
			ON	(	l2.level_2_address_component_id	=	d.l2_id
				AND	l2.level_2_address_component_nm	=	d.l2_nm
				)
	WHERE	l2.level_2_address_component_id	IS	NULL;
	RAISERROR ('Row counts of Level 2 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

DELETE
FROM	@l2_renames;

INSERT	INTO	@l2_renames		VALUES	(	443,	'KEONJHAR',	'KENDUJHAR'		);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l2
	SET		level_2_address_component_nm	=	d.new_nm,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@l2_renames	d
		ON	(	l2.level_2_address_component_id	=	d.l2_id
			AND	l2.level_2_address_component_nm	=	d.l2_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	ROLLBACK;
	RAISERROR ('Row counts of Level 2 RENAMES mis-match-2; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	RETURN;
END

--	==================================================
--	Renames	- Level 3
--	==================================================

INSERT	INTO	@l3_renames		VALUES	(	126667,	'KEONJHAR',		'KENDUJHAR'		),
										(	225440,	'NABARANGAPUR',	'NABARANGPUR'	),
										(	225432,	'Jajapur',		'Jajpur'		),
										(	126908,	'KHURDA',		'Khordha'		),
										(	225443,	'SONAPUR',		'SUBARNAPUR'	),

												--	Kerala
										(	225405,	'WYANAD',				'WAYANAD'				),
										(	225404,	'THIRUVANANTHPURAM',	'THIRUVANANTHAPURAM'	);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l3
	SET		level_3_address_component_nm	=	d.new_nm,
			audit_log_id	=	@al
FROM	level_3_address_components	l3
	JOIN	@l3_renames	d
		ON	(	l3.level_3_address_component_id	=	d.l3_id
			AND	l3.level_3_address_component_nm	=	d.l3_nm
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Row counts of Level 3 RENAMES mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END


--	==================================================
--	Ineffective Districts
--	==================================================

INSERT	INTO	@ineffective_districts		VALUES	(	426,	'Baleshwar'					),
													(	429,	'BHUBANESWAR'				),
													(	452,	'Phulbani'					),
													(	444,	'KEONJHAR GHAR'				),
													(	442,	'KENDUJHAR (not in use)'	);
SET @cnt1 = @@ROWCOUNT;

UPDATE	l2
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@ineffective_districts	d
		ON	(	l2.level_2_address_component_id	=	d.d_id
			AND	l2.level_2_address_component_nm	=	d.d_nm
			AND	l2.level_1_address_component_id	=	@sid
			);
SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Row counts of Ineffective Districts mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END

UPDATE	l3
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
FROM	level_2_address_components	l2
	JOIN	@ineffective_districts	d
		ON	(	l2.level_2_address_component_id	=	d.d_id
			AND	l2.level_2_address_component_nm	=	d.d_nm
			AND	l2.level_1_address_component_id	=	@sid
			)
	JOIN	level_3_address_components	l3
		ON	(	l3.level_2_address_component_id	=	l2.level_2_address_component_id	);

--	==================================================
--	New Level 3 components
--	==================================================

SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'BHADRAK';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Basudevpur'		),
										(	@d_id,	'Bhandaripokhari'	),
										(	@d_id,	'Dhamra'			),
										(	@d_id,	'Bonth'				),
										(	@d_id,	'Dhamnagar'			),
										(	@d_id,	'Chandabali'		),
										(	@d_id,	'Tihidi'			);
SET @cnt2 = @@ROWCOUNT;

--	==================================================

SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'BOUDH';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Baunsuni'		),
										(	@d_id,	'Harbhanga'		),
										(	@d_id,	'Kantamal'		),
										(	@d_id,	'Manamunda'		),
										(	@d_id,	'Khuntabandha'	),
										(	@d_id,	'Gundulia'		),
										(	@d_id,	'Telibandha'	),
										(	@d_id,	'Dahya'			),
										(	@d_id,	'Badigyan'		),
										(	@d_id,	'Boudh Sadar'	),
										(	@d_id,	'Mundapada'		),
										(	@d_id,	'Sagada'		),
										(	@d_id,	'Adenigada'		),
										(	@d_id,	'Debagada'		),
										(	@d_id,	'Dhalapur'		),
										(	@d_id,	'Biranarasinghpur'	),
										(	@d_id,	'Sarasara'		),
										(	@d_id,	'Harabhanga'	),
										(	@d_id,	'Ghantapada'	),
										(	@d_id,	'Para'			),
										(	@d_id,	'Baragyan'		),
										(	@d_id,	'Purana Katak'	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'DEBAGARH';

DECLARE	@tbl	TABLE	(	l3_nm	VARCHAR (40)	NOT	NULL	PRIMARY	KEY	);

INSERT	INTO	@tbl	VALUES
			('Adasa'),	('Adyapur'),	('Akhabuda'),	('Aksharashila'),	('Ambachuan'),	('Ambagaon'),	('Ambaghata'),	('Ambakata'),	('Ambakhola'),	('Ambulapani'),
			('Analakuli'),	('Anantapichhula'),	('Andharinali'),	('Anlakuli'),	('Arakhapala'),	('Argan'),	('Arjunjhari'),	('Arjunpali'),	('Asanabahal'),	('Asanabania'),
			('Asanakhan(Arjundarah)'),	('Asanalada'),	('Asananali'),	('Asanapala'),	('Aunli'),	('Babajimatha'),	('Babarakote'),	('Babarikani'),	('Bad Chhapal'),	('Bada Kuanrkhola'),
			('Badabahal'),	('Badabaliposhi'),	('Badadangaghat'),	('Badamanpur'),	('Badasimlai'),	('Badjharan'),	('Badjhumpura'),	('Badkudar'),	('Badpasi'),	('Badtaila'),
			('Baghamari'),	('Baghamunda'),	('Baghbar'),	('Baghiabandha'),	('Bahadapasi'),	('Baidarmunda'),	('Baidharanagar'),	('Baidyasadhu Bahal'),	('Bailadihi'),	('Bainshaba Khola'),
			('Baishnabapali'),	('Baisi Nalia'),	('Baisyapada'),	('Baksibalipashi'),	('Bakulimunda'),	('Balijori'),	('Balijurapali'),
			('Balinali'),	('Balipata'),	('Baliroi'),	('Balita'),	('Ballam'),	('Ballamjore'),	('Banakala'),	('Bandhakhola'),	('Bandhali'),
			('Bandhanbania'),	('Baniakilinda'),	('Banjari'),	('Bankadarha'),	('Baraadha'),	('Baradataila'),	('Baragadia'),	('Baraghata'),	('Barakani'),	('Barakhandia'),
			('Barakhola'),	('Basantapur'),	('Basudevpali'),	('Basudevpur'),	('Basupali'),	('Bauns Munda'),	('Bauripali'),	('Begunianali'),
			('Belagotha'),	('Belamunda'),	('Belmara'),	('Beluamba'),	('Bentakarabahala'),	('Betakholajharana'),	('Betei jharana'),	('Bhakta Bad Kudar'),	('Bhaliadihi'),	('Bhaliagudi'),
			('Bhaluchaba'),	('Bhaluchuan'),	('Bhaluguha'),	('Bhalukhola'),	('Bhalupala'),	('Bhangamunda'),	('Bharatgada'),	('Bhatasingh'),	('Bhejikudar'),	('Bhimaganja'),
			('Bhitarapada'),	('Bhitarbeda'),	('Bhukabeda'),	('Bhulukabahal'),	('Bhutel'),	('Bichhakhani'),	('Bidei badkudar'),	('Bijaberani'),	('Bijanali'),	('Bijayanagar'),
			('Bileighati'),	('Bileinali'),	('Bindipur'),	('Bipraburu Bahal'),	('Biriamba'),	('Bisi Balipasi'),	('Brahmanidei'),	('Brahmanimala'),	('Brahmaninali'),	('Brahmanipali'),
			('Brahmasadhubahal'),	('Brahmnidei'),	('Brajamohanpur'),	('Brundabanpur'),	('Budhabhuin'),	('Budhakhaman'),	('Budhapal'),	('Budhibahal'),	('Budhibil'),	('Budhikutuni'),
			('Budido'),	('Burabuda'),	('Buru Bahal'),	('Butapali'),	('Butiadiha'),	('Chachhupali'),	('Chadakmara'),	('Chadheimara'),	('Chaitanpali'),	('Chakadiha'),
			('Chakradharpur'),	('Chakrapali'),	('Chakulia'),	('Chandanakhunti'),	('Chandankhunti'),	('Chandapasi'),	('Chandaposhi'),	('Chandiposhi'),	('Chandrapur'),	('Chapabahal'),
			('Chatiapali'),	('Chauriadhipa'),	('Chhalaka'),	('Chhanchunia'),	('Chhatripita'),	('Chheliamendhia'),	('Chhepilipali'),	('Chhuriabahal'),	('Chilantikhola'),	('Chingudijharan'),
			('Chintamanipur'),	('Chirigunikudar'),	('Chuakhola'),	('Chudakhia'),	('Dalabeheramunda'),	('Dalak'),	('Dalakabahal'),	('Dalaki Jungle Block'),	('Damita'),	('Dandaparbat'),
			('Dandasingha'),	('Dangakhola'),	('Dangapal'),	('Dangapathar'),	('Danra'),	('Dantaribahal'),	('Danyakhola'),	('Dareichora'),	('Darjeemunda'),	('Dasagharia Paika'),
			('Dasagharia Rayata'),	('Dayapur'),	('Debichuan (Nutan)'),	('Debichuan'),	('Dehurimunda'),	('Dehuripali'),	('Dengasaragi'),	('Dengurujor'),	('Deogarh'),	('Deojharan'),
			('Deojharana'),	('Depani'),	('Depatala'),	('Dharampur'),	('Dharanidharpur'),	('Dharmapur'),	('Dhatukipali'),	('Dhauragotha'),	('Dhaurakhamana'),	('Dhiramunda'),
			('Dholapada'),	('Dholataila'),	('Dhubakata'),	('Dimirikuda'),	('Dimirimunda'),	('Dimiriposhi'),	('Dosinkuli'),	('Dubamunda'),	('Dudhaposhi'),	('Dudhianali'),
			('Dudukajharana'),	('Durijungle'),	('Fulajhari'),	('Gadapala'),	('Gadiapal'),	('Gaila'),	('Gaimaruni'),	('Gajiribania'),	('Gambharibhuin'),	('Gambharipal'),
			('Gambhariposhi'),	('Gandam'),	('Gangajala'),	('Ganganana'),	('Garagadbahal'),	('Gariapali'),	('Gariapasi'),	('Gayalamara'),	('Ghamamunda'),	('Ghantiapali'),
			('Ghantipasi'),	('Ghasiapala'),	('Ghodapakakhola'),	('Ghuntulipasi'),	('Ghurudukhamana'),	('Gobindapali'),	('Godabhanga'),	('Godamala'),	('Gogua'),	('Golabadanpur'),
			('Golabandha'),	('Gopalpali'),	('Gopapur'),	('Goudanali'),	('Goulimundi'),	('Gudurimunda'),	('Guida'),	('Gundeimara'),	('Gundiapali'),	('Gundurikhol'),
			('Gunduripasi'),	('Gunduriposhi'),	('Gurdhipali'),	('Gurjang'),	('Gurjanga'),	('Gurulia'),	('Gurusanga'),	('Hadamunda'),	('Hadsanhar'),	('Haladia Khola'),
			('Haladipani'),	('Harapali'),	('Harekrushnapur'),	('Haridabahal'),	('Hariharpur'),	('Hatakeswar Munda'),	('Hatakhola'),	('Hetkhamara'),	('Hilanga Prajoti'),	('Hilanga Sarkari'),
			('Hinjali Chua'),	('Hinjalita'),	('Hiran'),	('Hitam'),	('Hrudapali'),	('Indranijharan'),	('Ishwarapali'),	('Ishwarpali'),	('Jadagola'),	('Jagadala'),
			('Jagannathpur'),	('Jaintapali'),	('Jalisuan'),	('Jambunali'),	('Jambupadan'),	('Jamujharan'),	('Jamujhari'),	('Jamumunda'),	('Jamunali'),	('Janardanpali'),
			('Jandamunda'),	('Jaoutuka'),	('Jarachhata'),	('Jarakote'),	('Jarichakundapala'),	('Jaripala'),	('Jasobantapur'),	('Jatianali'),	('Jayapichhula'),	('Jayasendha'),
			('Jhaliamara'),	('Jharabahal'),	('Jharaberni'),	('Jharadihi'),	('Jharagogua'),	('Jharakandhal'),	('Jharamunda'),	('Jharapada'),	('Jharapasi'),	('Jharijhari Khola'),
			('Jhimpabira'),	('Jogibenua'),	('Jualibhanga'),	('Julani'),	('Juradanga'),	('Kadalimunda'),	('Kadalipala'),	('Kadambajhari'),	('Kadamdarha'),	('Kadodihi'),
			('Kadopada'),	('Kahneimunda'),	('Kaidanta'),	('Kailash'),	('Kainsar'),	('Kakudiakhaman'),	('Kalachipodadihi'),	('Kalamati'),	('Kalanda'),	('Kaliakhamar'),
			('Kaliapala'),	('Kalicharanpali'),	('Kalikuda'),	('Kalipathar'),	('Kalkath'),	('Kalla'),	('Kalladu'),	('Kamalabagicha'),	('Kamarnali'),	('Kamarpal'),
			('Kanachhada'),	('Kandarpa'),	('Kandhal'),	('Kanjiamba Matha'),	('Kanjiamba'),	('Kankadajharana'),	('Kankadakhai'),	('Kankarkhola'),	('Kansar'),	('Kantabahal'),
			('Kantapala'),	('Kantapali'),	('Kantapalli'),	('Kanteikoli'),	('Kapagola'),	('Karadakhaman'),	('Karadakhamana'),	('Karadapal Srimanta'),	('Karalaga'),	('Karangakhol'),
			('Karatnali'),	('Kardadapala'),	('Kasarloi'),	('Katangapani'),	('Katasara'),	('Katei'),	('Katuridhua '),	('Kaunsibahal'),	('Kaunsikhola'),	('Keasanpur'),
			('Kelenda'),	('Kendeijori'),	('Kendughata'),	('Kendunali'),	('Kendupal'),	('Kerabahal'),	('Khadinali'),	('Khairabania'),	('Khairanali'),	('Khairapali'),
			('Khairarandha'),	('Khajurianali'),	('Khajuribahal'),	('Khajuridarh'),	('Khajurikhaman'),	('Khakharumal'),	('Khalidhipa'),	('Khalinali'),	('Khamarbahal'),	('Khandadhuan'),
			('Khandam'),	('Khandimunda'),	('Khandumunda'),	('Kharapal'),	('Khariakani'),	('Kharumunda'),	('Khilei'),	('Khileiberni'),	('Kholadihi'),	('Khulundi Kudar'),
			('Khulundipani'),	('Khuntabandha'),	('Khuntadihi'),	('Khuntiapali'),	('Kirtanpali'),	('Kolhabasa'),	('Koradakhola'),	('Koradapasi'),	('Kudabila'),	('Kudalapal'),
			('Kudanali'),	('Kukutinali'),	('Kulasara'),	('Kulhanipal'),	('Kulhapali'),	('Kumal Paika'),	('Kumala Rayata'),	('Kumuranali'),	('Kumurapali'),	('Kundajhari'),
			('Kundapitha'),	('Kundheigola'),	('Kureibahal'),	('Kureinbahal'),	('Kurod'),	('Kusakhalia'),	('Kusumapal'),	('Kusumkata'),	('Laimura'),	('Lainda'),
			('Lakhabahal'),	('Lakhapali'),	('Lalaposi'),	('Lalitamohanpur'),	('Lambadora'),	('Landijhari'),	('Laxmipur'),	('Lodhapasi'),	('Loharakote'),	('Lolanga'),
			('Ludhar'),	('Lugapuda'),	('Madalia'),	('Madhapali'),	('Madhupali'),	('Madhyapur'),	('Madhyapura'),	('Mahajanmunda'),	('Mahasindhu'),	('Mahendrapur'),
			('Mahibahala'),	('Mahuladarha'),	('Mahulamala'),	('Mahuldarha'),	('Mahupala'),	('Majhichakundapala'),	('Majhipali'),	('Malarbahal'),	('Malehipada'),	('Malichuan'),
			('Mamurikhola'),	('Mamuritap'),	('Mankadachuan'),	('Mankadamunda'),	('Manoharapur'),	('Manoharpur'),	('Mardang'),	('Mardanga'),	('Marha'),	('Markandapur'),
			('Masinata'),	('Masinita'),	('Mayapur'),	('Medinipura'),	('Menjaribahal'),	('Mugaribania'),	('Mundagohira'),	('Musaburi'),	('Muthiharida'),	('Nabarangapur'),
			('Nadiajore'),	('Nagadihi'),	('Nagado'),	('Nakatikhola'),	('Nalabandha'),	('Naranakhairapali'),	('Narasingh Taila'),	('Narasinghmunda'),	('Natripal'),	('Naulipada'),
			('Neteidhobani'),	('Netrabahal'),	('Niktimal'),	('Niktimala'),	('Nilagandia'),	('Nirgundipali'),	('Nishabira'),	('Nisthuaraduma'),	('Nrusingh Nagar'),	('Nua Barkote'),
			('Nua kadaliapal'),	('Nua Rengata'),	('Nuabaliroi'),	('Nuabanakallo'),	('Nuabhuin'),	('Nuadihi'),	('Nuagaon'),	('Nuagoudasuguda'),	('Nuakeshala'),	('Nualoi'),
			('Nuamunda'),	('Nuapada'),	('Nuapatana'),	('Nutanakaradapala'),	('Outal'),	('Pacheripani'),	('Padadihi'),	('Padianali'),	('Palakudar'),	('Palasama'),
			('Palunipada'),	('Panchamahala'),	('Panchapadadunguri'),	('Pandarakhandia'),	('Panibhandar'),	('Pankadarha'),	('Para'),	('Parposhi'),	('Patakhamana'),	('Patapathar'),
			('Pathar Anjari'),	('Pathar Khani'),	('Patharghat'),	('Patharkhani'),	('Pathurinali'),	('Patrajhari'),	('Patrapali'),	('Pejagola'),	('Pendarakhaola'),	('Phatatangar'),
			('Pohalamara'),	('Poipani'),	('Prabhasuni '),	('Pudapada San'),	('Pudapada'),	('Pulasarnali'),	('Puramunda'),	('Purunapani'),	('Putabal'),	('Rabanakucha'),
			('Raghunathpur'),	('Raibandha'),	('Rairatnapur'),	('Raitabahal'),	('Raitala'),	('Rajamunda'),	('Ramachandrapur'),	('Ramapali'),	('Rambhei'),	('Rangamatia'),
			('Ranigola'),	('Ranijharan'),	('Ranja'),	('Ranjana'),	('Rataba'),	('Ratakhandi'),	('Ratanpali'),	('Ratanpur'),	('Ratnakhalinali'),	('Rayanda'),
			('Reabahala'),	('Reamal'),	('Regadakhola'),	('Rengalabahal'),	('Rengalabeda'),	('Rengalapali'),	('Rengalbahal'),	('Rengalbeda'),	('Rengali'),	('Rengalnali'),
			('Rengalpali'),	('Rotanali'),	('Routamara'),	('Rugudakudar'),	('Rugudu'),	('Rukuba'),	('Rukuda'),	('Rushipalli'),	('Sabarpali'),	('Sadhupali'),
			('Sado'),	('Sahajbahal'),	('Saida'),	('Salaberni'),	('Salarapala'),	('Saloi'),	('Samantrapali'),	('Samapali'),	('Samasingha'),	('Sambarubarapali'),
			('Sanadangaghata'),	('Sanadharampur'),	('Sanajhumpura'),	('Sangapasi'),	('Sankarpali'),	('Sankarpur'),	('Sanmanpur'),	('Sansimalai'),	('Sapuinali'),	('Saranali'),
			('Sarankote'),	('Sarapala'),	('Sarasaposi'),	('Sarasposhi'),	('Saruali'),	('Satakiari'),	('Sendha'),	('Shradhakarpali'),	('Siarinalia'),	('Sibapali'),
			('Siharia'),	('Sikhajhari'),	('Similibahal'),	('Similihata'),	('Similita'),	('Sindhupali'),	('Sindurakhol'),	('Sindurpank'),	('Singasala'),	('Singhuri'),
			('Sipur'),	('Siradiha (Bada)'),	('Sirapali'),	('Siridihi (San)'),	('Sirigida'),	('Siripur'),	('Sishubania'),	('Sradhapura'),	('Srikhampali'),	('Subarnapali'),
			('Suguda'),	('Sukhapadan'),	('Sunamunda'),	('Sunanali'),	('Sunapasi'),	('Sunaripada'),	('Sundhinali'),	('Surangipala'),	('Surupa'),	('Tabada'),
			('Tainsar'),	('Tainsira'),	('Talabahal'),	('Talabahali'),	('Talabahali(Nutan)'),	('Taladiha'),	('Talakhali'),	('Talakudar'),	('Talakundi'),	('Taleisar'),
			('Tamakiakhol'),	('Tampar'),	('Taranga'),	('Tasarda'),	('Tatakapasi'),	('Telabhanguni'),	('Telikusum'),	('Telimunda'),	('Telisuan'),	('Tentalabahal'),
			('Tentoloi'),	('Terandakata'),	('Thakaramal'),	('Thakurpali'),	('Thalipathar'),	('Thelakoburi'),	('Thianal'),	('Tikilijharan'),	('Tilaipasi'),	('Tileibani'),
			('Tileimala'),	('Tileipashi'),	('Timur'),	('Tinkabir'),	('Tinkbir'),	('Tipeijharana'),	('Tipirisingha'),	('Tiribi'),	('Totabari'),	('Trinathapura'),
			('Tuhilamal'),	('Tulabadihi'),	('Tulasipur'),	('Tungamala'),	('Turanga'),	('Tusula'),	('Uchhabapali'),	('Udayapur'),	('Upara Ranijharana'),	('Utunia'),
			('Utuniamunda');

INSERT	INTO	@l3_components
		(	d_id, l3_nm	)
	SELECT	@d_id, l3_nm
	FROM	@tbl;
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Gajapati';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Kashinagara'	),
										(	@d_id,	'Mohana'		),
										(	@d_id,	'Paralakhemundi'	),
										(	@d_id,	'Rayagada'		),
										(	@d_id,	'R.Udayagiri'	),
										(	@d_id,	'Uppalada'		),
										(	@d_id,	'Kharasanda'	),
										(	@d_id,	'Baghasala'		),
										(	@d_id,	'Machamara'		),
										(	@d_id,	'Gurandi'		),
										(	@d_id,	'Bhusukudi'		),
										(	@d_id,	'Bada Koturu'	),
										(	@d_id,	'Sobara'		),
										(	@d_id,	'Garabandha'	),
										(	@d_id,	'Ranipeta'		),
										(	@d_id,	'K.Sitapur'		),
										(	@d_id,	'Hadubhangi'	),
										(	@d_id,	'Kharada'		),
										(	@d_id,	'Kashinagar'	),
										(	@d_id,	'Siyali'		),
										(	@d_id,	'Khandava'		),
										(	@d_id,	'Mandalasahi'	),
										(	@d_id,	'Jeerango'		),
										(	@d_id,	'Gandahati'		),
										(	@d_id,	'Chellagada'	),
										(	@d_id,	'Chelligada'	),
										(	@d_id,	'Mangarajpur'	),
										(	@d_id,	'Mahendragada'	),
										(	@d_id,	'Ramagiri'		),
										(	@d_id,	'Ramagiri Udayagiri'		),
										(	@d_id,	'Gumma'			),
										(	@d_id,	'Gaiba'			),
										(	@d_id,	'Nuagada'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'JAGATSINGHAPUR';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Kujang'		),
										(	@d_id,	'Tirtol'		),
										(	@d_id,	'Biridi'		),
										(	@d_id,	'Naugaon'		),
										(	@d_id,	'Erasama'		),
										(	@d_id,	'Raghunathpur'	),
										(	@d_id,	'Kamashasan'	),
										(	@d_id,	'Harishpur'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Jajpur';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Dasarathapur'	),
										(	@d_id,	'Binjharpur'  	),
										(	@d_id,	'Bari'        	),
										(	@d_id,	'Rasulpur'    	),
										(	@d_id,	'Dharmasala'  	),
										(	@d_id,	'Darpan'      	),
										(	@d_id,	'Vyasanagar'  	),
										(	@d_id,	'Danagadi'    	),
										(	@d_id,	'Sukinda'     	),
										(	@d_id,	'Korei'			),
										(	@d_id,	'Badchana'		),
										(	@d_id,	'Byasanagar'	),
										(	@d_id,	'Barchana'		),
										(	@d_id,	'Chandikhole'	),
										(	@d_id,	'Panikoili'		),
										(	@d_id,	'Kalinganagar'	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'JHARSUGUDA';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Lakhanpur'		),
										(	@d_id,	'Laikera'		),
										(	@d_id,	'Kirmira'		),
										(	@d_id,	'Kolabira'		),
										(	@d_id,	'Bandhabahal'	),
										(	@d_id,	'Brajrajnagar'	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'ANGUL';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Chhendipada'	),
										(	@d_id,	'Kishorenagar'	),
										(	@d_id,	'Pallahara'		),
										(	@d_id,	'Deracolliery'	),
										(	@d_id,	'Durgapur'		),
										(	@d_id,	'Ghantapada'	),
										(	@d_id,	'Jarapada'		),
										(	@d_id,	'Jhimiripalli'	),
										(	@d_id,	'Nalconagar'	),
										(	@d_id,	'Kaniha'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Bargarh';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Padampur' 	),
										(	@d_id,	'Ambabhona'	),
										(	@d_id,	'Bijepur'  	),
										(	@d_id,	'Attabira' 	),
										(	@d_id,	'Gaisilet' 	),
										(	@d_id,	'Jharbandh'	),
										(	@d_id,	'Bhatli'   	),
										(	@d_id,	'Paikmal'  	),
										(	@d_id,	'Bheden'   	),
										(	@d_id,	'Sohela'   	),
										(	@d_id,	'Ghess'		),
										(	@d_id,	'Khaliapali'	),
										(	@d_id,	'Melchhamunda'	),
										(	@d_id,	'Temri'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Kandhamal';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Brahmanigoan'	),
										(	@d_id,	'Daringbadi'	),
										(	@d_id,	'G. Udayagiri'	),
										(	@d_id,	'Phulbani'	),
										(	@d_id,	'Paberi'	),
										(	@d_id,	'Tikabali'	),
										(	@d_id,	'Raikia'	),
										(	@d_id,	'Sarangda'	),
										(	@d_id,	'Tumudibandh'	),
										(	@d_id,	'Phiringia'	),
										(	@d_id,	'K. Nuagaon'	),
										(	@d_id,	'Kotagarh'	),
										(	@d_id,	'Chakapad'	),
										(	@d_id,	'Khajuribada'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Kendrapara';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Kanika'	),
										(	@d_id,	'Marshaghai'	),
										(	@d_id,	'Pattamundai'	),
										(	@d_id,	'Rajnagar'	),
										(	@d_id,	'Mahakalapada'	),
										(	@d_id,	'Derabish'	),
										(	@d_id,	'Garadpur'	),
										(	@d_id,	'Badabetara'	),
										(	@d_id,	'Kalabuda'	),
										(	@d_id,	'Karilopatna'	),
										(	@d_id,	'Nimapur'	),
										(	@d_id,	'Panki'	),
										(	@d_id,	'Rajkanika'	),
										(	@d_id,	'Garadapur'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Khordha';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Banapur'	),
										(	@d_id,	'Bologarh'	),
										(	@d_id,	'Dungamal'	),
										(	@d_id,	'Jatani'	),
										(	@d_id,	'Jhinkijhari'	),
										(	@d_id,	'Pratapsasan'	),
										(	@d_id,	'Begunia'	),
										(	@d_id,	'Gandarpur'	),
										(	@d_id,	'Mangaljodi'	),
										(	@d_id,	'Sundarpur'	),
										(	@d_id,	'Tangi'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Malkangiri';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Govindapally'	),
										(	@d_id,	'Khairput'	),
										(	@d_id,	'Chitrakonda'	),
										(	@d_id,	'Kudumulgumma'	),
										(	@d_id,	'Kalimela'	),
										(	@d_id,	'Motu'	),
										(	@d_id,	'Podia'	),
										(	@d_id,	'Korukonda'	),
										(	@d_id,	'Orkel'	),
										(	@d_id,	'Judambo'	),
										(	@d_id,	'Papermetla'	),
										(	@d_id,	'Maithili'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Nabarangpur';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Chandahandi'	),
										(	@d_id,	'Khatiguda'	),
										(	@d_id,	'Papadahandi'	),
										(	@d_id,	'Digisalapa'	),
										(	@d_id,	'Umerkote'	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Nayagarh';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Dasapalla'		),
										(	@d_id,	'Khandapada'	),
										(	@d_id,	'Ranapur'	),
										(	@d_id,	'Bhapur'	),
										(	@d_id,	'Gania'	),
										(	@d_id,	'Nuagaon'	),
										(	@d_id,	'Odagaon'	),
										(	@d_id,	'Kantilo'	),
										(	@d_id,	'Sarankul'	),
										(	@d_id,	'Chandapur'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Nuapada';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Khariar'		),
										(	@d_id,	'Boden'			),
										(	@d_id,	'Sinapali'		),
										(	@d_id,	'Sagunbhadi'	),
										(	@d_id,	'Khariar Road'	),
										(	@d_id,	'Brahamanpada'	),
										(	@d_id,	'Tukla'			),
										(	@d_id,	'Bhella'		),
										(	@d_id,	'Beltukri'		),
										(	@d_id,	'Singpur'		),
										(	@d_id,	'Udyanbandh'	);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================


SELECT	@d_id	=	level_2_address_component_id
FROM	level_2_address_components
WHERE	level_1_address_component_id	=	@sid
AND		level_2_address_component_nm	=	'Subarnapur';

INSERT	INTO	@l3_components	(	d_id, l3_nm	)	VALUES
										(	@d_id,	'Binika'        	),
										(	@d_id,	'Biramaharajpur'	),
										(	@d_id,	'Rampur'        	),
										(	@d_id,	'Tarava'        	),
										(	@d_id,	'Ullunda'       	),
										(	@d_id,	'Kotsamlai'	),
										(	@d_id,	'Charda'	),
										(	@d_id,	'Telanda'	),
										(	@d_id,	'Khaliapali'	),
										(	@d_id,	'Gailmura'		),
										(	@d_id,	'Dunguripalli'	),
										(	@d_id,	'Subalaya'		);
SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

--	===========================================================
--	Check whether Level 3 Code has been provided, and is UNIQUE
--	===========================================================

UPDATE	@l3_components
	SET	l3_cd	=	SUBSTRING (l3_nm, 1, 1)
WHERE	l3_cd	IS	NULL;

WITH dups AS (
	SELECT	d_id, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY d_id, l3_cd
		HAVING 	COUNT (*)	>	1
),
uniq AS	(
	SELECT	d.l3_cd + CONVERT (VARCHAR, ROW_NUMBER () OVER (PARTITION BY d.d_id, d.l3_cd ORDER BY l3.l3_nm)) l3_cd, d.d_id, l3.l3_nm
	FROM	dups	d
		JOIN	@l3_components	l3
			ON	(	d.d_id	=	l3.d_id
				AND	d.l3_cd	=	l3.l3_cd
				)
)
UPDATE	l3
	SET	l3_cd	=	d.l3_cd
FROM	uniq	d
	JOIN	@l3_components	l3
		ON	(	d.d_id	=	l3.d_id
			AND	d.l3_nm	=	l3.l3_nm
			);

WITH dups AS (
	SELECT	d_id, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY d_id, l3_cd
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

INSERT INTO level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, frro_level3_nm, audit_log_id	)
	SELECT	l3_cd, l3_nm, l2.level_2_address_component_id, 1, @fdt, @tdt, l3_nm, @al
	FROM	@l3_components	l3
		JOIN	level_2_address_components	l2
			ON	(	l2.level_1_address_component_id	=	@sid
				AND	l2.level_2_address_component_id	=	l3.d_id
				);
SET @cnt3 = @@ROWCOUNT;
IF (@cnt2 != @cnt3)
BEGIN
	RAISERROR ('Row counts of New Level 3 Address Components mis-match; should be %d, but added only %d', 16, 1, @cnt2, @cnt3);
	ROLLBACK;
	RETURN;
END


SELECT	*
FROM	level_2_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 3;

SELECT	*
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;

