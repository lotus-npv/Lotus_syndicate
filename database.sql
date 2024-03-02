-- Active: 1709140861283@@45.252.251.108@3306@lotusocean_jp_app
drop database if exists lotusocean_jp_app;
create database lotusocean_jp_app default character set utf8 collate utf8_unicode_ci;
use lotusocean_jp_app;

-- tao bang danh sach cac doi tuong nguoi dung
-- create table if not exists users_type (
--     id int primary key auto_increment,
--     syndication_id INT,
--     name VARCHAR(50),
--     description VARCHAR(200),
--     create_at DATETIME,
--     create_by INT,
--     update_at DATETIME,
--     update_by INT,
--     delete_at DATETIME,
--     flag BOOLEAN,
--     foreign key (syndication_id) references syndication(id)
-- );


create table if not exists alien_registration_card (
    id int primary key auto_increment,
    syndication_id INT,
    intern_id INT,
    card_number VARCHAR(50),
    status_of_residence_id INT,
    license_date DATETIME,
    expiration_date DATETIME,
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id),
    foreign key (intern_id) references intern(id)
);

-- tạo bảng thuc tap sinh
create table if not exists intern
(
    id int primary key auto_increment,
    syndication_id int,
    avata VARCHAR(100),
    avata_update_at DATETIME,
    firstName VARCHAR(20),
    middleName VARCHAR(20),
    lastName VARCHAR(20),
    gender VARCHAR(20),
    dob DATETIME,
    career_id INT,
    passport_code VARCHAR(50),
    passport_license_date DATETIME,
    passport_expiration_date DATETIME,
    status_id INT,
    alert BOOLEAN,
    phone_domestically VARCHAR(20),
    phone_abroad VARCHAR(20),
    receiving_factory_id INT,
    dispatching_company_id INT,
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id),
    foreign key (dispatching_company_id) references dispatching_company(id),
    foreign key (receiving_factory_id) references receiving_factory(id),
    foreign key (career_id) references career(id),
    foreign key (status_id) references status(id)
);

-- tao bang nhan vien
create table if not exists employee (
    id int primary key auto_increment,
    syndication_id INT,
    firstName VARCHAR(20),
    middleName VARCHAR(20),
    lastName VARCHAR(20),
    gender VARCHAR(10),
    dob DATE,
    avata VARCHAR(200),
    user_type ENUM('syndication','receiving_factory','dispatching_company','intern'),
    office_id INT, -- (id nơi làm việc)
    address_id INT,
    positions_id INT,
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id),
    foreign key (address_id) references address(id),
    foreign key (positions_id) references positions(id)
);

-- tao bang danh sach cong ty tiep nhan
create table if not exists receiving_factory (
    id int primary key auto_increment,
    syndication_id INT,
    logo VARCHAR(100),
    name VARCHAR(50),
    tax_code VARCHAR(50),
    date_of_joining_syndication DATETIME,
    address_id INT,
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id)
);

-- tao bang danh sach cong ty phai cu
create table if not exists dispatching_company (
    id int primary key auto_increment,
    syndication_id INT,
    logo VARCHAR(100),
    name VARCHAR(50),
    tax_code VARCHAR(50),
    date_of_joining_syndication DATETIME,
    address_id INT,
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id)
);

create table if not exists address (
    id int primary key auto_increment,
    syndication_id INT,
    user_type ENUM('syndication','receiving_factory','dispatching_company','intern'),
    object_id INT,  -- có thể là id của tts, công ty phái cử, xí nghiệp .
    nation_id INT,
    province_id INT,
    district_id INT,
    commune_id INT,
    detail VARCHAR(200),
    phone_number VARCHAR(20),
    email VARCHAR(50),
    fax VARCHAR(50),
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id)
);

-- tao bang cho danh sach nganh nghe
create table if not exists career (
    id int primary key auto_increment,
    syndication_id INT,
    name VARCHAR(50),
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id)
);

create table if not exists ticket_detail (
    id int primary key auto_increment,
    syndication_id INT,
    ticket_id INT,
    send_date DATETIME,
    content VARCHAR(1000),
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id),
    foreign key (ticket_id) references ticket(id)
);

create table if not exists ticket (
    id int primary key auto_increment,
    syndication_id INT,
    send_date DATETIME,
    title VARCHAR(100),
    sender_id INT,
    receiver_id INT,
    priority ENUM('Low', 'Medium', 'High'),
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id),
    foreign key (sender_id) references users(id),
    foreign key (receiver_id) references users(id)
);

create table if not exists status_of_residence (
    id int primary key auto_increment,
    syndication_id INT,
    name VARCHAR(50),
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id)
);

create table if not exists status (
    id int primary key auto_increment,
    syndication_id INT,
    name VARCHAR(50),
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id)
);

create table if not exists positions (
    id int primary key auto_increment,
    syndication_id INT,
    name varchar(50),
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id)
);

-- tao bang phan quyen
create table if not exists permission (
    id int primary key auto_increment,
    syndication_id INT,
    user_type ENUM('syndication','receiving_factory','dispatching_company','intern'),
    can_read BOOLEAN,
    can_edit BOOLEAN,
    can_delete BOOLEAN,
    can_create BOOLEAN,
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id)
);


-- tao bang người dùng 
create table if not exists users (
    id int primary key auto_increment,
    syndication_id INT,
    user_type ENUM('syndication','receiving_factory','dispatching_company','intern'),
    object_id INT,
    username VARCHAR(50),
    password_hash VARCHAR(100),
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN,
    foreign key (syndication_id) references syndication(id)
);

-- tao bang phan quyen người dùng
create table if not exists syndication  (
    id int primary key auto_increment,
    name VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(50),
    active BOOLEAN,
    description VARCHAR(200),
    create_at DATETIME,
    create_by INT,
    update_at DATETIME,
    update_by INT,
    delete_at DATETIME,
    flag BOOLEAN
);







