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
WHERE	level_1_address_component_nm = 'ASSAM';

INSERT INTO	audit_logs
		(	[session_id], [application_id], [user_no], [user_role_id], [operation], [screen_id], [object_id], [operation_dts], [is_consumed]	)
	VALUES
		(	0, 'Script', 1, 'System', 'I', 'rev040', 'Address Components', GETDATE(), 0	);
	SET @al	=	SCOPE_IDENTITY ();

--	==================================================
--	Ineffective Districts
--	==================================================

INSERT	INTO	@ineffective_districts		VALUES	(	54,	'KAMRUP'				),
													(	55,	'KARBI ANGLOG'			),
													(	62,	'NORTH CACHAR HILLS'	),
													(	65,	'SONITPUT'				);
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
--	New Districts and their Level 3 components
--	==================================================

SET @d_cd = 'BK';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Baksa'	);
SET @cnt1 = @@ROWCOUNT;

INSERT	INTO	@l3_components	VALUES	(	@d_cd,	'BP',	'Baganpara'		),
										(	@d_cd,	'BJ',	'Bajali'		),
										(	@d_cd,	'BR',	'Barama'		),
										(	@d_cd,	'BN',	'Barnagar'		),
										(	@d_cd,	'BK',	'Baska'			),
										(	@d_cd,	'GG',	'Ghograpar'		),
										(	@d_cd,	'GR',	'Goreswar'		),
										(	@d_cd,	'J',	'Jalah'			),
										(	@d_cd,	'P',	'Pathorighat'	),
										(	@d_cd,	'R',	'Rangia'		),
										(	@d_cd,	'S',	'Sarupeta'		),
										(	@d_cd,	'TP',	'Tamulpur'		),
										(	@d_cd,	'T',	'Tihu'			);
SET @cnt2 = @@ROWCOUNT;

--	==================================================

SET @d_cd = 'BN';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Biswanath'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
		(	@d_cd,	'Ara Bari'			), (	@d_cd,	'Ara Gang'		), (	@d_cd,	'Babu Bil'			), (	@d_cd,	'Bagari Suti'		), (	@d_cd,	'Baghmari'		), (	@d_cd,	'Bagijuli Pathar'	),
		(	@d_cd,	'Bagijuli'			), (	@d_cd,	'Bahbari Gaon'	), (	@d_cd,	'Bahbari Pathar'	), (	@d_cd,	'Balamguri'			), (	@d_cd,	'Bali Dubi'		), (	@d_cd,	'Bali Pukhuri'		),
		(	@d_cd,	'Balu Danga'		), (	@d_cd,	'Bam Gaon'		), (	@d_cd,	'Bamuni Pathar'		), (	@d_cd,	'Bapujar'			), (	@d_cd,	'Barajuli Gaon'	), (	@d_cd,	'Barajuli Nepali'	),
		(	@d_cd,	'Barajuli Pathar'	), (	@d_cd,	'Barajuli'		), (	@d_cd,	'Barali Mara'		), (	@d_cd,	'Barbil Kachari'	), (	@d_cd,	'Barbil'		), (	@d_cd,	'Bargang Chapari'	),
		(	@d_cd,	'Bargang'			), (	@d_cd,	'Barjarani Bangali'	), (	@d_cd,	'Barjarani Mikir'	), (	@d_cd,	'Barjarani'		), (	@d_cd,	'Barkatia Bari'	), (	@d_cd,	'Barkura'	),
		(	@d_cd,	'Barpathar'			), (	@d_cd,	'Barpukhuri'	), (	@d_cd,	'Batia Mari'		), (	@d_cd,	'Batiamari'			), (	@d_cd,	'Bedeti Guri'	), (	@d_cd,	'Bedeti Pathar'	),
		(	@d_cd,	'Bedeti'			), (	@d_cd,	'Begun Bari Bagicha'	), (	@d_cd,	'Behali Mikir'	), (	@d_cd,	'Behali'		), (	@d_cd,	'Bengabari'		), (	@d_cd,	'Bengenabari'	),
		(	@d_cd,	'Bharali Juli'		), (	@d_cd,	'Bhimajuli'		), (	@d_cd,	'Bhir Gaon'			), (	@d_cd,	'Bholakata'			), (	@d_cd,	'Bihmari Gaon'	), (	@d_cd,	'Bihmari Jarani'	),
		(	@d_cd,	'Bihmari'			), (	@d_cd,	'Bihpukhuri Bongali'	), (	@d_cd,	'Bihpukhuri Kachari'	), (	@d_cd,	'Bihpukhuri'	), (	@d_cd,	'Bijoy Pur'	), (	@d_cd,	'Bijuli Jarani'	),
		(	@d_cd,	'Biri Jan'			), (	@d_cd,	'Biswanath Town'	), (	@d_cd,	'Bongali Gaon'	), (	@d_cd,	'Bongaon'		), (	@d_cd,	'Brahmaputra Chapari'	), (	@d_cd,	'Chalia Chapari'	),
		(	@d_cd,	'Chalia'			), (	@d_cd,	'Chengelijan'		), (	@d_cd,	'Cheni Mari'	), (	@d_cd,	'Chuwa Guri'	), (	@d_cd,	'Da Gaon'			), (	@d_cd,	'Dakhin Da Gaon'	),
		(	@d_cd,	'Deka Pathar'		), (	@d_cd,	'Dhali Dilisang'	), (	@d_cd,	'Dhali Kherbari'	), (	@d_cd,	'Dhali Kohiar Bari'	), (	@d_cd,	'Dhali Lakhan Basti'	), (	@d_cd,	'Dhali Mara Diring'	),
		(	@d_cd,	'Dhali'				), (	@d_cd,	'Dhemaji Bari'	), (	@d_cd,	'Dighal Tangani'	), (	@d_cd,	'Dimapur'	), (	@d_cd,	'Diring Pathar'	), (	@d_cd,	'Diring'	),
		(	@d_cd,	'Disiri Pathar'		), (	@d_cd,	'Fatika Basti'	), (	@d_cd,	'Gaibandha'	), (	@d_cd,	'Ganeshbari'	), (	@d_cd,	'Gang Dalani'	), (	@d_cd,	'Gang Mouthan'	),
		(	@d_cd,	'Gar Bhitar'		), (	@d_cd,	'Gare Hagi'	), (	@d_cd,	'Garoi Mari'	), (	@d_cd,	'Garoimari'	), (	@d_cd,	'Gela Pukhuri'	), (	@d_cd,	'Gereki'	),
		(	@d_cd,	'Gerua Bari'		), (	@d_cd,	'Ghora Mari'	), (	@d_cd,	'Goghali Bhanga'	), (	@d_cd,	'Gowal Toli'	), (	@d_cd,	'Hatimara Pathar'	), (	@d_cd,	'Jahaj Duba'	),
		(	@d_cd,	'Jaluk Bari'		), (	@d_cd,	'Jamuani'	), (	@d_cd,	'Japari Jan'	), (	@d_cd,	'Japow Bari'	), (	@d_cd,	'Jara Bari'	), (	@d_cd,	'Jarani'	),
		(	@d_cd,	'Jingia'			), (	@d_cd,	'Joypur'	), (	@d_cd,	'Kachamari'	), (	@d_cd,	'Kadamani Basti'	), (	@d_cd,	'Kadamani Gaon'	), (	@d_cd,	'Kadamani Pathar'	),
		(	@d_cd,	'Kala Pani'			), (	@d_cd,	'Kalahandi'	), (	@d_cd,	'Kamar Gaon'	), (	@d_cd,	'Kamar Jan'	), (	@d_cd,	'Kamar Pukhuri'	), (	@d_cd,	'Kathani Bari Pathar'	),
		(	@d_cd,	'Kathani Bari'		), (	@d_cd,	'Kathani Basti'	), (	@d_cd,	'Ketela'	), (	@d_cd,	'Khara Simalu'	), (	@d_cd,	'Khelmati Gaon'	), (	@d_cd,	'Khelmati Pathar'	),
		(	@d_cd,	'Koch Gaon'			), (	@d_cd,	'Komalia'	), (	@d_cd,	'Komurakhati Grazing'	), (	@d_cd,	'Koyalajuli'	), (	@d_cd,	'Kuhiar Bari Bongali'	), (	@d_cd,	'Kuhiar Bari Nepali'	),
		(	@d_cd,	'Kulaguri'			), (	@d_cd,	'Kulaguri Gaon'	), (	@d_cd,	'Kulaguri Jarani'	), (	@d_cd,	'Kulaguri Pathar'	), (	@d_cd,	'Kuwari'	), (	@d_cd,	'Lal Pukhuri'	),
		(	@d_cd,	'Laow Dalani'		), (	@d_cd,	'Lehu Gaon'	), (	@d_cd,	'Madhu Rani'	), (	@d_cd,	'Madhupur'	), (	@d_cd,	'Mahalakhi'	), (	@d_cd,	'Mahan Brahmaputra Chapori'	),
		(	@d_cd,	'Mahjulibasti'		), (	@d_cd,	'Mahjulipathar'	), (	@d_cd,	'Majuli Garh'	), (	@d_cd,	'Majuli Ghur'	), (	@d_cd,	'Maral Gaon'	), (	@d_cd,	'Maran Gaon'	),
		(	@d_cd,	'Maruabasti'		), (	@d_cd,	'Mijika'	), (	@d_cd,	'Mijikajan'	), (	@d_cd,	'Mijuka'	), (	@d_cd,	'Milanpur'	), (	@d_cd,	'Missamari'	),
		(	@d_cd,	'Mizikajan'			), (	@d_cd,	'Moinaguri'	), (	@d_cd,	'Monabari Basti'	), (	@d_cd,	'Monabari Pathar'	), (	@d_cd,	'Monabari'	), (	@d_cd,	'Mugachang'	),
		(	@d_cd,	'Muja Basti'		), (	@d_cd,	'Mukhar Garh'	), (	@d_cd,	'Na Bazar'	), (	@d_cd,	'Na Pamua'	), (	@d_cd,	'Nahar Bari'	), (	@d_cd,	'Naharani'	),
		(	@d_cd,	'Nakania Pathar'	), (	@d_cd,	'Nasbor Gaon'	), (	@d_cd,	'Natun Bihmari'	), (	@d_cd,	'Natun Serelia'	), (	@d_cd,	'Nepali Bari'	), (	@d_cd,	'Nil Bari'	),
		(	@d_cd,	'Nilpur'			), (	@d_cd,	'Niz Baghmara'	), (	@d_cd,	'Niz Behali'	), (	@d_cd,	'Niz Biswanath'	), (	@d_cd,	'Niz Salmara'	), (	@d_cd,	'Nonke Bongali'	),
		(	@d_cd,	'Omarjan'			), (	@d_cd,	'Oria Basti'	), (	@d_cd,	'Pabhoi'	), (	@d_cd,	'Pachim Jinjia'	), (	@d_cd,	'Padum Pukhuri'	), (	@d_cd,	'Pani Bharal'	),
		(	@d_cd,	'Papari Guri'		), (	@d_cd,	'Pathai Jan'	), (	@d_cd,	'Petuli Bari'	), (	@d_cd,	'Pithia Mari'	), (	@d_cd,	'Pratap Garh'	), (	@d_cd,	'Pub Jinjia'	),
		(	@d_cd,	'Pulisomani'		), (	@d_cd,	'Ranga Jan'	), (	@d_cd,	'Ranga Muri'	), (	@d_cd,	'Rangagara'	), (	@d_cd,	'Rangagarah'	), (	@d_cd,	'Rangsali Dalani'	),
		(	@d_cd,	'Ratowa Pathar'		), (	@d_cd,	'Rongajan'	), (	@d_cd,	'Rongsali Sonari'	), (	@d_cd,	'Rowmari'	), (	@d_cd,	'Rupajuli'	), (	@d_cd,	'Sadharu Ghop'	),
		(	@d_cd,	'Sadharu Guri'		), (	@d_cd,	'Sadharu'	), (	@d_cd,	'Sakomatha Gaon'	), (	@d_cd,	'Sakomatha'	), (	@d_cd,	'Sal Mari'	), (	@d_cd,	'Salai Khati'	),
		(	@d_cd,	'Salai Khatibasti'	), (	@d_cd,	'Salai Khatipathar'	), (	@d_cd,	'Salaikhati Bangali'	), (	@d_cd,	'Salaikhati Kachari'	), (	@d_cd,	'Salaikhati Mikir'	), (	@d_cd,	'Samur Juli'	),
		(	@d_cd,	'Sarih Bil'			), (	@d_cd,	'Serelia Bongali'	), (	@d_cd,	'Serelia'	), (	@d_cd,	'Serelia Kuhiar Bari'	), (	@d_cd,	'Serelia Pathar'	), (	@d_cd,	'Sial Mari'	),
		(	@d_cd,	'Siju Bari'			), (	@d_cd,	'Sila Mari'	), (	@d_cd,	'Simalu Guri'	), (	@d_cd,	'Singi Bil'	), (	@d_cd,	'Singi Mari'	), (	@d_cd,	'Solmari Bongali'	),
		(	@d_cd,	'Solmari'			), (	@d_cd,	'Sonabil'	), (	@d_cd,	'Sonajuli'	), (	@d_cd,	'Sukan Suti'	), (	@d_cd,	'Tarajuli'	), (	@d_cd,	'Telengania'	),
		(	@d_cd,	'Tenga Bari'		), (	@d_cd,	'Thaikirguri'	), (	@d_cd,	'Than Behali'	), (	@d_cd,	'Thandapani'	), (	@d_cd,	'Tinisuti Mukh'	), (	@d_cd,	'Tipu Basti'	),
		(	@d_cd,	'Umato Mani'		), (	@d_cd,	'Uttar Da Gaon'	), (	@d_cd,	'Uttar Jinjia'	), (	@d_cd,	'Biswanath Chariali'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'CR';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Charaideo'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
	(	@d_cd,	'Mahmora'		), (	@d_cd,	'Sepon	'			), (	@d_cd,	'Nizkhaloighugura'	), (	@d_cd,	'Doba'		), (	@d_cd,	'Bordoba'		),
	(	@d_cd,	'Kakotibari'	), (	@d_cd,	'Bharalipukhuri'	), (	@d_cd,	'Khumatai'			), (	@d_cd,	'Sarbudoi'	), (	@d_cd,	'Udoipur'		),
	(	@d_cd,	'Milon'			), (	@d_cd,	'Desangpani'		), (	@d_cd,	'Lakwa'				), (	@d_cd,	'Charaideo'	), (	@d_cd,	'Chalapather'	),
	(	@d_cd,	'Hollowphukon'	), (	@d_cd,	'Nimonagarh'		), (	@d_cd,	'Sapekhati'			), (	@d_cd,	'Borhat'	), (	@d_cd,	'Naharpukhuri'	),
	(	@d_cd,	'Purbanchal'	), (	@d_cd,	'Bhuyankhat'		), (	@d_cd,	'Udoishree'			), (	@d_cd,	'Rohon'		),
	(	@d_cd,	'Boroguri'		), (	@d_cd,	'Haridev'			), (	@d_cd,	'Ahukhat'			), (	@d_cd,	'Sonali'	), (	@d_cd,	'Sarupother'	),
	(	@d_cd,	'Bengenabari'	), (	@d_cd,	'Longpotia'			), (	@d_cd,	'Milonjyoti'		), (	@d_cd,	'Sonari'	), (	@d_cd,	'Rajapukhuri'	),
	(	@d_cd,	'Towkok'		), (	@d_cd,	'Bhojo'				), (	@d_cd,	'Abhoipur'			), (	@d_cd,	'Suffry'	), (	@d_cd,	'Nazira'		),
	(	@d_cd,	'Sukafa'		), (	@d_cd,	'Lengibor'			);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'CH';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Chirang'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	VALUES	(	@d_cd,	'BN',	'Barnagar'		),
										(	@d_cd,	'BG',	'Bengtol'		),
										(	@d_cd,	'BJ',	'Bijni'			),
										(	@d_cd,	'BN',	'Bongaigaon'	),
										(	@d_cd,	'K',	'Kokrajhar'		),
										(	@d_cd,	'S',	'Sidli'			);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'DH';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Dima Hasao'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	VALUES	(	@d_cd,	'HL',	'Haflong'		),
										(	@d_cd,	'M',	'Mahur'			),
										(	@d_cd,	'MB',	'Maibong'		),
										(	@d_cd,	'U',	'Umrangso'		),
										(	@d_cd,	'HG',	'Harangajao'	),
										(	@d_cd,	'L',	'Langting'		),
										(	@d_cd,	'D',	'Diyungbra'		);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'HJ';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Hojai'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	VALUES	(	@d_cd,	'H',	'Hojai'				),
										(	@d_cd,	'D',	'Dabaka'			),
										(	@d_cd,	'L',	'Lanka'				),
										(	@d_cd,	'LD',	'Lumding'			),
										(	@d_cd,	'S',	'Sankardev Nagar'	);


SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'MJ';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Majuli'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES	(	@d_cd,	'Garamur Phutuki Chapori'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'KM';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Kamrup Metropolitan'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Azara'				),
								(	@d_cd,	'Chandrapur'		),
								(	@d_cd,	'Dispur'			),
								(	@d_cd,	'Guwahati'			),
								(	@d_cd,	'North Guwahati'	),
								(	@d_cd,	'Sonapur'			);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'KR';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Kamrup Rural'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Amingaon'      	),
								(	@d_cd,	'Boko'          	),
								(	@d_cd,	'Chamaria'      	),
								(	@d_cd,	'Chhaygaon'     	),
								(	@d_cd,	'Goreswar'      	),
								(	@d_cd,	'Goroimari'     	),
								(	@d_cd,	'Hajo'          	),
								(	@d_cd,	'Kamalpur'      	),
								(	@d_cd,	'Koya'          	),
								(	@d_cd,	'Nagarbera'     	),
								(	@d_cd,	'North Guwahati'	),
								(	@d_cd,	'Palasbari'     	),
								(	@d_cd,	'Rangia'        	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'EKA';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'East Karbi Anglong'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Amlakhi'	),
								(	@d_cd,	'Bokajan'	),
								(	@d_cd,	'Bokulia'	),
								(	@d_cd,	'Diphu'		),
								(	@d_cd,	'Donka'		),
								(	@d_cd,	'Dokmoka'	),
								(	@d_cd,	'Howraghat'	),
								(	@d_cd,	'Manja'		),
								(	@d_cd,	'Phuloni'	),
								(	@d_cd,	'Silonijan'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'WKA';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'West Karbi Anglong'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Hamren'		),
								(	@d_cd,	'Baithalangso'	),
								(	@d_cd,	'Dongkamukam'	);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'SSM';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'South Salmara-Mankachar'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Hatsingimari'	),
								(	@d_cd,	'Mankachar'		);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

--	==================================================

SET @d_cd = 'UG';

INSERT	INTO	@districts		VALUES	(	@d_cd,	'Udalguri'	);
SET @cnt1 = @cnt1 + @@ROWCOUNT;

INSERT	INTO	@l3_components	(	d_cd, l3_nm	) VALUES
								(	@d_cd,	'Dalgoan'		),
								(	@d_cd,	'Dhekiajuli'	),
								(	@d_cd,	'Harisinga'		),
								(	@d_cd,	'Kalaigaon'		),
								(	@d_cd,	'Khoirabari'	),
								(	@d_cd,	'Mangaldoi'		),
								(	@d_cd,	'Mazbat'		),
								(	@d_cd,	'Pathorighat'	),
								(	@d_cd,	'Udalguri'		);

SET @cnt2 = @cnt2 + @@ROWCOUNT;

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


SELECT	*
FROM	level_2_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 3;

SELECT	*
FROM	level_3_address_components
WHERE	audit_log_id	=	@al
ORDER	BY	8, 4, 3;
