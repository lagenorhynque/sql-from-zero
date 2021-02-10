/*
  演習3.1

  第1正規形
 */

/*
  演習3.2

  部分関数従属:
  - {支社コード} -> {支社名}
  - {支社コード, 支店コード} -> {支店名}
  - {商品コード} -> {商品名, 商品分類コード}
  推移的関数従属:
  - {商品コード} -> {商品分類コード} -> {分類名}
 */

/*
  演習3.3
 */

-- 支社テーブル
CREATE TABLE shisha (
  shisha_code CHAR(3) NOT NULL COMMENT '支社コード',
  name VARCHAR(100) NOT NULL COMMENT '支社名',
  PRIMARY KEY (shisha_code)
) COMMENT='支社';

-- 支店テーブル
CREATE TABLE shiten (
  shisha_code CHAR(3) NOT NULL COMMENT '支社コード',
  shiten_code CHAR(2) NOT NULL COMMENT '支店コード',
  name VARCHAR(100) NOT NULL COMMENT '支店名',
  PRIMARY KEY (shisha_code, shiten_code),
  FOREIGN KEY (shisha_code) REFERENCES shisha (shisha_code)
) COMMENT='支店';

-- 商品分類テーブル
CREATE TABLE shohin_bunrui (
  shohin_bunrui_code CHAR(2) NOT NULL COMMENT '商品分類コード',
  name VARCHAR(100) NOT NULL COMMENT '分類名',
  PRIMARY KEY (shohin_bunrui_code)
) COMMENT='商品分類';

-- 商品テーブル
CREATE TABLE shohin (
  shohin_code CHAR(3) NOT NULL COMMENT '商品コード',
  name VARCHAR(100) NOT NULL COMMENT '商品名',
  shohin_bunrui_code CHAR(2) NOT NULL COMMENT '商品分類コード',
  PRIMARY KEY (shohin_code),
  FOREIGN KEY (shohin_bunrui_code) REFERENCES shohin_bunrui (shohin_bunrui_code)
) COMMENT='商品';

-- 支店-商品テーブル
CREATE TABLE shiten_shohin (
  shisha_code CHAR(3) NOT NULL COMMENT '支社コード',
  shiten_code CHAR(2) NOT NULL COMMENT '支店コード',
  shohin_code CHAR(3) NOT NULL COMMENT '商品コード',
  PRIMARY KEY (shisha_code, shiten_code, shohin_code),
  FOREIGN KEY (shisha_code, shiten_code) REFERENCES shiten (shisha_code, shiten_code),
  FOREIGN KEY (shohin_code) REFERENCES shohin (shohin_code)
) COMMENT='支店-商品';

-- 非正規化するクエリ
SELECT
  shisha.shisha_code,
  shisha.name shisha_name,
  shiten.shisha_code,
  shiten.name shiten_name,
  shohin.shohin_code,
  shohin.name shohin_name,
  shohin_bunrui.shohin_bunrui_code,
  shohin_bunrui.name shohin_bunrui_name
  FROM
  shiten_shohin
    JOIN shisha USING (shisha_code)
    JOIN shiten USING (shisha_code, shiten_code)
    JOIN shohin USING (shohin_code)
    JOIN shohin_bunrui USING (shohin_bunrui_code);

-- サンプルデータ
INSERT INTO shisha (shisha_code, name) VALUES ('001', '東京'), ('002', '大阪');
INSERT INTO shiten (shisha_code, shiten_code, name) VALUES ('001', '01', '渋谷'), ('001', '02', '八重洲'), ('002', '01', '堺'), ('002', '02', '豊中');
INSERT INTO shohin_bunrui (shohin_bunrui_code, name) VALUES ('C1', '水洗用品'), ('C2', '食器'), ('C3', '書籍'), ('C4', '日用雑貨');
INSERT INTO shohin (shohin_code, name, shohin_bunrui_code) VALUES ('001', '石鹸', 'C1'), ('002', 'タオル', 'C1'), ('003', 'ハブラシ', 'C1'), ('004', 'コップ', 'C1'), ('005', '箸', 'C2'), ('006', 'スプーン', 'C2'), ('007', '雑誌', 'C3'), ('008', '爪切り', 'C4');
INSERT INTO shiten_shohin (shisha_code, shiten_code, shohin_code) VALUES ('001', '01', '001'), ('001', '01', '002'), ('001', '01', '003'), ('001', '02', '002'), ('001', '02', '003'), ('001', '02', '004'), ('001', '02', '005'), ('001', '02', '006'), ('002', '01', '001'), ('002', '01', '002'), ('002', '02', '007'), ('002', '02', '008');
