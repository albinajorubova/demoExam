create  database Ювелир;
use Ювелир;
create table rolee(
role_id INT PRIMARY KEY AUTO_INCREMENT, 
role_name VARCHAR(100) NOT NULL
);

create table material(
material_id INT PRIMARY KEY AUTO_INCREMENT, 
material_name VARCHAR(100) NOT NULL
);

create table kind(
kind_id INT PRIMARY KEY AUTO_INCREMENT, 
kind_name VARCHAR(100) NOT NULL
);

create table manufacturer(
manufacturer_id INT PRIMARY KEY AUTO_INCREMENT, 
manufacturer_name VARCHAR(100) NOT NULL,
manufacturer_phone VARCHAR(20)  NOT NULL,
manufacturer_adress VARCHAR(100) NOT NULL
);

create table userr(
userr_id INT PRIMARY KEY AUTO_INCREMENT, 
userr_name VARCHAR(100) NOT NULL,
userr_phone VARCHAR(20)  NOT NULL,
userr_surname VARCHAR(100) NOT NULL,
userr_patronymic VARCHAR(100) NOT NULL,
manufacturer_adress VARCHAR(100) NOT NULL,
id_role INT NOT NULL,
FOREIGN KEY (id_role) REFERENCES rolee (role_id)   
);

create table product(
product_id INT PRIMARY KEY AUTO_INCREMENT, 
product_name VARCHAR(100) NOT NULL,
product_quantity INT  NOT NULL,
product_price INT NOT NULL,
product_description VARCHAR(200) NOT NULL,
product_photo VARCHAR(255) NOT NULL,
id_kind INT NOT NULL,
FOREIGN KEY (id_kind) REFERENCES kind (kind_id),
id_material INT NOT NULL,
FOREIGN KEY (id_material) REFERENCES material (material_id),
id_manufacturer INT NOT NULL,
FOREIGN KEY (id_manufacturer) REFERENCES manufacturer (manufacturer_id)
);

create table ord(
ordr_id INT PRIMARY KEY AUTO_INCREMENT, 
manufacturer_datetime DATETIME NOT NULL,
id_userr INT NOT NULL,
FOREIGN KEY (id_userr) REFERENCES userr (userr_id)
);

create table descrition(
descrition_id INT PRIMARY KEY AUTO_INCREMENT, 
descrition_quantity INT  NOT NULL,
id_product INT NOT NULL,
FOREIGN KEY (id_product) REFERENCES product (product_id)
);

ALTER TABLE descrition
ADD COLUMN id_order INT NOT NULL,
ADD FOREIGN KEY (id_order) REFERENCES ord (ordr_id);

