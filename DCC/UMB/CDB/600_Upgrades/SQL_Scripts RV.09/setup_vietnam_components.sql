
/* ==================================================================================
    	Source File		:	setup_vietnam_components.sql
	Author(s)		:	Auto-generated(Anil)	
	Started On		:	11-10-2014
	Module ID		:	CDB
	Last updated		:	11-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of Vietnam are set-up
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
WHERE	country_nm	=	'Vietnam';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country Vietnam not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'District',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Thua Thien-Hue'            ,	     'A Luoi',	'TT',	'AL');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'An Bien',	'KG',	'AB');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'An Duong',	'HP',	'AD');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Anh Son',	'NA',	'AS');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'An Khe',	'GL',	'AK');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'An Lao',	'BD',	'AL');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'An Lao',	'HP',	'AL');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'An Minh',	'KG',	'AM');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'An Nhon',	'BD',	'AN');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'An Phu',	'AG',	'AP');
INSERT INTO @tbl VALUES ('Hung Yen'            ,	     'An Thi',	'HY',	'AT');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Ayun Pa',	'GL',	'AP');
INSERT INTO @tbl VALUES ('Bac Can'            ,	     'Ba Be',	'BK',	'BB');
INSERT INTO @tbl VALUES ('Ninh Thuan'            ,	     'Bac Ai',	'NT',	'BA');
INSERT INTO @tbl VALUES ('Binh Thuan'            ,	     'Bac Binh',	'BU',	'BB');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Bac Giang',	'BG',	'BG');
INSERT INTO @tbl VALUES ('Lao Cai'            ,	     'Bac Ha',	'LO',	'BH');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Ba Che',	'QN',	'BC');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Bach Long Vy',	'HP',	'BL');
INSERT INTO @tbl VALUES ('Bac Can'            ,	     'Bach Thong',	'BK',	'BT');
INSERT INTO @tbl VALUES ('Bac Can'            ,	     'Bac Kan',	'BK',	'BK');
INSERT INTO @tbl VALUES ('Bac Lieu'            ,	     'Bac Lieu',	'BL',	'BL');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Bac Me',	'HG',	'BM');
INSERT INTO @tbl VALUES ('Bac Ninh'            ,	     'Bac Ninh',	'BN',	'BN');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Bac Quang',	'HG',	'BQ');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Bac Son',	'LS',	'BS');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Bac Tra My',	'QM',	'BT');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Bac Yen',	'SL',	'BY');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Ba Dinh',	'HI',	'BD');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Bao Lac',	'CB',	'BC');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Bao Lam',	'CB',	'BM');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Bao Lam',	'LD',	'BM');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Bao Loc',	'LD',	'BC');
INSERT INTO @tbl VALUES ('Lao Cai'            ,	     'Bao Thang',	'LO',	'BT');
INSERT INTO @tbl VALUES ('Lao Cai'            ,	     'Bao Yen',	'LO',	'BY');
INSERT INTO @tbl VALUES ('Ba Ria-Vung Tau'            ,	     'Ba Ria',	'BV',	'BR');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Ba Thuoc',	'TH',	'BT');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Ba To',	'QG',	'BT');
INSERT INTO @tbl VALUES ('Ben Tre'            ,	     'Ba Tri',	'BR',	'BA');
INSERT INTO @tbl VALUES ('Lao Cai'            ,	     'Bat Xat',	'LO',	'BX');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Ba Vi',	'HI',	'BV');
INSERT INTO @tbl VALUES ('Binh Duong'            ,	     'Ben Cat',	'BI',	'BC');
INSERT INTO @tbl VALUES ('Tay Ninh'            ,	     'Ben Cau',	'TN',	'BC');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Ben Luc',	'LA',	'BL');
INSERT INTO @tbl VALUES ('Ben Tre'            ,	     'Ben Tre',	'BR',	'BE');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Bien Hoa',	'DN',	'BH');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Bim Son',	'TH',	'BS');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Binh Chanh',	'HC',	'BC');
INSERT INTO @tbl VALUES ('Ben Tre'            ,	     'Binh Dai',	'BR',	'BD');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Binh Gia',	'LS',	'BG');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Binh Giang',	'HD',	'BG');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Binh Lieu',	'QN',	'BL');
INSERT INTO @tbl VALUES ('Binh Phuoc'            ,	     'Binh Long',	'BP',	'BL');
INSERT INTO @tbl VALUES ('Ha Nam'            ,	     'Binh Luc',	'HM',	'BL');
INSERT INTO @tbl VALUES ('Vinh Long'            ,	     'Binh Minh',	'VL',	'BM');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Binh Son',	'QG',	'BS');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Binh Tan',	'HC',	'BT');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Binh Thanh',	'HC',	'BH');
INSERT INTO @tbl VALUES ('Can Tho'            ,	     'Binh Thuy',	'CN',	'BT');
INSERT INTO @tbl VALUES ('Vinh Phuc'            ,	     'Binh Xuyen',	'VC',	'BX');
INSERT INTO @tbl VALUES ('Quang Binh'            ,	     'Bo Trach',	'QB',	'BT');
INSERT INTO @tbl VALUES ('Binh Phuoc'            ,	     'Bu Dang',	'BP',	'BD');
INSERT INTO @tbl VALUES ('Binh Phuoc'            ,	     'Bu Dop',	'BP',	'BP');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Buon Don',	'DC',	'BD');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Buon Ma Thuot',	'DC',	'BM');
INSERT INTO @tbl VALUES ('Tien Giang'            ,	     'Cai Be',	'TG',	'CB');
INSERT INTO @tbl VALUES ('Tien Giang'            ,	     'Cai Lay',	'TG',	'CL');
INSERT INTO @tbl VALUES ('Ca Mau'            ,	     'Cai Nuoc',	'CM',	'CN');
INSERT INTO @tbl VALUES ('Can Tho'            ,	     'Cai Rang',	'CN',	'CR');
INSERT INTO @tbl VALUES ('Ca Mau'            ,	     'Ca Mau',	'CM',	'CM');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Cam Giang',	'HD',	'CG');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Cam Khe',	'PT',	'CK');
INSERT INTO @tbl VALUES ('Da Nang'            ,	     'Cam Le',	'DA',	'CL');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Cam Lo',	'QT',	'CL');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Cam My',	'DN',	'CM');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Cam Pha',	'QN',	'CP');
INSERT INTO @tbl VALUES ('Khanh Hoa'            ,	     'Cam Ranh',	'KH',	'CR');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Cam Thuy',	'TH',	'CT');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Cam Xuyen',	'HT',	'CX');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Can Duoc',	'LA',	'CD');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Can Gio',	'HC',	'CG');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Can Giuoc',	'LA',	'CG');
INSERT INTO @tbl VALUES ('Tra Vinh'            ,	     'Cang Long',	'TV',	'CL');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Can Loc',	'HT',	'CL');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Cao Bang',	'CB',	'CB');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Cao Lanh',	'DT',	'CL');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Cao Loc',	'LS',	'CA');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Cao Phong',	'HO',	'CP');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Cat Hai',	'HP',	'CH');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Cat Tien',	'LD',	'CT');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Cau Giay',	'HI',	'CG');
INSERT INTO @tbl VALUES ('Tra Vinh'            ,	     'Cau Ke',	'TV',	'CK');
INSERT INTO @tbl VALUES ('Tra Vinh'            ,	     'Cau Ngang',	'TV',	'CN');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Chau Doc',	'AG',	'CD');
INSERT INTO @tbl VALUES ('Ba Ria-Vung Tau'            ,	     'Chau Duc',	'BV',	'CC');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Chau Phu',	'AG',	'CP');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Chau Thanh',	'AG',	'CT');
INSERT INTO @tbl VALUES ('Ben Tre'            ,	     'Chau Thanh',	'BR',	'CT');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Chau Thanh',	'DT',	'CT');
INSERT INTO @tbl VALUES ('Hau Giang'            ,	     'Chau Thanh',	'HU',	'CT');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Chau Thanh',	'KG',	'CT');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Chau Thanh',	'LA',	'CT');
INSERT INTO @tbl VALUES ('Tien Giang'            ,	     'Chau Thanh',	'TG',	'CT');
INSERT INTO @tbl VALUES ('Tay Ninh'            ,	     'Chau Thanh',	'TN',	'CT');
INSERT INTO @tbl VALUES ('Tra Vinh'            ,	     'Chau Thanh',	'TV',	'CT');
INSERT INTO @tbl VALUES ('Hau Giang'            ,	     'Chau Thanh A',	'HU',	'CA');
INSERT INTO @tbl VALUES ('Tuyen Quang'            ,	     'Chiem Hoa',	'TQ',	'CH');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Chi Lang',	'LS',	'CH');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Chi Linh',	'HD',	'CL');
INSERT INTO @tbl VALUES ('Bac Can'            ,	     'Cho Don',	'BK',	'CD');
INSERT INTO @tbl VALUES ('Tien Giang'            ,	     'Cho Gao',	'TG',	'CG');
INSERT INTO @tbl VALUES ('Ben Tre'            ,	     'Cho Lach',	'BR',	'CL');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Cho Moi',	'AG',	'CM');
INSERT INTO @tbl VALUES ('Bac Can'            ,	     'Cho Moi',	'BK',	'CM');
INSERT INTO @tbl VALUES ('Binh Phuoc'            ,	     'Chon Thanh',	'BP',	'CT');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Chuong My',	'HI',	'CM');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Chu Pah',	'GL',	'CH');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Chu Prong',	'GL',	'CG');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Chu Se',	'GL',	'CS');
INSERT INTO @tbl VALUES ('Can Tho'            ,	     'Co Do',	'CN',	'CD');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Con Co',	'QT',	'CC');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Con Cuong',	'NA',	'CC');
INSERT INTO @tbl VALUES ('Ba Ria-Vung Tau'            ,	     'Con Dao',	'BV',	'CO');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Co To',	'QN',	'CT');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Cua Lo',	'NA',	'CL');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Cu Chi',	'HC',	'CC');
INSERT INTO @tbl VALUES ('Dac Nong'            ,	     'Cu Jut',	'DO',	'CJ');
INSERT INTO @tbl VALUES ('Soc Trang'            ,	     'Cu Lao Dung',	'ST',	'CL');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Cu M''Gar',	'DC',	'CM');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Da Huoai',	'LD',	'DH');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Dai Loc',	'QM',	'DL');
INSERT INTO @tbl VALUES ('Thai Nguyen'            ,	     'Dai Tu',	'TY',	'DT');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Dak Doa',	'GL',	'DD');
INSERT INTO @tbl VALUES ('Kon Tum'            ,	     'Dak Glei',	'KT',	'DG');
INSERT INTO @tbl VALUES ('Kon Tum'            ,	     'Dak Ha',	'KT',	'DH');
INSERT INTO @tbl VALUES ('Dac Nong'            ,	     'Dak Mil',	'DO',	'DM');
INSERT INTO @tbl VALUES ('Dac Nong'            ,	     'Dak Nong',	'DO',	'DN');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Dak Po',	'GL',	'DP');
INSERT INTO @tbl VALUES ('Dac Nong'            ,	     'Dak Rlap',	'DO',	'DR');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Dakrong',	'QT',	'DA');
INSERT INTO @tbl VALUES ('Dac Nong'            ,	     'Dak Song',	'DO',	'DS');
INSERT INTO @tbl VALUES ('Kon Tum'            ,	     'Dak To',	'KT',	'DT');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Da Lat',	'LD',	'DL');
INSERT INTO @tbl VALUES ('Ca Mau'            ,	     'Dam Doi',	'CM',	'DD');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Dam Ha',	'QN',	'DH');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Dam Rong',	'LD',	'DR');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Dan Phuong',	'HI',	'DP');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Da Rac',	'HO',	'DR');
INSERT INTO @tbl VALUES ('Ba Ria-Vung Tau'            ,	     'Dat Do',	'BV',	'DD');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Da Teh',	'LD',	'DT');
INSERT INTO @tbl VALUES ('Binh Duong'            ,	     'Dau Tieng',	'BI',	'DT');
INSERT INTO @tbl VALUES ('Binh Duong'            ,	     'Di An',	'BI',	'DA');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Dien Ban',	'QM',	'DB');
INSERT INTO @tbl VALUES ('Dien Bien'            ,	     'Dien Bien',	'DB',	'DB');
INSERT INTO @tbl VALUES ('Dien Bien'            ,	     'Dien Bien Dong',	'DB',	'DD');
INSERT INTO @tbl VALUES ('Dien Bien'            ,	     'Dien Bien Phu',	'DB',	'DP');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Dien Chau',	'NA',	'DC');
INSERT INTO @tbl VALUES ('Khanh Hoa'            ,	     'Dien Khanh',	'KH',	'DK');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Di Linh',	'LD',	'DI');
INSERT INTO @tbl VALUES ('Thai Nguyen'            ,	     'Dinh Hoa',	'TY',	'DO');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Dinh Lap',	'LS',	'DL');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Dinh Quan',	'DN',	'DQ');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Doan Hung',	'PT',	'DH');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Do Luong',	'NA',	'DL');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Don Duong',	'LD',	'DD');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Dong Anh',	'HI',	'DA');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Dong Da',	'HI',	'DD');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Dong Giang',	'QM',	'DG');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Dong Ha',	'QT',	'DH');
INSERT INTO @tbl VALUES ('Bac Lieu'            ,	     'Dong Hai',	'BL',	'DH');
INSERT INTO @tbl VALUES ('Quang Binh'            ,	     'Dong Hoi',	'QB',	'DH');
INSERT INTO @tbl VALUES ('Thai Binh'            ,	     'Dong Hung',	'TB',	'DH');
INSERT INTO @tbl VALUES ('Thai Nguyen'            ,	     'Dong Hy',	'TY',	'DY');
INSERT INTO @tbl VALUES ('Binh Phuoc'            ,	     'Dong Phu',	'BP',	'DP');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Dong Son',	'TH',	'DS');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Dong Trieu',	'QN',	'DT');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Dong Van',	'HG',	'DV');
INSERT INTO @tbl VALUES ('Binh Phuoc'            ,	     'Dong Xoai',	'BP',	'DX');
INSERT INTO @tbl VALUES ('Phu Yen'            ,	     'Dong Xuan',	'PY',	'DX');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Do Son',	'HP',	'DS');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Duc Co',	'GL',	'DC');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Duc Hoa',	'LA',	'DO');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Duc Hue',	'LA',	'DU');
INSERT INTO @tbl VALUES ('Binh Thuan'            ,	     'Duc Linh',	'BU',	'DL');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Duc Pho',	'QG',	'DP');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Duc Tho',	'HT',	'DT');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Duc Trong',	'LD',	'DC');
INSERT INTO @tbl VALUES ('Tay Ninh'            ,	     'Duong Minh Chau',	'TN',	'DM');
INSERT INTO @tbl VALUES ('Tra Vinh'            ,	     'Duyen Hai',	'TV',	'DH');
INSERT INTO @tbl VALUES ('Ha Nam'            ,	     'Duy Tien',	'HM',	'DT');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Duy Xuyen',	'QM',	'DX');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Ea H''Leo',	'DC',	'EH');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Ea Kar',	'DC',	'EK');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Ea Sup',	'DC',	'ES');
INSERT INTO @tbl VALUES ('Bac Ninh'            ,	     'Gia Binh',	'BN',	'GB');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Gia Lam',	'HI',	'GL');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Gia Loc',	'HD',	'GL');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'Giao Thuy',	'ND',	'GT');
INSERT INTO @tbl VALUES ('Bac Lieu'            ,	     'Gia Rai',	'BL',	'GR');
INSERT INTO @tbl VALUES ('Ninh Binh'            ,	     'Gia Vien',	'NB',	'GV');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Gio Linh',	'QT',	'GL');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Giong Rieng',	'KG',	'GR');
INSERT INTO @tbl VALUES ('Ben Tre'            ,	     'Giong Trom',	'BR',	'GT');
INSERT INTO @tbl VALUES ('Tien Giang'            ,	     'Go Cong',	'TG',	'GC');
INSERT INTO @tbl VALUES ('Tien Giang'            ,	     'Go Cong Dong',	'TG',	'GD');
INSERT INTO @tbl VALUES ('Tien Giang'            ,	     'Go Cong Tay',	'TG',	'GT');
INSERT INTO @tbl VALUES ('Tay Ninh'            ,	     'Go Dau',	'TN',	'GD');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Go Quao',	'KG',	'GQ');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Go Vap',	'HC',	'GV');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Ha Dong',	'HI',	'HG');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Ha Giang',	'HG',	'HG');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Ha Hoa',	'PT',	'HH');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Hai An',	'HP',	'HA');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Hai Ba Trung',	'HI',	'HB');
INSERT INTO @tbl VALUES ('Da Nang'            ,	     'Hai Chau',	'DA',	'HC');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Hai Duong',	'HD',	'HD');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Hai Ha',	'QN',	'HH');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'Hai Hau',	'ND',	'HH');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Hai Lang',	'QT',	'HL');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Ha Lang',	'CB',	'HL');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Ha Long',	'QN',	'HL');
INSERT INTO @tbl VALUES ('Binh Thuan'            ,	     'Ham Tan',	'BU',	'HT');
INSERT INTO @tbl VALUES ('Binh Thuan'            ,	     'Ham Thuan Bac',	'BU',	'HB');
INSERT INTO @tbl VALUES ('Binh Thuan'            ,	     'Ham Thuan Nam',	'BU',	'HN');
INSERT INTO @tbl VALUES ('Tuyen Quang'            ,	     'Ham Yen',	'TQ',	'HY');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Ha Quang',	'CB',	'HQ');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Ha Tien',	'KG',	'HT');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Ha Tinh',	'HT',	'HT');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Ha Trung',	'TH',	'HT');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Hau Loc',	'TH',	'HL');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Hiep Duc',	'QM',	'HD');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Hiep Hoa',	'BG',	'HH');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Hoa An',	'CB',	'HA');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Hoa Binh',	'HO',	'HB');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'Hoai An',	'BD',	'HA');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Hoai Duc',	'HI',	'HC');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'Hoai Nhon',	'BD',	'HN');
INSERT INTO @tbl VALUES ('Ninh Binh'            ,	     'Hoa Lu',	'NB',	'HL');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Hoang Hoa',	'TH',	'HH');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Hoang Mai',	'HI',	'HM');
INSERT INTO @tbl VALUES ('Da Nang'            ,	     'Hoang Sa',	'DA',	'HS');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Hoang Su Phi',	'HG',	'HS');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Hoanh Bo',	'QN',	'HB');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Hoan Kiem',	'HI',	'HK');
INSERT INTO @tbl VALUES ('Tay Ninh'            ,	     'Hoa Thanh',	'TN',	'HT');
INSERT INTO @tbl VALUES ('Da Nang'            ,	     'Hoa Vang',	'DA',	'HV');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Hoc Mon',	'HC',	'HM');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Hoi An',	'QM',	'HA');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Hon Dat',	'KG',	'HD');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Hong Bang',	'HP',	'HB');
INSERT INTO @tbl VALUES ('Bac Lieu'            ,	     'Hong Dan',	'BL',	'HD');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Hong Linh',	'HT',	'HL');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Hong Ngu',	'DT',	'HN');
INSERT INTO @tbl VALUES ('Thua Thien-Hue'            ,	     'Hue',	'TT',	'HE');
INSERT INTO @tbl VALUES ('Thai Binh'            ,	     'Hung Ha',	'TB',	'HH');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Hung Nguyen',	'NA',	'HN');
INSERT INTO @tbl VALUES ('Hung Yen'            ,	     'Hung Yen',	'HY',	'HY');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Huong Hoa',	'QT',	'HH');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Huong Khe',	'HT',	'HK');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Huong Son',	'HT',	'HS');
INSERT INTO @tbl VALUES ('Thua Thien-Hue'            ,	     'Huong Thuy',	'TT',	'HU');
INSERT INTO @tbl VALUES ('Thua Thien-Hue'            ,	     'Huong Tra',	'TT',	'HR');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Huu Lung',	'LS',	'HL');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Ia Grai',	'GL',	'IG');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Ia Pa',	'GL',	'IP');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Kbang',	'GL',	'KB');
INSERT INTO @tbl VALUES ('Soc Trang'            ,	     'Ke Sach',	'ST',	'KS');
INSERT INTO @tbl VALUES ('Khanh Hoa'            ,	     'Khanh Son',	'KH',	'KS');
INSERT INTO @tbl VALUES ('Khanh Hoa'            ,	     'Khanh Vinh',	'KH',	'KV');
INSERT INTO @tbl VALUES ('Hung Yen'            ,	     'Khoai Chau',	'HY',	'KC');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Kien An',	'HP',	'KA');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Kien Hai',	'KG',	'KH');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Kien Luong',	'KG',	'KL');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Kien Thuy',	'HP',	'KT');
INSERT INTO @tbl VALUES ('Thai Binh'            ,	     'Kien Xuong',	'TB',	'KX');
INSERT INTO @tbl VALUES ('Ha Nam'            ,	     'Kim Bang',	'HM',	'KB');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Kim Boi',	'HO',	'KB');
INSERT INTO @tbl VALUES ('Hung Yen'            ,	     'Kim Dong',	'HY',	'KD');
INSERT INTO @tbl VALUES ('Ninh Binh'            ,	     'Kim Son',	'NB',	'KS');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Kim Thanh',	'HD',	'KT');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Kinh Mon',	'HD',	'KM');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Kong Chro',	'GL',	'KC');
INSERT INTO @tbl VALUES ('Kon Tum'            ,	     'Kon Plong',	'KT',	'KP');
INSERT INTO @tbl VALUES ('Kon Tum'            ,	     'Kon Ray',	'KT',	'KR');
INSERT INTO @tbl VALUES ('Kon Tum'            ,	     'Kon Tum',	'KT',	'KT');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Krong Ana',	'DC',	'KA');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Krong Bong',	'DC',	'KB');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Krong Buk',	'DC',	'KK');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Krong Nang',	'DC',	'KN');
INSERT INTO @tbl VALUES ('Dac Nong'            ,	     'Krong No',	'DO',	'KN');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Krong Pa',	'GL',	'KP');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Krong Pak',	'DC',	'KP');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Ky Anh',	'HT',	'KA');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Ky Son',	'HO',	'KS');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Ky Son',	'NA',	'KS');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Lac Duong',	'LD',	'LD');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Lac Son',	'HO',	'LC');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Lac Thuy',	'HO',	'LT');
INSERT INTO @tbl VALUES ('Lai Chau'            ,	     'Lai Chau',	'LI',	'LC');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Lai Vung',	'DT',	'LV');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'Lak',	'DC',	'LA');
INSERT INTO @tbl VALUES ('Lam Dong'            ,	     'Lam Ha',	'LD',	'LH');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Lam Thao',	'PT',	'LT');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Lang Chanh',	'TH',	'LC');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Lang Giang',	'BG',	'LG');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Lang Son',	'LS',	'LS');
INSERT INTO @tbl VALUES ('Lao Cai'            ,	     'Lao Cai',	'LO',	'LC');
INSERT INTO @tbl VALUES ('Vinh Phuc'            ,	     'Lap Thach',	'VC',	'LT');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Lap Vo',	'DT',	'LP');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Le Chan',	'HP',	'LC');
INSERT INTO @tbl VALUES ('Quang Binh'            ,	     'Le Thuy',	'QB',	'LT');
INSERT INTO @tbl VALUES ('Da Nang'            ,	     'Lien Chieu',	'DA',	'LC');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Loc Binh',	'LS',	'LB');
INSERT INTO @tbl VALUES ('Binh Phuoc'            ,	     'Loc Ninh',	'BP',	'LN');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Long Bien',	'HI',	'LB');
INSERT INTO @tbl VALUES ('Ba Ria-Vung Tau'            ,	     'Long Dien',	'BV',	'LD');
INSERT INTO @tbl VALUES ('Vinh Long'            ,	     'Long Ho',	'VL',	'LH');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Long Khanh',	'DN',	'LK');
INSERT INTO @tbl VALUES ('Hau Giang'            ,	     'Long My',	'HU',	'LM');
INSERT INTO @tbl VALUES ('Soc Trang'            ,	     'Long My',	'ST',	'LM');
INSERT INTO @tbl VALUES ('Soc Trang'            ,	     'Long Phu',	'ST',	'LP');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Long Thanh',	'DN',	'LT');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Long Xuyen',	'AG',	'LX');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Luc Nam',	'BG',	'LM');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Luc Ngan',	'BG',	'LN');
INSERT INTO @tbl VALUES ('Yen Bai'            ,	     'Luc Yen',	'YB',	'LY');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Luong Son',	'HO',	'LG');
INSERT INTO @tbl VALUES ('Bac Ninh'            ,	     'Luong Tai',	'BN',	'LT');
INSERT INTO @tbl VALUES ('Ha Nam'            ,	     'Ly Nhan',	'HM',	'LN');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Ly Son',	'QG',	'LS');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Mai Chau',	'HO',	'MC');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Mai Son',	'SL',	'MS');
INSERT INTO @tbl VALUES ('Vinh Long'            ,	     'Mang Thit',	'VL',	'MT');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Mang Yang',	'GL',	'MY');
INSERT INTO @tbl VALUES ('Dac Lac'            ,	     'M''Drak',	'DC',	'MD');
INSERT INTO @tbl VALUES ('Vinh Phuc'            ,	     'Me Linh',	'VC',	'ML');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Meo Vac',	'HG',	'MV');
INSERT INTO @tbl VALUES ('Quang Binh'            ,	     'Minh Hoa',	'QB',	'MH');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Minh Long',	'QG',	'ML');
INSERT INTO @tbl VALUES ('Ben Tre'            ,	     'Mo Cay',	'BR',	'MC');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Moc Chau',	'SL',	'MC');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Moc Hoa',	'LA',	'MH');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Mo Duc',	'QG',	'MD');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Mong Cai',	'QN',	'MC');
INSERT INTO @tbl VALUES ('Yen Bai'            ,	     'Mu Cang Trai',	'YB',	'MC');
INSERT INTO @tbl VALUES ('Dien Bien'            ,	     'Muong Cha',	'DB',	'MC');
INSERT INTO @tbl VALUES ('Lao Cai'            ,	     'Muong Khuong',	'LO',	'MK');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Muong La',	'SL',	'ML');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Muong Lat',	'TH',	'ML');
INSERT INTO @tbl VALUES ('Dien Bien'            ,	     'Muong Lay',	'DB',	'ML');
INSERT INTO @tbl VALUES ('Dien Bien'            ,	     'Muong Nhe',	'DB',	'MN');
INSERT INTO @tbl VALUES ('Lai Chau'            ,	     'Muong Te',	'LI',	'MT');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'My Duc',	'HI',	'MD');
INSERT INTO @tbl VALUES ('Hung Yen'            ,	     'My Hao',	'HY',	'MH');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'My Loc',	'ND',	'ML');
INSERT INTO @tbl VALUES ('Tien Giang'            ,	     'My Tho',	'TG',	'MT');
INSERT INTO @tbl VALUES ('Soc Trang'            ,	     'My Tu',	'ST',	'MT');
INSERT INTO @tbl VALUES ('Soc Trang'            ,	     'My Xuyen',	'ST',	'MX');
INSERT INTO @tbl VALUES ('Tuyen Quang'            ,	     'Na Hang',	'TQ',	'NH');
INSERT INTO @tbl VALUES ('Ca Mau'            ,	     'Nam Can',	'CM',	'NC');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Nam Dan',	'NA',	'ND');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'Nam Dinh',	'ND',	'ND');
INSERT INTO @tbl VALUES ('Thua Thien-Hue'            ,	     'Nam Dong',	'TT',	'ND');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Nam Giang',	'QM',	'NG');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Nam Sach',	'HD',	'NS');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Nam Tra My',	'QM',	'NM');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'Nam Truc',	'ND',	'NT');
INSERT INTO @tbl VALUES ('Bac Can'            ,	     'Na Ri',	'BK',	'NR');
INSERT INTO @tbl VALUES ('Soc Trang'            ,	     'Nga Nam',	'ST',	'NN');
INSERT INTO @tbl VALUES ('Bac Can'            ,	     'Ngan Son',	'BK',	'NS');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Nga Son',	'TH',	'NS');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Nghia Dan',	'NA',	'NG');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Nghia Hanh',	'QG',	'NH');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'Nghia Hung',	'ND',	'NH');
INSERT INTO @tbl VALUES ('Yen Bai'            ,	     'Nghia Lo',	'YB',	'NL');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Nghi Loc',	'NA',	'NL');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Nghi Xuan',	'HT',	'NX');
INSERT INTO @tbl VALUES ('Ca Mau'            ,	     'Ngoc Hien',	'CM',	'NH');
INSERT INTO @tbl VALUES ('Kon Tum'            ,	     'Ngoc Hoi',	'KT',	'NH');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Ngoc Lac',	'TH',	'NL');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Ngo Quyen',	'HP',	'NQ');
INSERT INTO @tbl VALUES ('Da Nang'            ,	     'Ngu Hanh Son',	'DA',	'NH');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Nguyen Binh',	'CB',	'NB');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Nha Be',	'HC',	'NB');
INSERT INTO @tbl VALUES ('Khanh Hoa'            ,	     'Nha Trang',	'KH',	'NT');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Nhon Trach',	'DN',	'NT');
INSERT INTO @tbl VALUES ('Ninh Binh'            ,	     'Nho Quan',	'NB',	'NQ');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Nhu Thanh',	'TH',	'NT');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Nhu Xuan',	'TH',	'NX');
INSERT INTO @tbl VALUES ('Ninh Binh'            ,	     'Ninh Binh',	'NB',	'NB');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Ninh Giang',	'HD',	'NG');
INSERT INTO @tbl VALUES ('Ninh Thuan'            ,	     'Ninh Hai',	'NT',	'NH');
INSERT INTO @tbl VALUES ('Khanh Hoa'            ,	     'Ninh Hoa',	'KH',	'NH');
INSERT INTO @tbl VALUES ('Can Tho'            ,	     'Ninh Kieu',	'CN',	'NK');
INSERT INTO @tbl VALUES ('Ninh Thuan'            ,	     'Ninh Phuoc',	'NT',	'NP');
INSERT INTO @tbl VALUES ('Ninh Thuan'            ,	     'Ninh Son',	'NT',	'NS');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Nong Cong',	'TH',	'NC');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Nui Thanh',	'QM',	'NT');
INSERT INTO @tbl VALUES ('Can Tho'            ,	     'O Mon',	'CN',	'OM');
INSERT INTO @tbl VALUES ('Bac Can'            ,	     'Pac Nam',	'BK',	'PN');
INSERT INTO @tbl VALUES ('Ninh Thuan'            ,	     'Phan Rang-Thap Cham',	'NT',	'PR');
INSERT INTO @tbl VALUES ('Binh Thuan'            ,	     'Phan Thiet',	'BU',	'PT');
INSERT INTO @tbl VALUES ('Can Tho'            ,	     'Phong Dien',	'CN',	'PD');
INSERT INTO @tbl VALUES ('Thua Thien-Hue'            ,	     'Phong Dien',	'TT',	'PD');
INSERT INTO @tbl VALUES ('Lai Chau'            ,	     'Phong Tho',	'LI',	'PT');
INSERT INTO @tbl VALUES ('Thai Nguyen'            ,	     'Pho Yen',	'TY',	'PY');
INSERT INTO @tbl VALUES ('Thai Nguyen'            ,	     'Phu Binh',	'TY',	'PB');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'Phu Cat',	'BD',	'PC');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Phuc Hoa',	'CB',	'PH');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Phuc Tho',	'HI',	'PT');
INSERT INTO @tbl VALUES ('Hung Yen'            ,	     'Phu Cu',	'HY',	'PC');
INSERT INTO @tbl VALUES ('Vinh Phuc'            ,	     'Phuc Yen',	'VC',	'PY');
INSERT INTO @tbl VALUES ('Binh Duong'            ,	     'Phu Giao',	'BI',	'PG');
INSERT INTO @tbl VALUES ('Phu Yen'            ,	     'Phu Hoa',	'PY',	'PH');
INSERT INTO @tbl VALUES ('Thua Thien-Hue'            ,	     'Phu Loc',	'TT',	'PL');
INSERT INTO @tbl VALUES ('Thai Nguyen'            ,	     'Phu Luong',	'TY',	'PL');
INSERT INTO @tbl VALUES ('Ha Nam'            ,	     'Phu Ly',	'HM',	'PL');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'Phu My',	'BD',	'PM');
INSERT INTO @tbl VALUES ('Hau Giang'            ,	     'Phung Hiep',	'HU',	'PH');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Phu Nhuan',	'HC',	'PN');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Phu Ninh',	'PT',	'PN');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Phu Ninh',	'QM',	'PN');
INSERT INTO @tbl VALUES ('Bac Lieu'            ,	     'Phuoc Long',	'BL',	'PL');
INSERT INTO @tbl VALUES ('Binh Phuoc'            ,	     'Phuoc Long',	'BP',	'PL');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Phuoc Son',	'QM',	'PS');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Phu Quoc',	'KG',	'PQ');
INSERT INTO @tbl VALUES ('Binh Thuan'            ,	     'Phu Quy',	'BU',	'PQ');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Phu Tan',	'AG',	'PT');
INSERT INTO @tbl VALUES ('Ca Mau'            ,	     'Phu Tan',	'CM',	'PT');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Phu Tho',	'PT',	'PT');
INSERT INTO @tbl VALUES ('Thua Thien-Hue'            ,	     'Phu Vang',	'TT',	'PV');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Phu Xuyen',	'HI',	'PX');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Phu Yen',	'SL',	'PY');
INSERT INTO @tbl VALUES ('Gia Lai'            ,	     'Pleiku',	'GL',	'PL');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 1',	'HC',	'QA');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 2',	'HC',	'QB');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 3',	'HC',	'QC');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 4',	'HC',	'QD');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 5',	'HC',	'QE');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 6',	'HC',	'QF');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 7',	'HC',	'QG');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 8',	'HC',	'QH');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 9',	'HC',	'QI');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 10',	'HC',	'QJ');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 11',	'HC',	'QK');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Quan 12',	'HC',	'QL');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Quan Ba',	'HG',	'QB');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Quang Binh',	'HG',	'QG');
INSERT INTO @tbl VALUES ('Thua Thien-Hue'            ,	     'Quang Dien',	'TT',	'QD');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Quang Ngai',	'QG',	'QN');
INSERT INTO @tbl VALUES ('Quang Binh'            ,	     'Quang Ninh',	'QB',	'QN');
INSERT INTO @tbl VALUES ('Quang Binh'            ,	     'Quang Trach',	'QB',	'QT');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Quang Tri',	'QT',	'QT');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Quang Xuong',	'TH',	'QX');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Quang Yen',	'CB',	'QY');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Quan Hoa',	'TH',	'QH');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Quan Son',	'TH',	'QS');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Que Phong',	'NA',	'QP');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Que Son',	'QM',	'QS');
INSERT INTO @tbl VALUES ('Bac Ninh'            ,	     'Que Vo',	'BN',	'QV');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Quoc Oai',	'HI',	'QO');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Quy Chau',	'NA',	'QC');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Quy Hop',	'NA',	'QH');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Quynh Luu',	'NA',	'QL');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Quynh Nhai',	'SL',	'QN');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'Quy Nhon',	'BD',	'QN');
INSERT INTO @tbl VALUES ('Thai Binh'            ,	     'Quynh Phu',	'TB',	'QP');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Rach Gia',	'KG',	'RG');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Sa Dec',	'DT',	'SD');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Sam Son',	'TH',	'SS');
INSERT INTO @tbl VALUES ('Lao Cai'            ,	     'Sa Pa',	'LO',	'SP');
INSERT INTO @tbl VALUES ('Kon Tum'            ,	     'Sa Thay',	'KT',	'ST');
INSERT INTO @tbl VALUES ('Lao Cai'            ,	     'Si Ma Cai',	'LO',	'SM');
INSERT INTO @tbl VALUES ('Lai Chau'            ,	     'Sin Ho',	'LI',	'SH');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Soc Son',	'HI',	'SS');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Son Dong',	'BG',	'SD');
INSERT INTO @tbl VALUES ('Tuyen Quang'            ,	     'Son Duong',	'TQ',	'SD');
INSERT INTO @tbl VALUES ('Phu Yen'            ,	     'Song Cau',	'PY',	'SC');
INSERT INTO @tbl VALUES ('Thai Nguyen'            ,	     'Song Cong',	'TY',	'SC');
INSERT INTO @tbl VALUES ('Phu Yen'            ,	     'Song Hinh',	'PY',	'SH');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Song Ma',	'SL',	'SM');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Son Ha',	'QG',	'SH');
INSERT INTO @tbl VALUES ('Phu Yen'            ,	     'Son Hoa',	'PY',	'SO');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Son La',	'SL',	'SL');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Son Tay',	'QG',	'SY');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Son Tay',	'HI',	'ST');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Son Tinh',	'QG',	'SN');
INSERT INTO @tbl VALUES ('Da Nang'            ,	     'Son Tra',	'DA',	'ST');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Sop Cop',	'SL',	'SC');
INSERT INTO @tbl VALUES ('Vinh Long'            ,	     'Tam Binh',	'VL',	'TB');
INSERT INTO @tbl VALUES ('Vinh Phuc'            ,	     'Tam Dao',	'VC',	'TA');
INSERT INTO @tbl VALUES ('Ninh Binh'            ,	     'Tam Diep',	'NB',	'TD');
INSERT INTO @tbl VALUES ('Lai Chau'            ,	     'Tam Duong',	'LI',	'TD');
INSERT INTO @tbl VALUES ('Vinh Phuc'            ,	     'Tam Duong',	'VC',	'TU');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Tam Ki',	'QM',	'TK');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Tam Nong',	'DT',	'TN');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Tam Nong',	'PT',	'TN');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Tan An',	'LA',	'TA');
INSERT INTO @tbl VALUES ('Tay Ninh'            ,	     'Tan Bien',	'TN',	'TB');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Tan Binh',	'HC',	'TB');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Tan Chau',	'AG',	'TC');
INSERT INTO @tbl VALUES ('Tay Ninh'            ,	     'Tan Chau',	'TN',	'TC');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Tan Hiep',	'KG',	'TH');
INSERT INTO @tbl VALUES ('Binh Thuan'            ,	     'Tanh Linh',	'BU',	'TL');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Tan Hong',	'DT',	'TH');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Tan Hung',	'LA',	'TG');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Tan Ky',	'NA',	'TK');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Tan Lac',	'HO',	'TL');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Tan Phu',	'DN',	'TP');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Tan Phu',	'HC',	'TP');
INSERT INTO @tbl VALUES ('Tien Giang'            ,	     'Tan Phuoc',	'TG',	'TP');
INSERT INTO @tbl VALUES ('Ba Ria-Vung Tau'            ,	     'Tan Thanh',	'BV',	'TT');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Tan Thanh',	'LA',	'TT');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Tan Tru',	'LA',	'TR');
INSERT INTO @tbl VALUES ('Binh Duong'            ,	     'Tan Uyen',	'BI',	'TU');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Tan Yen',	'BG',	'TY');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Tay Giang',	'QM',	'TG');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Tay Ho',	'HI',	'TH');
INSERT INTO @tbl VALUES ('Tay Ninh'            ,	     'Tay Ninh',	'TN',	'TN');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'Tay Son',	'BD',	'TS');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Tay Tra',	'QG',	'TT');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Thach An',	'CB',	'TA');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Thach Ha',	'HT',	'TH');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Thach Thanh',	'TH',	'TT');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Thach That',	'HI',	'TC');
INSERT INTO @tbl VALUES ('Thai Binh'            ,	     'Thai Binh',	'TB',	'TB');
INSERT INTO @tbl VALUES ('Thai Nguyen'            ,	     'Thai Nguyen',	'TY',	'TN');
INSERT INTO @tbl VALUES ('Thai Binh'            ,	     'Thai Thuy',	'TB',	'TT');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Thang Binh',	'QM',	'TB');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Thanh Ba',	'PT',	'TB');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Thanh Binh',	'DT',	'TB');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Thanh Chuong',	'NA',	'TC');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Thanh Ha',	'HD',	'TH');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Thanh Hoa',	'LA',	'TH');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Thanh Hoa',	'TH',	'TH');
INSERT INTO @tbl VALUES ('Da Nang'            ,	     'Thanh Khe',	'DA',	'TK');
INSERT INTO @tbl VALUES ('Ha Nam'            ,	     'Thanh Liem',	'HM',	'TL');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Thanh Mien',	'HD',	'TM');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Thanh Oai',	'HI',	'TO');
INSERT INTO @tbl VALUES ('Ben Tre'            ,	     'Thanh Phu',	'BR',	'TP');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Thanh Son',	'PT',	'TS');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Thanh Thuy',	'PT',	'TT');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Thanh Tri',	'HI',	'TT');
INSERT INTO @tbl VALUES ('Soc Trang'            ,	     'Thanh Tri',	'ST',	'TT');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Thanh Xuan',	'HI',	'TX');
INSERT INTO @tbl VALUES ('Lai Chau'            ,	     'Than Uyen',	'LI',	'TU');
INSERT INTO @tbl VALUES ('Dong Thap'            ,	     'Thap Muoi',	'DT',	'TM');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Thieu Hoa',	'TH',	'TU');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Thoai Son',	'AG',	'TS');
INSERT INTO @tbl VALUES ('Ca Mau'            ,	     'Thoi Binh',	'CM',	'TB');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Thong Nhat',	'DN',	'TN');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Thong Nong',	'CB',	'TN');
INSERT INTO @tbl VALUES ('Can Tho'            ,	     'Thot Not',	'CN',	'TN');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Tho Xuan',	'TH',	'TX');
INSERT INTO @tbl VALUES ('Binh Duong'            ,	     'Thuan An',	'BI',	'TA');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Thuan Chau',	'SL',	'TC');
INSERT INTO @tbl VALUES ('Bac Ninh'            ,	     'Thuan Thanh',	'BN',	'TT');
INSERT INTO @tbl VALUES ('Binh Duong'            ,	     'Thu Dau Mot',	'BI',	'TD');
INSERT INTO @tbl VALUES ('Ho Chi Minh'            ,	     'Thu Duc',	'HC',	'TD');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Thuong Tin',	'HI',	'TN');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Thuong Xuan',	'TH',	'TN');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Thu Thua',	'LA',	'TU');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Thuy Nguyen',	'HP',	'TN');
INSERT INTO @tbl VALUES ('Bac Ninh'            ,	     'Tien Du',	'BN',	'TD');
INSERT INTO @tbl VALUES ('Thai Binh'            ,	     'Tien Hai',	'TB',	'TH');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Tien Lang',	'HP',	'TL');
INSERT INTO @tbl VALUES ('Hung Yen'            ,	     'Tien Lu',	'HY',	'TL');
INSERT INTO @tbl VALUES ('Quang Nam'            ,	     'Tien Phuoc',	'QM',	'TP');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Tien Yen',	'QN',	'TY');
INSERT INTO @tbl VALUES ('Tra Vinh'            ,	     'Tieu Can',	'TV',	'TI');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Tinh Bien',	'AG',	'TB');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Tinh Gia',	'TH',	'TG');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Tra Bong',	'QG',	'TB');
INSERT INTO @tbl VALUES ('Tra Vinh'            ,	     'Tra Cu',	'TV',	'TU');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Tra Linh',	'CB',	'TL');
INSERT INTO @tbl VALUES ('Yen Bai'            ,	     'Tram Tau',	'YB',	'TT');
INSERT INTO @tbl VALUES ('Tay Ninh'            ,	     'Trang Bang',	'TN',	'TR');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Trang Bom',	'DN',	'TB');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Trang Dinh',	'LS',	'TD');
INSERT INTO @tbl VALUES ('Ca Mau'            ,	     'Tran Van Thoi',	'CM',	'TV');
INSERT INTO @tbl VALUES ('Yen Bai'            ,	     'Tran Yen',	'YB',	'TY');
INSERT INTO @tbl VALUES ('Vinh Long'            ,	     'Tra On',	'VL',	'TO');
INSERT INTO @tbl VALUES ('Tra Vinh'            ,	     'Tra Vinh',	'TV',	'TV');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Trieu Phong',	'QT',	'TP');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Trieu Son',	'TH',	'TS');
INSERT INTO @tbl VALUES ('An Giang'            ,	     'Tri Ton',	'AG',	'TT');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'Truc Ninh',	'ND',	'TN');
INSERT INTO @tbl VALUES ('Cao Bang'            ,	     'Trung Khanh',	'CB',	'TK');
INSERT INTO @tbl VALUES ('Khanh Hoa'            ,	     'Truong Sa',	'KH',	'TS');
INSERT INTO @tbl VALUES ('Dien Bien'            ,	     'Tua Chua',	'DB',	'TC');
INSERT INTO @tbl VALUES ('Dien Bien'            ,	     'Tuan Giao',	'DB',	'TG');
INSERT INTO @tbl VALUES ('Hai Duong'            ,	     'Tu Ky',	'HD',	'TK');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Tu Liem',	'HI',	'TL');
INSERT INTO @tbl VALUES ('Quang Ngai'            ,	     'Tu Nghia',	'QG',	'TN');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Tuong Duong',	'NA',	'TD');
INSERT INTO @tbl VALUES ('Bac Ninh'            ,	     'Tu Son',	'BN',	'TS');
INSERT INTO @tbl VALUES ('Phu Yen'            ,	     'Tuy An',	'PY',	'TA');
INSERT INTO @tbl VALUES ('Quang Binh'            ,	     'Tuyen Hoa',	'QB',	'TH');
INSERT INTO @tbl VALUES ('Tuyen Quang'            ,	     'Tuyen Quang',	'TQ',	'TQ');
INSERT INTO @tbl VALUES ('Phu Yen'            ,	     'Tuy Hoa',	'PY',	'TH');
INSERT INTO @tbl VALUES ('Binh Thuan'            ,	     'Tuy Phong',	'BU',	'TP');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'Tuy Phuoc',	'BD',	'TP');
INSERT INTO @tbl VALUES ('Ca Mau'            ,	     'U Minh',	'CM',	'UM');
INSERT INTO @tbl VALUES ('Hanoi'            ,	     'Ung Hoa',	'HI',	'UH');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Uong Bi',	'QN',	'UB');
INSERT INTO @tbl VALUES ('Lao Cai'            ,	     'Van Ban',	'LO',	'VB');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'Van Canh',	'BD',	'VC');
INSERT INTO @tbl VALUES ('Yen Bai'            ,	     'Van Chan',	'YB',	'VC');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Van Don',	'QN',	'VD');
INSERT INTO @tbl VALUES ('Hung Yen'            ,	     'Van Giang',	'HY',	'VG');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Van Lang',	'LS',	'VL');
INSERT INTO @tbl VALUES ('Khanh Hoa'            ,	     'Van Ninh',	'KH',	'VN');
INSERT INTO @tbl VALUES ('Lang Son'            ,	     'Van Quan',	'LS',	'VQ');
INSERT INTO @tbl VALUES ('Yen Bai'            ,	     'Van Yen',	'YB',	'VY');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Viet Tri',	'PT',	'VT');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Viet Yen',	'BG',	'VY');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Vinh',	'NA',	'VI');
INSERT INTO @tbl VALUES ('Haiphong'            ,	     'Vinh Bao',	'HP',	'VB');
INSERT INTO @tbl VALUES ('Soc Trang'            ,	     'Vinh Chau',	'ST',	'VC');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Vinh Cuu',	'DN',	'VC');
INSERT INTO @tbl VALUES ('Long An'            ,	     'Vinh Hung',	'LA',	'VH');
INSERT INTO @tbl VALUES ('Quang Tri'            ,	     'Vinh Linh',	'QT',	'VL');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Vinh Loc',	'TH',	'VL');
INSERT INTO @tbl VALUES ('Bac Lieu'            ,	     'Vinh Loi',	'BL',	'VL');
INSERT INTO @tbl VALUES ('Vinh Long'            ,	     'Vinh Long',	'VL',	'VL');
INSERT INTO @tbl VALUES ('Binh Dinh'            ,	     'Vinh Thanh',	'BD',	'VT');
INSERT INTO @tbl VALUES ('Can Tho'            ,	     'Vinh Thanh',	'CN',	'VT');
INSERT INTO @tbl VALUES ('Kien Giang'            ,	     'Vinh Thuan',	'KG',	'VT');
INSERT INTO @tbl VALUES ('Vinh Phuc'            ,	     'Vinh Tuong',	'VC',	'VT');
INSERT INTO @tbl VALUES ('Vinh Phuc'            ,	     'Vinh Yen',	'VC',	'VY');
INSERT INTO @tbl VALUES ('Hau Giang'            ,	     'Vi Thanh',	'HU',	'VH');
INSERT INTO @tbl VALUES ('Hau Giang'            ,	     'Vi Thuy',	'HU',	'VY');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Vi Xuyen',	'HG',	'VX');
INSERT INTO @tbl VALUES ('Thai Nguyen'            ,	     'Vo Nhai',	'TY',	'VN');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'Vu Ban',	'ND',	'VB');
INSERT INTO @tbl VALUES ('Vinh Long'            ,	     'Vung Liem',	'VL',	'VU');
INSERT INTO @tbl VALUES ('Ba Ria-Vung Tau'            ,	     'Vung Tau',	'BV',	'VT');
INSERT INTO @tbl VALUES ('Ha Tinh'            ,	     'Vu Quang',	'HT',	'VQ');
INSERT INTO @tbl VALUES ('Thai Binh'            ,	     'Vu Thu',	'TB',	'VT');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Xin Man',	'HG',	'XM');
INSERT INTO @tbl VALUES ('Dong Nai'            ,	     'Xuan Loc',	'DN',	'XL');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'Xuan Truong',	'ND',	'XT');
INSERT INTO @tbl VALUES ('Ba Ria-Vung Tau'            ,	     'Xuyen Moc',	'BV',	'XM');
INSERT INTO @tbl VALUES ('Yen Bai'            ,	     'Yen Bai',	'YB',	'YB');
INSERT INTO @tbl VALUES ('Son La'            ,	     'Yen Chau',	'SL',	'YC');
INSERT INTO @tbl VALUES ('Thanh Hoa'            ,	     'Yen Dinh',	'TH',	'YD');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Yen Dung',	'BG',	'YD');
INSERT INTO @tbl VALUES ('Quang Ninh'            ,	     'Yen Hung',	'QN',	'YH');
INSERT INTO @tbl VALUES ('Ninh Binh'            ,	     'Yen Khanh',	'NB',	'YK');
INSERT INTO @tbl VALUES ('Vinh Phuc'            ,	     'Yen Lac',	'VC',	'YL');
INSERT INTO @tbl VALUES ('Phu Tho'            ,	     'Yen Lap',	'PT',	'YL');
INSERT INTO @tbl VALUES ('Ha Giang'            ,	     'Yen Minh',	'HG',	'YM');
INSERT INTO @tbl VALUES ('Ninh Binh'            ,	     'Yen Mo',	'NB',	'YM');
INSERT INTO @tbl VALUES ('Hung Yen'            ,	     'Yen My',	'HY',	'YM');
INSERT INTO @tbl VALUES ('Bac Ninh'            ,	     'Yen Phong',	'BN',	'YP');
INSERT INTO @tbl VALUES ('Tuyen Quang'            ,	     'Yen Son',	'TQ',	'YS');
INSERT INTO @tbl VALUES ('Nghe An'            ,	     'Yen Thanh',	'NA',	'YT');
INSERT INTO @tbl VALUES ('Bac Giang'            ,	     'Yen The',	'BG',	'YT');
INSERT INTO @tbl VALUES ('Hoa Binh'            ,	     'Yen Thuy',	'HO',	'YT');
INSERT INTO @tbl VALUES ('Nam Dinh'            ,	     'Y Yen',	'ND',	'YY');

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

