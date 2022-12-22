# База данных инвестиционных проектов, по которым Правительство Санкт-Петербурга предоставляет земельные участки.
# В базе данных есть информация о земельных участках, инвесторах, о том обязывают ли инвестора по завершении проекта передавать помещения в собственность города. 
# К селектам даются отдельные комментарии


DROP DATABASE IF EXISTS investment_projects;
CREATE DATABASE investment_projects;
USE investment_projects;

DROP TABLE IF EXISTS bylaw;
CREATE TABLE bylaw (
	id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
	name VARCHAR(255),
	bylaw_number INT UNIQUE,
	body TEXT,
	created_at DATETIME DEFAULT NOW(),
    updated_at DATETIME ON UPDATE CURRENT_TIMESTAMP
    
) COMMENT 'наименование постановления правительства';

INSERT INTO `bylaw` (`name`, `bylaw_number`, `body`, `created_at`, `updated_at`)
VALUES 
('ПП СПб о предоставлении земельного участка для строительства обеспечения спортивно-зрелищных мероприятий', '622', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 29800000 рублей', '2022-07-05', '2022-07-05'),
('ПП СПб о предоставлении земельного участка для строительства объекта предоставления коммунальных услуг', '624', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 21815 рублей', '2022-07-05', '2022-07-05'),
('ПП СПб о предоставлении земельного участка для строительства объекта заправки транспортных средств', '625', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 537168 рублей', '2022-07-05', '2022-07-05'),
('ПП СПб о предоставлении земельного участка для строительства объекта тяжелой промышленности', '558', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 3295373 рублей', '2022-06-27', '2022-06-27'),
('ПП СПб о предоставлении земельного участка для строительства объекта железнодорожного транспорта', '437', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 3,57 рублей', '2022-05-23', '2022-05-23'),
('ПП СПб о предоставлении земельного участка для строительства объекта железнодорожного транспорта', '411', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 233,16 рублей', '2022-05-12', '2022-05-12'),
('ПП СПб о предоставлении земельного участка для строительства объекта спортивно-зрелещных мероприятий', '366', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 35700000 рублей', '2022-04-27', '2022-04-27'),
('ПП СПб о предоставлении земельного участка для строительства объекта дошкольного, начального и среднего образования', '358', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 154001 рублей', '2022-04-27', '2022-04-27'),
('ПП СПб о предоставлении земельного участка для строительства объекта бытового обслуживания', '306', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 37800000 рублей', '2022-04-07', '2022-04-07'),
('ПП СПб о предоставлении земельного участка для строительства объекта обеспечения занятий спортов в помещениях', '304', 'Предоставить земельный участок. Инвестору перечислить в бюджет Санкт-Петербурга на период строительства денежные средства в сумме 35700000 рублей', '2022-04-07', '2022-04-07')
;

DROP TABLE IF EXISTS adress;
CREATE TABLE adress (
	id SERIAL,
	bylaw_id BIGINT UNSIGNED NOT NULL,
	street_name VARCHAR(255),
	landscape_number INT,
	
	FOREIGN KEY (bylaw_id) REFERENCES bylaw(id)
) COMMENT 'Адрес участка';

INSERT INTO `ADRESS` (`bylaw_id`, `street_name`, `landscape_number`)
VALUES 
('1', 'Ленская ул', '32'),
('2','Колпинское шоссе','215'),
('3', 'Северная ул', '6'),
('4', 'Мебельная ул', '23'),
('5', '3-й Рыбацкий проезд', '27'),
('6', 'Рейсовая ул', '21'),
('7', 'Дальневосточный пр', '62'),
('8', 'Новая ул', '1'),
('9', 'Маршала Захарова', '58'),
('10', 'Дунайский пр', '152')
;


DROP TABLE IF EXISTS district;
CREATE TABLE district (
	id SERIAL,
	district_id BIGINT UNSIGNED NOT NULL,
	district_name ENUM('Адмиралтейский район', 'Василеостровский район', 'Выборгский район', 'Калининский район', 
	'Кировский район', 'Колпинский район', 'Красногвардейский район', 'Красносельский район', 'Кронштадтский район', 
	'Курортный район', 'Московский район', 'Невский район', 'Петроградский район', 'Петродворцовый район',
	'Приморский район', 'Пушкинский район', 'Фрунзенский район', 'Центральный район'),
	
	FOREIGN KEY (district_id) REFERENCES adress(id)
) COMMENT 'район города в котором находится участок';

INSERT INTO `DISTRICT` (`district_id`, `district_name`)
VALUES
('1', 'Красногвардейский район'),
('2', 'Пушкинский район'),
('3', 'Колпинский район'),
('4', 'Приморский район'),
('5', 'Невский район'),
('6', 'Московский район'),
('7', 'Невский район'),
('8', 'Пушкинский район'),
('9', 'Красносельский район'),
('10', 'Фрунзенский район')
;


DROP TABLE IF EXISTS cadastral_number;
CREATE TABLE cadastral_number (
	id SERIAL,
	district_id BIGINT UNSIGNED NOT NULL,
	cad_number BIGINT,
	
	FOREIGN KEY (district_id) REFERENCES adress(id)
) COMMENT 'кадастровый номер участка';


INSERT INTO `CADASTRAL_NUMBER` (`district_id`, `cad_number`)
VALUES
('1', '781100061079038'),
('2', '7842001830428167'),
('3', '783700172051247'),
('4', '783404140101327'),
('5', '781200072233870'),
('6', '781407704021504'),
('7', '781206336011266'),
('8', '784218106046'),
('9', '784000083121014'),
('10', '7813000742013884')
;


DROP TABLE IF EXISTS landscape_area;
CREATE TABLE landscape_area (
	id SERIAL,
	district_id BIGINT UNSIGNED NOT NULL,
	area BIGINT,
	
	FOREIGN KEY (district_id) REFERENCES adress(id)
) COMMENT 'Площадь участка';

INSERT INTO `LANDSCAPE_AREA` (`district_id`, `area`)
VALUES
('1', '7988'),
('2', '850'),
('3', '10016'),
('4', '79194'),
('5', '211'),
('6', '13785'),
('7', '9843'),
('8', '4086'),
('9', '4698'),
('10', '10060')
;

DROP TABLE IF EXISTS investor;
CREATE TABLE investor (
	id SERIAL,
	bylaw_id BIGINT UNSIGNED NOT NULL,
	investor_name VARCHAR(255),
	investor_form ENUM('ООО', 'АО', 'ИП', 'АНО'),
	taxpayer_number BIGINT,
	
	FOREIGN KEY (bylaw_id) REFERENCES bylaw(id)
) COMMENT 'Описание инвестора';

INSERT INTO `INVESTOR` (`bylaw_id`, `investor_name`, `investor_form`, `taxpayer_number`)
VALUES
('1', 'СТ-3', 'ООО', '7813632425'),
('2', 'Петербургтеплоэнерго', 'ООО', '7838024362'),
('3', 'Газпром газомоторное топливо','ООО','3905078834'),
('4', 'ТАУРАС-ФЕНИКС', 'АО', '7804144284'),
('5', 'Российские железные дороги', 'АО', '7708503727'),
('6', 'Российские железные дороги', 'АО', '7708503727'),
('7', 'СпортРинк', 'ООО', '7811729252'),
('8', 'Специализированный застройщик "Графит"', 'ООО', '1635012561'),
('9', 'Центр 2', 'ООО', '780625465433'),
('10', 'Навигатор', 'ООО', '7810060530 ')
;

DROP TABLE IF EXISTS expiration_date;
CREATE TABLE expiration_date (
	id SERIAL,
	bylaw_id BIGINT UNSIGNED NOT NULL,
	end_date DATETIME,
	
	FOREIGN KEY (bylaw_id) REFERENCES bylaw(id)
)COMMENT 'дата истечения постановения';

INSERT INTO `EXPIRATION_DATE` (`bylaw_id`, `end_date`)
VALUES
('1', '2026-07-05'),
('2', '2025-07-05'),
('3', '2025-07-05'),
('4', '2026-06-27'),
('5', '2025-05-23'),
('6', '2025-05-12'),
('7', '2025-04-27'),
('8', '2026-04-27'),
('9', '2025-04-07'),
('10', '2025-04-07')
;

DROP TABLE IF EXISTS placement_to_city;
CREATE TABLE placement_to_city (
	id SERIAL,
	bylaw_id BIGINT UNSIGNED NOT NULL,
	transfer_room_to_city ENUM ('да', 'нет'),
	
	FOREIGN KEY (bylaw_id) REFERENCES bylaw(id)
) COMMENT 'Передаются ли помещения городу';

INSERT INTO `PLACEMENT_TO_CITY` (`bylaw_id`, `transfer_room_to_city`)
VALUES
('1', 'да'),
('2', 'нет'),
('3', 'нет'),
('4', 'нет'),
('5', 'нет'),
('6', 'нет'),
('7', 'да'),
('8', 'нет'),
('9', 'да'),
('10', 'да')
;

DROP TABLE IF EXISTS area_placement;
CREATE TABLE area_placement (
	id SERIAL,
	area_placement_id BIGINT UNSIGNED,
	room_area BIGINT,
	
	FOREIGN KEY (area_placement_id) REFERENCES placement_to_city(id)
) COMMENT 'Площадь передаваемых помещений';

INSERT INTO `AREA_PLACEMENT` (`area_placement_id`, `room_area`)
VALUES
('1', '150'),
('2', '0'),
('3', '0'),
('4', '0'),
('5', '0'),
('6', '0'),
('7', '70'),
('8', '0'),
('9', '531'),
('10', '507')
;

DROP TABLE IF EXISTS investment_size;
CREATE TABLE investment_size (
	id SERIAL,
	bylaw_id BIGINT UNSIGNED NOT NULL,
	investment_value BIGINT,
	
	FOREIGN KEY (bylaw_id) REFERENCES bylaw(id)
) COMMENT 'Объем инвестиций';


INSERT INTO `INVESTMENT_SIZE` (`bylaw_id`, `investment_value`)
VALUES
('1', '240000000'),
('2', '50000000'),
('3', '75000000'),
('4', '2700000000'),
('5', '1000000'),
('6', '60000000'),
('7', '94000000'),
('8', '1450700000'),
('9', '45000000'),
('10', '180000000')
;

# представление 1
CREATE OR replace VIEW view_exp_date
	AS SELECT bylaw_id, end_date
	FROM EXPIRATION_DATE
	WHERE END_DATE > NOW();

SELECT * FROM view_exp_date
	WHERE bylaw_id > 4;


# представление 2
CREATE OR replace VIEW min_max_investment
	AS SELECT 
	MIN(investment_value) AS MIN,
	MAX(investment_value) AS MAX
	FROM
	investment_size
;

SELECT * FROM min_max_investment;




SELECT 
	SUM(investment_value) 
	FROM
	investment_size
;

# определение суммы площади участков, в рамках которых инвестор передает часть помещений в собственность города
SELECT 
	sum(area) AS 'total area'
FROM LANDSCAPE_AREA
JOIN
PLACEMENT_TO_CITY ON placement_to_city.ID = landscape_area.ID 
WHERE 
TRANSFER_ROOM_TO_CITY = 'да' 
;


# определение инвесторов, у которых инвестиции более 1000000000
SELECT
investor_name, INVESTMENT_VALUE 
FROM INVESTOR
JOIN 
INVESTMENT_SIZE ON investor.id = investment_size.ID 
WHERE 
INVESTMENT_VALUE > '1000000000'
ORDER BY investor_name;




# Процедура, выбирающая инвестиционные проекты, которые реализуются в одном районе


DROP PROCEDURE IF EXISTS project_search;

DELIMITER //

CREATE PROCEDURE project_search(project_id bigint unsigned)
BEGIN
	SELECT d2.ID
	FROM district d1
	JOIN district d2 ON d1.DISTRICT_NAME = d2.DISTRICT_NAME 
	WHERE d1.id = project_id
		AND d2.id != project_id
	;
END//

DELIMITER ;

CALL project_search(5);








