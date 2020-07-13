
/* Drop Tables */

DROP TABLE accompany CASCADE CONSTRAINTS;
DROP TABLE reservation CASCADE CONSTRAINTS;
DROP TABLE air CASCADE CONSTRAINTS;
DROP TABLE review CASCADE CONSTRAINTS;
DROP TABLE auto_spots CASCADE CONSTRAINTS;
DROP TABLE auto_plan CASCADE CONSTRAINTS;
DROP TABLE auto_save CASCADE CONSTRAINTS;
DROP TABLE hotel CASCADE CONSTRAINTS;
DROP TABLE save_spots CASCADE CONSTRAINTS;
DROP TABLE plan CASCADE CONSTRAINTS;
DROP TABLE cities CASCADE CONSTRAINTS;
DROP TABLE tag_rel CASCADE CONSTRAINTS;
DROP TABLE city CASCADE CONSTRAINTS;
DROP TABLE planner CASCADE CONSTRAINTS;
DROP TABLE tag CASCADE CONSTRAINTS;
DROP TABLE userinfo CASCADE CONSTRAINTS;



/* Drop Sequences */

DROP SEQUENCE seq_acc;
DROP SEQUENCE seq_air;
DROP SEQUENCE seq_auto_plan;
DROP SEQUENCE seq_cities;
DROP SEQUENCE seq_city;
DROP SEQUENCE seq_hotel;
DROP SEQUENCE seq_plan;
DROP SEQUENCE seq_planner;
DROP SEQUENCE seq_res;
DROP SEQUENCE seq_review;
DROP SEQUENCE seq_spot_auto;
DROP SEQUENCE seq_spot_save;
DROP SEQUENCE seq_tag;
DROP SEQUENCE seq_tag_rel;




/* Create Sequences */

CREATE SEQUENCE seq_acc 
nocache 
nocycle;
CREATE SEQUENCE seq_air
nocache 
nocycle;
CREATE SEQUENCE seq_auto_plan
nocache 
nocycle;
CREATE SEQUENCE seq_cities
nocache 
nocycle;
CREATE SEQUENCE seq_city
nocache 
nocycle;
CREATE SEQUENCE seq_hotel
nocache 
nocycle;
CREATE SEQUENCE seq_plan
nocache 
nocycle;
CREATE SEQUENCE seq_planner
nocache 
nocycle;
CREATE SEQUENCE seq_res
nocache 
nocycle;
CREATE SEQUENCE seq_review
nocache 
nocycle;
CREATE SEQUENCE seq_spot_auto
nocache 
nocycle;
CREATE SEQUENCE seq_spot_save
nocache 
nocycle;
CREATE SEQUENCE seq_tag
nocache 
nocycle;
CREATE SEQUENCE seq_tag_rel
nocache 
nocycle;



/* Create Tables */

CREATE TABLE accompany
(
	acc_no number NOT NULL,
	planner_no number NOT NULL,
	user_id nvarchar2(200) NOT NULL,
	PRIMARY KEY (acc_no)
);


CREATE TABLE air
(
	air_no number NOT NULL,
	air_ddate nvarchar2(200) NOT NULL,
	air_rdate nvarchar2(200) NOT NULL,
	air_price nvarchar2(200) NOT NULL,
	air_passenger number DEFAULT 1 NOT NULL,
	air_class nvarchar2(200) DEFAULT 'economy' NOT NULL,
	air_dep nvarchar2(200) DEFAULT '서울' NOT NULL,
	air_arr nvarchar2(200) NOT NULL,
	PRIMARY KEY (air_no)
);


CREATE TABLE auto_plan
(
	auto_plan_no number NOT NULL,
	auto_plan_date nvarchar2(200),
	city_no number NOT NULL,
	PRIMARY KEY (auto_plan_no)
);


CREATE TABLE auto_save
(
	save_spot_no number NOT NULL,
	auto_save_spot_no number NOT NULL,
	auto_save_count number DEFAULT 1,
	PRIMARY KEY (auto_save_spot_no)
);


CREATE TABLE auto_spots
(
	auto_spot_no number NOT NULL,
	spot_name nvarchar2(200) NOT NULL,
	spot_id nvarchar2(200) NOT NULL UNIQUE,
	spot_latlng nvarchar2(200) NOT NULL,
	auto_plan_no number NOT NULL,
	PRIMARY KEY (auto_spot_no)
);


CREATE TABLE cities
(
	cities_no number NOT NULL,
	city_no number NOT NULL,
	planner_no number NOT NULL,
	cities_date nvarchar2(200),
	PRIMARY KEY (cities_no)
);


CREATE TABLE city
(
	city_no number NOT NULL,
	city_name nvarchar2(200) NOT NULL,
	city_intro nvarchar2(200),
	city_img nvarchar2(500) NOT NULL,
	city_latlng nvarchar2(200) NOT NULL,
	PRIMARY KEY (city_no)
);


CREATE TABLE hotel
(
	hotel_no number NOT NULL,
	hotel_name nvarchar2(200) NOT NULL,
	hotel_city nvarchar2(200) NOT NULL,
	hotel_in nvarchar2(200) NOT NULL,
	hotel_out nvarchar2(200) NOT NULL,
	hotel_customer number DEFAULT 1 NOT NULL,
	hotel_room number DEFAULT 1 NOT NULL,
	hotel_price nvarchar2(200) NOT NULL,
	hotel_latlng nvarchar2(200) NOT NULL,
	hotel_score nvarchar2(50) NOT NULL,
	cities_no number NOT NULL,
	PRIMARY KEY (hotel_no)
);


CREATE TABLE plan
(
	plan_no number NOT NULL,
	plan_date nvarchar2(200) NOT NULL,
	cities_no number,
	PRIMARY KEY (plan_no)
);


CREATE TABLE planner
(
	planner_no number NOT NULL,
	planner_acc number DEFAULT 0 NOT NULL,
	user_id nvarchar2(200) NOT NULL,
	PRIMARY KEY (planner_no)
);


CREATE TABLE reservation
(
	air_res_no number NOT NULL,
	planner_no number,
	air_no number NOT NULL,
	PRIMARY KEY (air_res_no)
);


CREATE TABLE review
(
	review_no number NOT NULL,
	user_id nvarchar2(200),
	auto_spot_no number,
	city_no number NOT NULL,
	review_title nvarchar2(100) NOT NULL,
	review_content nvarchar2(1000) NOT NULL,
	review_date date NOT NULL,
	PRIMARY KEY (review_no)
);


CREATE TABLE save_spots
(
	save_spot_no number NOT NULL,
	spot_name nvarchar2(200) NOT NULL,
	spot_id nvarchar2(200) NOT NULL,
	spot_latlng nvarchar2(200) NOT NULL,
	plan_no number,
	PRIMARY KEY (save_spot_no)
);


CREATE TABLE tag
(
	tag_no number NOT NULL,
	tag_name nvarchar2(200) NOT NULL,
	PRIMARY KEY (tag_name)
);


CREATE TABLE tag_rel
(
	tal_rel_no number NOT NULL,
	tag_name nvarchar2(200) NOT NULL,
	city_no number NOT NULL,
	PRIMARY KEY (tal_rel_no)
);


CREATE TABLE userinfo
(
	user_id nvarchar2(200) NOT NULL,
	user_name nvarchar2(200),
	user_pwd nvarchar2(50) NOT NULL,
	user_rrn nvarchar2(40) NOT NULL,
	user_gender nvarchar2(10) NOT NULL,
	PRIMARY KEY (user_id)
);



/* Create Foreign Keys */

ALTER TABLE reservation
	ADD FOREIGN KEY (air_no)
	REFERENCES air (air_no)
;


ALTER TABLE auto_spots
	ADD FOREIGN KEY (auto_plan_no)
	REFERENCES auto_plan (auto_plan_no)
;


ALTER TABLE review
	ADD FOREIGN KEY (auto_spot_no)
	REFERENCES auto_spots (auto_spot_no)
;


ALTER TABLE hotel
	ADD FOREIGN KEY (cities_no)
	REFERENCES cities (cities_no)
;


ALTER TABLE plan
	ADD FOREIGN KEY (cities_no)
	REFERENCES cities (cities_no)
;


ALTER TABLE auto_plan
	ADD FOREIGN KEY (city_no)
	REFERENCES city (city_no)
;


ALTER TABLE cities
	ADD FOREIGN KEY (city_no)
	REFERENCES city (city_no)
;


ALTER TABLE review
	ADD FOREIGN KEY (city_no)
	REFERENCES city (city_no)
;


ALTER TABLE tag_rel
	ADD FOREIGN KEY (city_no)
	REFERENCES city (city_no)
;


ALTER TABLE save_spots
	ADD FOREIGN KEY (plan_no)
	REFERENCES plan (plan_no)
;


ALTER TABLE accompany
	ADD FOREIGN KEY (planner_no)
	REFERENCES planner (planner_no)
;


ALTER TABLE cities
	ADD FOREIGN KEY (planner_no)
	REFERENCES planner (planner_no)
;


ALTER TABLE reservation
	ADD FOREIGN KEY (planner_no)
	REFERENCES planner (planner_no)
;


ALTER TABLE auto_save
	ADD FOREIGN KEY (save_spot_no)
	REFERENCES save_spots (save_spot_no)
;


ALTER TABLE tag_rel
	ADD FOREIGN KEY (tag_name)
	REFERENCES tag (tag_name)
;


ALTER TABLE accompany
	ADD FOREIGN KEY (user_id)
	REFERENCES userinfo (user_id)
;


ALTER TABLE planner
	ADD FOREIGN KEY (user_id)
	REFERENCES userinfo (user_id)
;


ALTER TABLE review
	ADD FOREIGN KEY (user_id)
	REFERENCES userinfo (user_id)
;



