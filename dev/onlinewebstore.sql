-- DATABASE {onlinewebstore}
CREATE DATABASE onlinewebstore;

USE onlinewebstore;

-- ACCESS TYPE {supper, admin, normal}
CREATE TABLE access_types(
    a_type_id INT(11) NOT NULL AUTO_INCREMENT,
    a_type_name VARCHAR(25) NOT NULL,
    
    PRIMARY KEY (a_type_id)
);

-- USER
CREATE TABLE users(
    user_id VARCHAR(13) NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    middle_name VARCHAR(25) NULL,
    last_name VARCHAR(25) NOT NULL,
    phone_on INT(13) NOT NULL,
    email VARCHAR(40) NOT NULL,
    user_img VARCHAR(255) NULL,
    user_address VARCHAR(255) NOT NULL,

    PRIMARY KEY (user_id)
);

-- LOGIN
CREATE TABLE users_login(
    login_id INT(11) NOT NULL AUTO_INCREMENT,
    user_pwd VARCHAR(40) NOT NULL,
    user VARCHAR(13) NOT NULL,
    access_type INT(11) NOT NULL,
    
    PRIMARY KEY (login_id),

    CONSTRAINT users_login_id FOREIGN KEY(user) REFERENCES users(user_id) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT users_login_access_type FOREIGN KEY(access_type) REFERENCES access_types(a_type_id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- CATEGORY {accesory, clothes}
CREATE TABLE item_cats(
    icat_id INT(11) NOT NULL AUTO_INCREMENT,
    icat_name VARCHAR(25) NOT NULL,
    
    PRIMARY KEY (icat_id)
);

-- CATEGORY_STATUS {new, used}
CREATE TABLE item_cat_status(
    icst_id INT(11) NOT NULL AUTO_INCREMENT,
    icst_name VARCHAR(25) NOT NULL,
    
    PRIMARY KEY (icst_id)
);

-- ITEM 
CREATE TABLE items(
    item_id INT(11) NOT NULL AUTO_INCREMENT,
    item_name VARCHAR(25) NOT NULL,
    item_cat INT(11) NOT NULL,
    item_cat_stat INT(11) NOT NULL,
    user VARCHAR(13) NOT NULL,
    price FLOAT NOT NULL,
    is_sold INT(1) NOT NULL DEFAULT 0
    
    PRIMARY KEY (item_id),

    CONSTRAINT item_cats_icat_id FOREIGN KEY(item_cat) REFERENCES item_cats(icat_id) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT item_cat_status_icst_id FOREIGN KEY(item_cat_stat) REFERENCES item_cat_status(icst_id) 
    ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT item_users_user_id FOREIGN KEY(user) REFERENCES users(user_id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);

-- IMAGE
CREATE TABLE item_image(
    item_img_id INT(11) NOT NULL AUTO_INCREMENT,
    item_img_name VARCHAR(25) NOT NULL,
    item INT(11) NOT NULL,
    
    PRIMARY KEY (item_img_id),
    CONSTRAINT item_image_item_id FOREIGN KEY(item) REFERENCES items(item_id) 
    ON DELETE CASCADE ON UPDATE CASCADE
);



