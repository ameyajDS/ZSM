
/* ==================================================================================
    	Source File		:	setup_china_components.sql
	Author(s)		:	Jitendra Loyal
	Started On		:	10-10-2014
	Module ID		:	CDB
	Last updated		:	10-10-2014
	==================================================================================
		Usage Notes
	----------------------------------------------------------------------------------
		Level 1 Address Components of China are set-up
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
WHERE	country_nm	=	'China';

IF (@@ROWCOUNT = 0)
BEGIN
	RAISERROR ('Country China not found', 16, 1);
	RETURN;
END

UPDATE	countries
	SET	level_1_address_component	=	'Province',
		level_2_address_component	=	'Prefecture',
		level_3_address_component	=	NULL
WHERE	country_id	=	@country_id;

-- ======================================================================

SET NOCOUNT ON
DECLARE	@tbl	TABLE	(	level_1_nm	VARCHAR (50), level_2_nm varchar (50), level_1_cd varchar (5), level_2_cd varchar (5), PRIMARY KEY (level_1_nm, level_2_nm), UNIQUE (level_1_cd, level_2_cd), UNIQUE (level_1_nm, level_2_cd));

INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Aba Zangzu Qiangzu',	'SC',	'AB');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Akesu',	'XJ',	'AK');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Alashan',	'NM',	'AL');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Aletai',	'XJ',	'AL');
INSERT INTO @tbl VALUES ('Xizang'            ,	     'Ali',	'XZ',	'AL');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Ankang',	'SA',	'AK');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Anqing',	'AH',	'AQ');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Anshan',	'LN',	'AS');
INSERT INTO @tbl VALUES ('Guizhou'            ,	     'Anshun',	'GZ',	'AS');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Anyang',	'HE',	'AY');
INSERT INTO @tbl VALUES ('Jilin'            ,	     'Baicheng',	'JL',	'BC');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Baise',	'GX',	'BS');
INSERT INTO @tbl VALUES ('Jilin'            ,	     'Baishan',	'JL',	'BS');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Baiyin',	'GS',	'BY');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Bangbu',	'AH',	'BB');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Baoding',	'HB',	'BD');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Baoji',	'SA',	'BJ');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Baoshan',	'YN',	'BS');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Baotou',	'NM',	'BT');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Bayannaoer',	'NM',	'BY');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Bayinguoleng Menggu',	'XJ',	'BY');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Bazhong',	'SC',	'BZ');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Beihai',	'GX',	'BH');
INSERT INTO @tbl VALUES ('Beijing'            ,	     'Beijing Shi',	'BJ',	'BJ');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Benxi',	'LN',	'BX');
INSERT INTO @tbl VALUES ('Guizhou'            ,	     'Bijie',	'GZ',	'BJ');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Binshou',	'SD',	'BS');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Boertala Menggu',	'XJ',	'BT');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Bozhou',	'AH',	'BZ');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Cangzhou',	'HB',	'CZ');
INSERT INTO @tbl VALUES ('Jilin'            ,	     'Changchun',	'JL',	'CC');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Changde',	'HN',	'CD');
INSERT INTO @tbl VALUES ('Xizang'            ,	     'Changdu',	'XZ',	'CD');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Changji Huizu',	'XJ',	'CJ');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Changsha',	'HN',	'CS');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Changzhi',	'SX',	'CZ');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Changzhou',	'JS',	'CZ');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Chaohu',	'AH',	'CH');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Chaoyang',	'LN',	'CY');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Chaozhou',	'GD',	'CZ');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Chengde',	'HB',	'CD');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Chengdu',	'SC',	'CD');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Chenzhou',	'HN',	'CZ');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Chifeng',	'NM',	'CF');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Chizhou',	'AH',	'CI');
INSERT INTO @tbl VALUES ('Chongqing'            ,	     'Chongqing Shi',	'CQ',	'CQ');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Chuxiong Yizu',	'YN',	'CX');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Chuzhou',	'AH',	'CU');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Dali Baizu',	'YN',	'DL');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Dalian',	'LN',	'DL');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Dandong',	'LN',	'DD');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Daqing',	'HL',	'DQ');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Datong',	'SX',	'DT');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Daxing''anling',	'HL',	'DX');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Dazhou',	'SC',	'DZ');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Dehong Daizu Jingpozu',	'YN',	'DH');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Deyang',	'SC',	'DY');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Dezhou',	'SD',	'DZ');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Dingxi',	'GS',	'DX');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Diqing Zangzu',	'YN',	'DQ');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Dongguan',	'GD',	'DG');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Dongying',	'SD',	'DY');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'E''xi Tujiazu Miaozu',	'HU',	'EX');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'E''zhou',	'HU',	'EZ');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Erdos',	'NM',	'ED');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Fangchenggang',	'GX',	'FC');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Foshan',	'GD',	'FS');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Fushun',	'LN',	'FS');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Fuxin',	'LN',	'FX');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Fuyang',	'AH',	'FY');
INSERT INTO @tbl VALUES ('Fujian'            ,	     'Fuzhou',	'FJ',	'FZ');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Fuzhou',	'JX',	'FZ');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Gannan Zangzu',	'GS',	'GN');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Ganzhou',	'JX',	'GZ');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Ganzi Zangzu',	'SC',	'GZ');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Guang''an',	'SC',	'GA');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Guangyuan',	'SC',	'GY');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Guangzhou',	'GD',	'GZ');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Guigang',	'GX',	'GG');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Guilin',	'GX',	'GL');
INSERT INTO @tbl VALUES ('Guizhou'            ,	     'Guiyang',	'GZ',	'GY');
INSERT INTO @tbl VALUES ('Qinghai'            ,	     'Guoluo Zangzu',	'QH',	'GL');
INSERT INTO @tbl VALUES ('Ningxia Hui'            ,	     'Guyuan',	'NX',	'GY');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Ha''erbin',	'HL',	'HB');
INSERT INTO @tbl VALUES ('Qinghai'            ,	     'Haibei Zangzu',	'QH',	'HB');
INSERT INTO @tbl VALUES ('Qinghai'            ,	     'Haidong',	'QH',	'HD');
INSERT INTO @tbl VALUES ('Hainan'            ,	     'Haikou',	'HA',	'HK');
INSERT INTO @tbl VALUES ('Hainan'            ,	     'Hainan',	'HA',	'HN');
INSERT INTO @tbl VALUES ('Qinghai'            ,	     'Hainan Zangzu',	'QH',	'HN');
INSERT INTO @tbl VALUES ('Qinghai'            ,	     'Haixi Mengguzu Zangzu',	'QH',	'HX');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Hami',	'XJ',	'HM');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Handan',	'HB',	'HD');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Hangzhou',	'ZJ',	'HZ');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Hanzhong',	'SA',	'HZ');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Hebi',	'HE',	'HB');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Hechi',	'GX',	'HC');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Hefei',	'AH',	'HF');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Hegang',	'HL',	'HG');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Heihe',	'HL',	'HH');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Hengshui',	'HB',	'HS');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Hengyang',	'HN',	'HY');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Hetian',	'XJ',	'HT');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Heyuan',	'GD',	'HY');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Heze',	'SD',	'HZ');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Hezhou',	'GX',	'HZ');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Hohhot',	'NM',	'HH');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Honghe Ha''nizu Yizu',	'YN',	'HH');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Huaibei',	'AH',	'HB');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Huaihua',	'HN',	'HH');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Huainan',	'AH',	'HN');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Huaiyin',	'JS',	'HY');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Huanggang',	'HU',	'HG');
INSERT INTO @tbl VALUES ('Qinghai'            ,	     'Huangnan Zangzu',	'QH',	'HU');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Huangshan',	'AH',	'HS');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Huangshi',	'HU',	'HS');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Huizhou',	'GD',	'HZ');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Huludao',	'LN',	'HL');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Hulunbeier',	'NM',	'HL');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Huzhou',	'ZJ',	'HU');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Ji''an',	'JX',	'JA');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Ji''nan',	'SD',	'JI');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Jiamusi',	'HL',	'JM');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Jiangmen',	'GD',	'JM');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Jiaozuo',	'HE',	'JZ');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Jiaxing',	'ZJ',	'JX');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Jiayuguan',	'GS',	'JY');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Jieyang',	'GD',	'JY');
INSERT INTO @tbl VALUES ('Jilin'            ,	     'Jilin',	'JL',	'JL');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Jinchang',	'GS',	'JC');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Jincheng',	'SX',	'JC');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Jingdezhen',	'JX',	'JD');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Jingmen',	'HU',	'JM');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Jingzhou',	'HU',	'JZ');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Jinhua',	'ZJ',	'JH');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Jining',	'SD',	'JN');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Jinzhong',	'SX',	'JZ');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Jinzhou',	'LN',	'JZ');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Jiujiang',	'JX',	'JJ');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Jiuquan',	'GS',	'JQ');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Jixi',	'HL',	'JX');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Jiyuan',	'HE',	'JY');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Kaifeng',	'HE',	'KF');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Kashi',	'XJ',	'KS');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Kelamayi',	'XJ',	'KL');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Kezilesu Keerkezi',	'XJ',	'KZ');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Kunming',	'YN',	'KM');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Laiwu',	'SD',	'LW');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Langfang',	'HB',	'LF');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Lanzhou',	'GS',	'LZ');
INSERT INTO @tbl VALUES ('Xizang'            ,	     'Lasa',	'XZ',	'LS');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Leshan',	'SC',	'LS');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Liangshan Yizu',	'SC',	'LI');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Lianyungang',	'JS',	'LY');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Liaocheng',	'SD',	'LC');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Liaoyang',	'LN',	'LY');
INSERT INTO @tbl VALUES ('Jilin'            ,	     'Liaoyuan',	'JL',	'LY');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Lijiang',	'YN',	'LJ');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Lincang',	'YN',	'LC');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Linfen',	'SX',	'LF');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Linxia Huizu',	'GS',	'LX');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Linyi',	'SD',	'LY');
INSERT INTO @tbl VALUES ('Xizang'            ,	     'Linzhi',	'XZ',	'LZ');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Lishui',	'ZJ',	'LS');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Liuan',	'AH',	'LA');
INSERT INTO @tbl VALUES ('Guizhou'            ,	     'Liupanshui',	'GZ',	'LP');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Liuzhou',	'GX',	'LZ');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Longnan',	'GS',	'LN');
INSERT INTO @tbl VALUES ('Fujian'            ,	     'Longyan',	'FJ',	'LY');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Loudi',	'HN',	'LD');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Luohe',	'HE',	'LH');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Luoyang',	'HE',	'LY');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Luzhou',	'SC',	'LZ');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Lyuliang',	'SX',	'LL');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Ma''anshan',	'AH',	'MA');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Maoming',	'GD',	'MM');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Meishan',	'SC',	'MS');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Meizhou',	'GD',	'MZ');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Mianyang',	'SC',	'MY');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Mudanjiang',	'HL',	'MD');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Nanchang',	'JX',	'NC');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Nanchong',	'SC',	'NC');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Nanjing',	'JS',	'NJ');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Nanning',	'GX',	'NN');
INSERT INTO @tbl VALUES ('Fujian'            ,	     'Nanping',	'FJ',	'NP');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Nantong',	'JS',	'NT');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Nanyang',	'HE',	'NY');
INSERT INTO @tbl VALUES ('Xizang'            ,	     'Naqu',	'XZ',	'NQ');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Neijiang',	'SC',	'NJ');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Ningbo',	'ZJ',	'NB');
INSERT INTO @tbl VALUES ('Fujian'            ,	     'Ningde',	'FJ',	'ND');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Nujiang Lisuzu',	'YN',	'NJ');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Panjin',	'LN',	'PJ');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Panzhihua',	'SC',	'PZ');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Pingdingshan',	'HE',	'PD');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Pingliang',	'GS',	'PL');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Pingxiang',	'JX',	'PX');
INSERT INTO @tbl VALUES ('Fujian'            ,	     'Putian',	'FJ',	'PT');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Puyang',	'HE',	'PY');
INSERT INTO @tbl VALUES ('Guizhou'            ,	     'Qiandongnan Miaozu Dongzu',	'GZ',	'QD');
INSERT INTO @tbl VALUES ('Guizhou'            ,	     'Qiannan Buyizu Miaozu',	'GZ',	'QN');
INSERT INTO @tbl VALUES ('Guizhou'            ,	     'Qianxi''nan Buyizu Miaozu',	'GZ',	'QX');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Qingdao',	'SD',	'QD');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Qingyang',	'GS',	'QY');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Qingyuan',	'GD',	'QY');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Qinhuangdao',	'HB',	'QH');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Qinzhou',	'GX',	'QZ');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Qiqihaer',	'HL',	'QQ');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Qitaihe',	'HL',	'QT');
INSERT INTO @tbl VALUES ('Fujian'            ,	     'Quanzhou',	'FJ',	'QZ');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Qujing',	'YN',	'QJ');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Quzhou',	'ZJ',	'QZ');
INSERT INTO @tbl VALUES ('Xizang'            ,	     'Rikaze',	'XZ',	'RK');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Rizhao',	'SD',	'RZ');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Sanmenxia',	'HE',	'SM');
INSERT INTO @tbl VALUES ('Fujian'            ,	     'Sanming',	'FJ',	'SM');
INSERT INTO @tbl VALUES ('Hainan'            ,	     'Sanya',	'HA',	'SY');
INSERT INTO @tbl VALUES ('Shanghai'            ,	     'Shanghai Shi',	'SH',	'SH');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Shangluo',	'SA',	'SL');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Shangqiu',	'HE',	'SQ');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Shangrao',	'JX',	'SR');
INSERT INTO @tbl VALUES ('Xizang'            ,	     'Shannan',	'XZ',	'SN');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Shantou',	'GD',	'ST');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Shanwei',	'GD',	'SW');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Shaoguan',	'GD',	'SG');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Shaoxing',	'ZJ',	'SX');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Shaoyang',	'HN',	'SY');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Sheng Zhixia Xingzheng',	'HU',	'SH');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Sheng Zhixia Yingzheng',	'XJ',	'SZ');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Shenyang',	'LN',	'SY');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Shenzhen',	'GD',	'SZ');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Shijiazhuang',	'HB',	'SJ');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Shiyan',	'HU',	'SY');
INSERT INTO @tbl VALUES ('Ningxia Hui'            ,	     'Shizuishan',	'NX',	'SZ');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Shuangyashan',	'HL',	'SY');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Shuozhou',	'SX',	'SZ');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Simao',	'YN',	'SM');
INSERT INTO @tbl VALUES ('Jilin'            ,	     'Siping',	'JL',	'SP');
INSERT INTO @tbl VALUES ('Jilin'            ,	     'Songyuan',	'JL',	'SY');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Suihua',	'HL',	'SH');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Suining',	'SC',	'SN');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Suizhou',	'HU',	'SZ');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Suqian',	'JS',	'SQ');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Suzhou',	'AH',	'SZ');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Suzhou',	'JS',	'SZ');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Tacheng',	'XJ',	'TC');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Taian',	'SD',	'TA');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Taiyuan',	'SX',	'TY');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Taizhou',	'JS',	'TZ');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Taizhou',	'ZJ',	'TZ');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Tangshan',	'HB',	'TS');
INSERT INTO @tbl VALUES ('Tianjin'            ,	     'Tianjin Shi',	'TJ',	'TJ');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Tianshui',	'GS',	'TS');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Tieling',	'LN',	'TL');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Tongchuan',	'SA',	'TC');
INSERT INTO @tbl VALUES ('Jilin'            ,	     'Tonghua',	'JL',	'TH');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Tongliao',	'NM',	'TL');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Tongling',	'AH',	'TL');
INSERT INTO @tbl VALUES ('Guizhou'            ,	     'Tongren',	'GZ',	'TR');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Tulufan',	'XJ',	'TL');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Weifang',	'SD',	'WF');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Weihai',	'SD',	'WH');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Weinan',	'SA',	'WN');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Wenshan Zhuangzu Miaozu',	'YN',	'WS');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Wenzhou',	'ZJ',	'WZ');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Wuhai',	'NM',	'WH');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Wuhan',	'HU',	'WH');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Wuhu',	'AH',	'WH');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Wulanchabu',	'NM',	'WL');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Wulumuqi',	'XJ',	'WL');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Wuwei',	'GS',	'WW');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Wuxi',	'JS',	'WX');
INSERT INTO @tbl VALUES ('Ningxia Hui'            ,	     'Wuzhong',	'NX',	'WZ');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Wuzhou',	'GX',	'WZ');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Xi''an',	'SA',	'XA');
INSERT INTO @tbl VALUES ('Fujian'            ,	     'Xiamen',	'FJ',	'XM');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Xiangfan',	'HU',	'XF');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Xiangtan',	'HN',	'XT');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Xiangxi Tujiazu Miaozu',	'HN',	'XX');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Xianning',	'HU',	'XN');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Xianyang',	'SA',	'XY');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Xiaogan',	'HU',	'XG');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Xilinguole',	'NM',	'XL');
INSERT INTO @tbl VALUES ('Nei Mongol'            ,	     'Xingan',	'NM',	'XG');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Xingtai',	'HB',	'XT');
INSERT INTO @tbl VALUES ('Qinghai'            ,	     'Xining',	'QH',	'XN');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Xinxiang',	'HE',	'XX');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Xinyang',	'HE',	'XY');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Xinyu',	'JX',	'XY');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Xinzhou',	'SX',	'XZ');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Xishuangbanna Daizu',	'YN',	'XS');
INSERT INTO @tbl VALUES ('Anhui'            ,	     'Xuancheng',	'AH',	'XC');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Xuchang',	'HE',	'XC');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Xuzhou',	'JS',	'XZ');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Ya''an',	'SC',	'YA');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Yan''an',	'SA',	'YA');
INSERT INTO @tbl VALUES ('Jilin'            ,	     'Yanbian Chaoxianzu',	'JL',	'YB');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Yancheng',	'JS',	'YC');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Yangjiang',	'GD',	'YJ');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Yangquan',	'SX',	'YQ');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Yangzhou',	'JS',	'YZ');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Yantai',	'SD',	'YT');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Yibin',	'SC',	'YB');
INSERT INTO @tbl VALUES ('Hubei'            ,	     'Yichang',	'HU',	'YC');
INSERT INTO @tbl VALUES ('Heilongjiang'            ,	     'Yichun',	'HL',	'YC');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Yichun',	'JX',	'YC');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Yili',	'XJ',	'YL');
INSERT INTO @tbl VALUES ('Xinjiang Uygur'            ,	     'Yili Hasake',	'XJ',	'YH');
INSERT INTO @tbl VALUES ('Ningxia Hui'            ,	     'Yinchuan',	'NX',	'YC');
INSERT INTO @tbl VALUES ('Liaoning'            ,	     'Yingkou',	'LN',	'YK');
INSERT INTO @tbl VALUES ('Jiangxi'            ,	     'Yingtan',	'JX',	'YT');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Yiyang',	'HN',	'YI');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Yongzhou',	'HN',	'YZ');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Yueyang',	'HN',	'YU');
INSERT INTO @tbl VALUES ('Guangxi Zhuang'            ,	     'Yulin',	'GX',	'YL');
INSERT INTO @tbl VALUES ('Shaanxi'            ,	     'Yulin',	'SA',	'YL');
INSERT INTO @tbl VALUES ('Shanxi'            ,	     'Yuncheng',	'SX',	'YC');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Yunfu',	'GD',	'YF');
INSERT INTO @tbl VALUES ('Qinghai'            ,	     'Yushu Zangzu',	'QH',	'YS');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Yuxi',	'YN',	'YX');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Zaozhuang',	'SD',	'ZZ');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Zhangjiajie',	'HN',	'ZJ');
INSERT INTO @tbl VALUES ('Hebei'            ,	     'Zhangjiakou',	'HB',	'ZJ');
INSERT INTO @tbl VALUES ('Gansu'            ,	     'Zhangye',	'GS',	'ZY');
INSERT INTO @tbl VALUES ('Fujian'            ,	     'Zhangzhou',	'FJ',	'ZZ');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Zhanjiang',	'GD',	'ZJ');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Zhaoqing',	'GD',	'ZQ');
INSERT INTO @tbl VALUES ('Yunnan'            ,	     'Zhaotong',	'YN',	'ZT');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Zhengzhou',	'HE',	'ZZ');
INSERT INTO @tbl VALUES ('Jiangsu'            ,	     'Zhenjiang',	'JS',	'ZJ');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Zhongshan',	'GD',	'ZS');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Zhoukou',	'HE',	'ZK');
INSERT INTO @tbl VALUES ('Zhejiang'            ,	     'Zhoushan',	'ZJ',	'ZS');
INSERT INTO @tbl VALUES ('Guangdong'            ,	     'Zhuhai',	'GD',	'ZH');
INSERT INTO @tbl VALUES ('Henan'            ,	     'Zhumadian',	'HE',	'ZM');
INSERT INTO @tbl VALUES ('Hunan'            ,	     'Zhuzhou',	'HN',	'ZZ');
INSERT INTO @tbl VALUES ('Shandong'            ,	     'Zibo',	'SD',	'ZB');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Zigong',	'SC',	'ZG');
INSERT INTO @tbl VALUES ('Sichuan'            ,	     'Ziyang',	'SC',	'ZY');
INSERT INTO @tbl VALUES ('Guizhou'            ,	     'Zunyi',	'GZ',	'ZY');

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

