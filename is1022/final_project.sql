USE qum6;

##Create Tables

#geoplaces2 table
CREATE TABLE geoplaces2
(
    placeID varchar(100) PRIMARY KEY NOT NULL,
    latitude double NOT NULL,
    longitude double NOT NULL,
    the_geom_meter varchar(100) NOT NULL,
    name varchar(100) NOT NULL,
    address varchar(100),
    city varchar(100),
    state varchar(100),
    country varchar(100),
    fax varchar(100),
    zip varchar(100),
    alcohol varchar(100),
    smoking_area varchar(100),
    dress_code varchar(100),
    accessibility varchar(100),
    price varchar(100),
    url varchar(100),
    Rambience varchar(100),
    franchise varchar(100),
    area varchar(100),
    other_services varchar(100)
);

#userprofile
CREATE TABLE userprofile
(
    userID varchar(100) PRIMARY KEY NOT NULL,
    latitude double NOT NULL,
    longitude double NOT NULL,
    smoker varchar(100),
    drink_level varchar(100),
    dress_preference varchar(100),
    ambience varchar(100),
    transport varchar(100),
    marital_status varchar(100),
    hijos varchar(100),
    birth_year int,
    interest varchar(100),
    personality varchar(100),
    religion varchar(100),
    activity varchar(100),
    color varchar(100),
    weight int,
    budget varchar(100),
    height double
);


##cuisine
CREATE TABLE cuisine
(
    Rcuisine varchar(100) PRIMARY KEY NOT NULL
);

##chefmozaccepts
CREATE TABLE chefmozaccepts
(
    cma_num int PRIMARY KEY AUTO_INCREMENT,
    fk_cma_placeID varchar(100) NOT NULL,
    Rpayment varchar(100)
);


##chefmozcuisine
CREATE TABLE chefmozcuisine
(
    cmc_num int PRIMARY KEY AUTO_INCREMENT,
    fk_cmc_placeID varchar(100) NOT NULL,
    fk_cmc_Rcuisine varchar(100)
);


##chefmozhours4
CREATE TABLE chefmozhours4
(
    cmh_num int PRIMARY KEY AUTO_INCREMENT,
    fk_cmh_placeID varchar(100) NOT NULL,
    hours varchar(100),
    days varchar(100)
);


##chefmozparking
CREATE TABLE chefmozparking
(
    cmp_num int PRIMARY KEY AUTO_INCREMENT,
    fk_cmp_placeID varchar(100) NOT NULL,
    parking_lot varchar(100)
);


##usercuisine
CREATE TABLE usercuisine
(
    uc_num int PRIMARY KEY AUTO_INCREMENT,
    fk_uc_userID varchar(100) NOT NULL,
    fk_uc_Rcuisine varchar(100)
);


##userpayment
CREATE TABLE userpayment
(
    up_num int PRIMARY KEY AUTO_INCREMENT,
    fk_up_userID varchar(100) NOT NULL,
    Upayment varchar(100)
);


##rating_final
CREATE TABLE rating_final
(
    fk_rf_userID varchar(100),
    fk_rf_placeID varchar(100),
    rating int,
    food_rating int,
    service_rating int
);


##Relationships
ALTER TABLE chefmozaccepts
ADD CONSTRAINT fk_cma_placeID
FOREIGN KEY (fk_cma_placeID) REFERENCES geoplaces2 (placeID)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE chefmozcuisine
ADD CONSTRAINT fk_cmc_placeID
FOREIGN KEY (fk_cmc_placeID) REFERENCES geoplaces2 (placeID)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE chefmozcuisine
ADD CONSTRAINT fk_cmc_Rcuisine
FOREIGN KEY (fk_cmc_Rcuisine) REFERENCES cuisine (Rcuisine)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE chefmozhours4
ADD CONSTRAINT fk_cmh_placeID
FOREIGN KEY (fk_cmh_placeID) REFERENCES geoplaces2 (placeID)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE chefmozparking
ADD CONSTRAINT fk_cmp_placeID
FOREIGN KEY (fk_cmp_placeID) REFERENCES geoplaces2 (placeID)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE usercuisine
ADD CONSTRAINT fk_uc_userID
FOREIGN KEY (fk_uc_userID) REFERENCES userprofile (userID)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE usercuisine
ADD CONSTRAINT fk_uc_Rcuisine
FOREIGN KEY (fk_uc_Rcuisine) REFERENCES cuisine (Rcuisine)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE userpayment
ADD CONSTRAINT fk_up_userID
FOREIGN KEY (fk_up_userID) REFERENCES userprofile (userID)
ON DELETE CASCADE ON UPDATE CASCADE;


ALTER TABLE rating_final
ADD CONSTRAINT fk_rf_userID
FOREIGN KEY (fk_rf_userID) REFERENCES userprofile (userID)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE rating_final
ADD CONSTRAINT fk_rf_placeID
FOREIGN KEY (fk_rf_placeID) REFERENCES geoplaces2 (placeID)
ON DELETE CASCADE ON UPDATE CASCADE;


