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


DECLARE	@l3_district_changes	TABLE
	(	l3_id	INTEGER			NOT	NULL	PRIMARY	KEY,
		l3_nm	VARCHAR (40)	NOT	NULL,
		new_l2	VARCHAR (40)	NOT	NULL
	);

DECLARE	@l3_components	TABLE
	(	l2_nm	VARCHAR (40)	NOT	NULL,
		l3_cd	VARCHAR (10)		NULL,
		l3_nm	VARCHAR (40)	NOT	NULL,
--			PRIMARY	KEY	(	d_cd, l3_cd	),
			UNIQUE		(	l2_nm, l3_nm	)
	);

SELECT	@sid = level_1_address_component_id
FROM	level_1_address_components
WHERE	level_1_address_component_nm = 'Delhi';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev090', 'Delhi-Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	District changes	- Level 3
--	==================================================

INSERT	INTO	@l3_district_changes		VALUES	(	229578,	'Saraswati Vihar',	'North Delhi'	),
													(	229567,	'Preet Vihar',		'Shahdara'		);

SET @cnt1 = @@ROWCOUNT;

UPDATE	l3
	SET	level_2_address_component_id	=	l2.level_2_address_component_id,
		audit_log_id	=	@al
FROM	level_3_address_components	l3
	JOIN	@l3_district_changes	d
		ON	(	l3.level_3_address_component_id	=	d.l3_id
			AND	l3.level_3_address_component_nm	=	d.l3_nm
			)
	JOIN	level_2_address_components	l2
		ON	(	l2.level_2_address_component_nm	=	d.new_l2
			AND	l2.level_1_address_component_id	=	@sid
			);

SET @cnt2 = @@ROWCOUNT;
IF (@cnt1 != @cnt2)
BEGIN
	RAISERROR ('Row counts of Level 3 District Changes mis-match; should be %d, but update only %d', 16, 1, @cnt1, @cnt2);
	ROLLBACK;
	RETURN;
END

UPDATE	level_3_address_components
	SET	level_3_address_component_nm	=	'Mehrauli',
		audit_log_id	=	@al
WHERE	level_3_address_component_id	=	229583
AND		level_3_address_component_nm	=	'Meharauli';
IF (@@ROWCOUNT != 1)
BEGIN
	RAISERROR ('Level 3 Rename of Meharauli did not work', 16, 1);
	ROLLBACK;
	RETURN;
END

--	==================================================
--	Ineffective Level 3
--	==================================================

UPDATE	level_3_address_components
	SET		effective_till	=	@fdt,
			audit_log_id	=	@al
WHERE	level_3_address_component_nm		LIKE	'% Delhi'
AND		level_3_address_component_nm	NOT	LIKE	'New Delhi';

SET @cnt1 = @@ROWCOUNT;
IF (@cnt1 != 9)
BEGIN
	RAISERROR ('Row counts of Ineffective Level 3 mis-match; should be 9, but update only %d', 16, 1, @cnt1);
	ROLLBACK;
	RETURN;
END

--	==================================================
--	New Districts and their Level 3 components
--	==================================================

SET @d_cd = 'NW';

INSERT	INTO	@l3_components	(	l2_nm, l3_nm	)	VALUES	(	'South East Delhi',	'Abul Fazal Enclave'	),
																(	'North Delhi',		'Adarsh Nagar'	),
																(	'Central Delhi',	'Ajmeri Gate'	),
																(	'North Delhi',		'Alipur'	),
																(	'North West Delhi',	'Aman Vihar'	),
																(	'South East Delhi',	'Amar Colony'	),
																(	'South Delhi',		'Ambedkar Nagar'	),
																(	'Central Delhi',	'Anand Parbat'	),
																(	'Shahdara',			'Anand Vihar'	),
																(	'East Delhi',		'Anarkali'	),
																(	'South East Delhi',	'Andrews Ganj'	),
																(	'Shahdara',			'Ashok Nagar'	),
																(	'North Delhi',		'Ashok Vihar'	),
																(	'South Delhi',		'Aya Nagar'	),
																(	'East Delhi',		'Azad Nagar'	),
																(	'Shahdara',			'Babar Pur'	),
																(	'South East Delhi',	'Badarpur'	),
																(	'North Delhi',		'Bakhtawarpur'	),
																(	'New Delhi',		'Baljit Nagar'	),
																(	'Central Delhi',	'Ballimaran'	),
																(	'North Delhi',		'Bankner'	),
																(	'South West Delhi',	'Bapraula'	),
																(	'North Delhi',		'Bawana'	),
																(	'Central Delhi',	'Bazar Sita Ram'	),
																(	'North Delhi',		'Begumpur'	),
																(	'North East Delhi',	'Bhajanpura'	),
																(	'North Delhi',		'Bhalswa'	),
																(	'South Delhi',		'Bhati'	),
																(	'South East Delhi',	'Bhogal'	),
																(	'South West Delhi',	'Bijwasan'	),
																(	'South West Delhi',	'Bindapur'	),
																(	'North East Delhi',	'Brahampuri'	),
																(	'North West Delhi',	'Budh Vihar'	),
																(	'Central Delhi',	'Burari'	),
																(	'Central Delhi',	'Chandni Chowk'	),
																(	'South Delhi',		'Chhattarpur'	),
																(	'South West Delhi',	'Chhawla'	),
																(	'New Delhi',		'Chirag Delhi'	),
																(	'New Delhi',		'Chitranjan Park'	),
																(	'North East Delhi',	'Chouhan Bangar'	),
																(	'Central Delhi',	'Civil Lines'	),
																(	'South West Delhi',	'Dabri'	),
																(	'South Delhi',		'Dakshinpuri'	),
																(	'South Delhi',		'Dakshinpuri Extension'	),
																(	'East Delhi',		'Dallupura'	),
																(	'South East Delhi',	'Darya Ganj'	),
																(	'Central Delhi',	'Delhi Gate'	),
																(	'South Delhi',		'Deoli'	),
																(	'Central Delhi',	'Dev Nagar'	),
																(	'South Delhi',		'Devli'	),
																(	'Central Delhi',	'Dharampura'	),
																(	'North Delhi',		'Dhirpur'	),
																(	'South West Delhi',	'Dichaon Kalan'	),
																(	'Shahdara',			'Dilshad Colony'	),
																(	'Shahdara',			'Dilshad Garden'	),
																(	'Shahdara',			'Durgapuri'	),
																(	'South West Delhi',	'Dwarka'	),
																(	'New Delhi',		'East of Kailash'	),
																(	'New Delhi',		'East Patel Nagar'	),
																(	'Central Delhi',	'G.T.B. Nagar'	),
																(	'East Delhi',		'Gandhi Nagar'	),
																(	'North East Delhi',	'Gautam Puri'	),
																(	'East Delhi',		'Geeta Colony'	),
																(	'East Delhi',		'Gharoli'	),
																(	'North East Delhi',	'Ghonda'	),
																(	'East Delhi',		'Ghondli'	),
																(	'South West Delhi',	'Ghuman Hera'	),
																(	'North East Delhi',	'Gokalpuri'	),
																(	'South West Delhi',	'Gopal Nagar'	),
																(	'South East Delhi',	'Govind Puri'	),
																(	'New Delhi',		'Greater Kailash'	),
																(	'West Delhi',		'Guru Harikishan Nagar'	),
																(	'North West Delhi',	'Haiderpur'	),
																(	'South East Delhi',	'Hari Nagar'	),
																(	'West Delhi',		'Hari Nagar'	),
																(	'South East Delhi',	'Harkesh Nagar'	),
																(	'North East Delhi',	'Harsh Vihar'	),
																(	'South West Delhi',	'Hastsal'	),
																(	'South Delhi',		'Hauz Khas'	),
																(	'South Delhi',		'Hauz Rani'	),
																(	'North Delhi',		'Holambi Khurd'	),
																(	'Shahdara',			'I.P. Extension'	),
																(	'New Delhi',		'Inderpuri'	),
																(	'South West Delhi',	'Isapur'	),
																(	'North East Delhi',	'Jaffrabad'	),
																(	'North Delhi',		'Jahangir Puri'	),
																(	'South East Delhi',	'Jaitpur'	),
																(	'Central Delhi',	'Jama Masjid'	),
																(	'West Delhi',		'Janakpuri'	),
																(	'Shahdara',			'Janta Colony'	),
																(	'Central Delhi',	'Jharoda'	),
																(	'Shahdara',			'Jhilmil'	),
																(	'North East Delhi',	'Johripur'	),
																(	'Central Delhi',	'Kadipur'	),
																(	'South West Delhi',	'Kakraula'	),
																(	'South East Delhi',	'Kalkaji'	),
																(	'East Delhi',		'Kalyan Puri'	),
																(	'Central Delhi',	'Kamalpur'	),
																(	'North Delhi',		'Kamla Nagar'	),
																(	'North West Delhi',	'Kanjhawala'	),
																(	'East Delhi',		'Kanti Nagar'	),
																(	'South West Delhi',	'Kapashera'	),
																(	'West Delhi',		'Karampura'	),
																(	'North East Delhi',	'Karawal Nagar'	),
																(	'Shahdara',			'Kardampuri'	),
																(	'Central Delhi',	'Karol Bagh'	),
																(	'South East Delhi',	'Kasturba Nagar'	),
																(	'North Delhi',		'Keshavpuram'	),
																(	'West Delhi',		'Keshopur'	),
																(	'South West Delhi',	'Khaira'	),
																(	'North East Delhi',	'Khajuri Khas'	),
																(	'South Delhi',		'Khanpur'	),
																(	'West Delhi',		'Khayala'	),
																(	'East Delhi',		'Khichdipur'	),
																(	'West Delhi',		'Khyala'	),
																(	'North West Delhi',	'Kirari'	),
																(	'West Delhi',		'Kirti Nagar'	),
																(	'Central Delhi',	'Kishan Ganj'	),
																(	'South Delhi',		'Kishan Garh'	),
																(	'East Delhi',		'Kishan Kunj'	),
																(	'North West Delhi',	'Kohat Enclave'	),
																(	'East Delhi',		'Kondli'	),
																(	'South East Delhi',	'Kotla Mubarakpur'	),
																(	'East Delhi',		'Krishna Nagar'	),
																(	'South West Delhi',	'Kunwar Singh Nagar'	),
																(	'South Delhi',		'Lado Sarai'	),
																(	'South East Delhi',	'Lajpat Nagar'	),
																(	'East Delhi',		'Lakshmi Nagar'	),
																(	'West Delhi',		'Lakshmi Park'	),
																(	'South Delhi',		'Madangir'	),
																(	'South East Delhi',	'Madanpur Khadar'	),
																(	'South West Delhi',	'Madhu Vihar'	),
																(	'West Delhi',		'Madipur'	),
																(	'South West Delhi',	'Mahavir Enclave'	),
																(	'West Delhi',		'Mahavir Nagar'	),
																(	'South West Delhi',	'Mahipalpur'	),
																(	'Central Delhi',	'Malka Ganj'	),
																(	'South Delhi',		'Malviya Nagar'	),
																(	'East Delhi',		'Mandawali'	),
																(	'South West Delhi',	'Manglapuri'	),
																(	'North West Delhi',	'Mangolpuri'	),
																(	'South West Delhi',	'Matiala'	),
																(	'North East Delhi',	'Maujpur'	),
																(	'East Delhi',		'Mayur Vihar Phase-I'	),
																(	'East Delhi',		'Mayur Vihar Phase-II'	),
																(	'South Delhi',		'Mehrauli'	),
																(	'West Delhi',		'Milap Nagar'	),
																(	'South East Delhi',	'Mithapur'	),
																(	'North Delhi',		'Model Town'	),
																(	'South West Delhi',	'Mohan Garden'	),
																(	'South East Delhi',	'Molarband'	),
																(	'West Delhi',		'Moti Nagar'	),
																(	'North West Delhi',	'Mubarakpur Dabas'	),
																(	'Central Delhi',	'Mukherjee Nagar'	),
																(	'Central Delhi',	'Mukund Pur'	),
																(	'North West Delhi',	'Mundka'	),
																(	'New Delhi',		'Munirka'	),
																(	'North East Delhi',	'Mustafabad'	),
																(	'South West Delhi',	'Najafgarh'	),
																(	'New Delhi',		'Nanakpura'	),
																(	'Shahdara',			'Nand Nagri'	),
																(	'West Delhi',		'Nangal Raya'	),
																(	'North Delhi',		'Nangal Thakran'	),
																(	'South West Delhi',	'Nangli Sakravati'	),
																(	'North West Delhi',	'Nangloi'	),
																(	'West Delhi',		'Nangloi Jat'	),
																(	'New Delhi',		'Naraina'	),
																(	'North Delhi',		'Narela'	),
																(	'South West Delhi',	'Nawada'	),
																(	'North East Delhi',	'Nehru Vihar'	),
																(	'East Delhi',		'New Ashok Nagar'	),
																(	'Shahdara',			'New Seemapuri'	),
																(	'North East Delhi',	'New Usmanpur'	),
																(	'West Delhi',		'Nihal Vihar'	),
																(	'North West Delhi',	'Nilothi'	),
																(	'North Delhi',		'Nimri Colony'	),
																(	'North West Delhi',	'Nithari'	),
																(	'South East Delhi',	'Nizamuddin'	),
																(	'South East Delhi',	'Okhla'	),
																(	'New Delhi',		'Old Rajinder Nagar'	),
																(	'South East Delhi',	'Om Vihar'	),
																(	'Central Delhi',	'Pahar Ganj'	),
																(	'South West Delhi',	'Palam'	),
																(	'East Delhi',		'Pandav Nagar'	),
																(	'West Delhi',		'Partap Nagar'	),
																(	'North Delhi',		'Paschim Vihar'	),
																(	'East Delhi',		'Patpar Ganj'	),
																(	'West Delhi',		'Peera Garhi'	),
																(	'North West Delhi',	'Pitampura'	),
																(	'North Delhi',		'Pooth Khurd'	),
																(	'Shahdara',			'Preet Vihar'	),
																(	'North West Delhi',	'Prem Nagar'	),
																(	'South East Delhi',	'Pul Pehlad'	),
																(	'West Delhi',		'Punjabi Bagh'	),
																(	'South Delhi',		'Pushp Vihar'	),
																(	'Central Delhi',	'Quraish Nagar'	),
																(	'New Delhi',		'R K Puram'	),
																(	'East Delhi',		'Raghubarpura'	),
																(	'West Delhi',		'Raghubir Nagar'	),
																(	'West Delhi',		'Raja Garden'	),
																(	'New Delhi',		'Rajinder Nagar'	),
																(	'South West Delhi',	'Rajnagar'	),
																(	'West Delhi',		'Rajouri Garden'	),
																(	'Central Delhi',	'Ram Nagar'	),
																(	'Shahdara',			'Ram Nagar'	),
																(	'West Delhi',		'Ramesh Nagar'	),
																(	'North West Delhi',	'Rampura'	),
																(	'South West Delhi',	'Ranhola'	),
																(	'North Delhi',		'Rani Bagh'	),
																(	'North West Delhi',	'Rani Khera'	),
																(	'New Delhi',		'Ranjit Nagar'	),
																(	'North West Delhi',	'Rithala'	),
																(	'North Delhi',		'Rohini'	),
																(	'North West Delhi',	'Rohini'	),
																(	'Shahdara',			'Rohtash Nagar'	),
																(	'South West Delhi',	'Roshanpura'	),
																(	'North East Delhi',	'Saboli'	),
																(	'Central Delhi',	'Sadar Bazar'	),
																(	'North East Delhi',	'Sadatpur'	),
																(	'South West Delhi',	'Sadh Nagar'	),
																(	'South Delhi',		'Safdarjung Enclave'	),
																(	'South West Delhi',	'Sagarpur'	),
																(	'South Delhi',		'Said Ul Ajaib'	),
																(	'South West Delhi',	'Sainik Enclave'	),
																(	'North Delhi',		'Samaypur Badli'	),
																(	'North Delhi',		'Sangam Park'	),
																(	'South Delhi',		'Sangam Vihar'	),
																(	'South East Delhi',	'Sangam Vihar'	),
																(	'Central Delhi',	'Sant Nagar'	),
																(	'North Delhi',		'Sarai Pipal Thala'	),
																(	'North Delhi',		'Saraswati Vihar'	),
																(	'South East Delhi',	'Sarita Vihar'	),
																(	'North Delhi',		'Sarup Nagar'	),
																(	'North Delhi',		'Sawan Park'	),
																(	'North East Delhi',	'Seelampur'	),
																(	'Shahdara',			'Shahdara'	),
																(	'New Delhi',		'Shahpur Jat'	),
																(	'East Delhi',		'Shakarpur'	),
																(	'North West Delhi',	'Shakurpur'	),
																(	'North West Delhi',	'Shalimar Bagh'	),
																(	'Central Delhi',	'Shastri Nagar'	),
																(	'East Delhi',		'Shastri Park'	),
																(	'North East Delhi',	'Shiv Vihar'	),
																(	'South East Delhi',	'Shri Niwas Puri'	),
																(	'South East Delhi',	'Siddharth Nagar'	),
																(	'West Delhi',		'Sita Puri'	),
																(	'North East Delhi',	'Sonia Vihar'	),
																(	'North East Delhi',	'Sri Ram Colony'	),
																(	'Shahdara',			'Subhash Mohalla'	),
																(	'West Delhi',		'Subhash Nagar'	),
																(	'North West Delhi',	'Suleman Nagar'	),
																(	'North West Delhi',	'Sultanpuri'	),
																(	'Shahdara',			'Sundar Nagari'	),
																(	'North Delhi',		'Swami Shardanand Colony'	),
																(	'West Delhi',		'Tagore Garden'	),
																(	'South East Delhi',	'Tekhand'	),
																(	'South Delhi',		'Tigri'	),
																(	'West Delhi',		'Tilak Nagar'	),
																(	'Central Delhi',	'Timarpur'	),
																(	'North West Delhi',	'Tri Nagar'	),
																(	'East Delhi',		'Trilokpuri'	),
																(	'South East Delhi',	'Tughlakabad'	),
																(	'South East Delhi',	'Tughlakabad Extension'	),
																(	'North East Delhi',	'Tukmirpur'	),
																(	'South West Delhi',	'Uttam Nagar'	),
																(	'South Delhi',		'Vasant Kunj'	),
																(	'New Delhi',		'Vasant Vihar'	),
																(	'North West Delhi',	'Vijay Vihar'	),
																(	'South West Delhi',	'Vikas Nagar'	),
																(	'South West Delhi',	'Vikaspuri'	),
																(	'East Delhi',		'Vinod Nagar'	),
																(	'West Delhi',		'Vishnu Garden'	),
																(	'Shahdara',			'Vishwas Nagar'	),
																(	'Shahdara',			'Vivek Vihar'	),
																(	'North Delhi',		'Wazirpur'	),
																(	'Shahdara',			'Welcome Colony'	),
																(	'New Delhi',		'West Patel Nagar'	),
																(	'North East Delhi',	'Yamuna Vihar'	),
																(	'South East Delhi',	'Zakir Nagar'	);
SET @cnt2 = @@ROWCOUNT;

--	==================================================

--	===========================================================
--	Check whether Level 3 Code has been provided, and is UNIQUE
--	===========================================================

UPDATE	@l3_components
	SET	l3_cd	=	SUBSTRING (l3_nm, 1, 1) + CASE WHEN SUBSTRING (l3_nm, 1, 1) IN (	'D'	) THEN '1' ELSE '' END
WHERE	l3_cd	IS	NULL;

WITH dups AS (
	SELECT	l2_nm, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY l2_nm, l3_cd
		HAVING 	COUNT (*)	>	1
),
uniq AS	(
	SELECT	d.l3_cd + CONVERT (VARCHAR, ROW_NUMBER () OVER (PARTITION BY d.l2_nm, d.l3_cd ORDER BY l3.l3_nm) + 2) l3_cd, d.l2_nm, l3.l3_nm
	FROM	dups	d
		JOIN	@l3_components	l3
			ON	(	d.l2_nm	=	l3.l2_nm
				AND	d.l3_cd	=	l3.l3_cd
				)
)
UPDATE	l3
	SET	l3_cd	=	d.l3_cd
FROM	uniq	d
	JOIN	@l3_components	l3
		ON	(	d.l2_nm	=	l3.l2_nm
			AND	d.l3_nm	=	l3.l3_nm
			);

WITH dups AS (
	SELECT	l2_nm, l3_cd, COUNT (*) cnt
	FROM	@l3_components
	GROUP BY l2_nm, l3_cd
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
--	We now INSERT into Level 3 Address Components
--	=================================================

INSERT INTO level_3_address_components
		(	level_3_address_component_cd, level_3_address_component_nm, level_2_address_component_id, is_authentic, effective_from, effective_till, audit_log_id	)
	SELECT	l3_cd, l3_nm, l2.level_2_address_component_id, 1, @fdt, @tdt, @al
	FROM	@l3_components	l3
		JOIN	level_2_address_components	l2
			ON	(	l2.level_1_address_component_id	=	@sid
				AND	l2.level_2_address_component_nm	=	l3.l2_nm
				)
		LEFT JOIN	level_3_address_components	l
			ON	(	l.level_2_address_component_id	=	l2.level_2_address_component_id
				AND	l.level_3_address_component_nm	=	l3_nm
				)
	WHERE	l.level_2_address_component_id	IS	NULL;
SET @cnt3 = @@ROWCOUNT + 25;
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

