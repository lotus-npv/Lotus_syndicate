-- Active: 1709140861283@@45.252.251.108@3306@lotusocean_jp_app
drop database if exists lotusocean_jp_app;
create database lotusocean_jp_app default character set utf8 collate utf8_unicode_ci;
use lotusocean_jp_app;


-- tạo bảng thuc tap sinh
create table if not exists intern
(
    id int primary key auto_increment,
    firstName varchar(55),
    middleName varchar(55), 
    lastName varchar(55),
    username varchar(50) not null,  -- thong tin dang nhap he thong
    password_encode varchar(100) not null,
    dob datetime,  -- ngay sinh
    avata varchar(200), -- link avata
    avata_update_at datetime, -- ngay cap nhat avata
    dispatching_company_id int, -- cong ty phai cu
    receiving_factory_id int, -- xi nghep tiep nhan
    career_id int, -- nganh nghe
    address varchar(100), -- dia chi noi o ben Nhat
    passport_code varchar(50), 
    alien_card_number varchar(50),
    create_at datetime,
    create_by int,
    update_at datetime,
    update_by int,
    foreign key (dispatching_company_id) references dispatching_company (id),
    foreign key (receiving_factory_id) references receiving_factory (id),
    foreign key (career_id) references career (id)
);

-- tao bang danh sach cong ty phai cu
create table if not exists dispatching_company (
    id int primary key auto_increment,
    name varchar(50), -- ten cong ty
    nation varchar(50), -- quoc gia
    company_size varchar(50), -- quy mo cong ty
    contract_signing_date datetime, -- ngay ky hop dong
    post-entry_support BOOLEAN, -- ho tro sau nhap canh
    create_at datetime,
    creat_by int,
    update_at datetime,
    update_by int,
);


-- tao bang danh sach cong ty tiep nhan
create table if not exists receiving_factory (
    id int primary key auto_increment,
    name varchar(50),
    nation varchar(50), -- quoc gia
    date_of_joining_syndication datetime, -- ngay tham gia nghiep doan
    representative int, -- nguoi dai dien
    employee_in_charge_of_the_job int, -- nhân viên phụ trách công việc
    employee_in_charge_of_lifestyle int, -- nhân viên phụ trách đời sống
    address varchar(100),
    phone_number varchar(20),
    career_id int, -- nganh nghe chuyen
    create_at datetime,
    creat_by int,
    update_at datetime,
    update_by int,
    foreign key (representative) references users (id),
    foreign key (employee_in_charge_of_the_job) references users (id),
    foreign key (employee_in_charge_of_lifestyle) references users (id)
);

-- tao bang cho danh sach nganh nghe
create table if not exists career (
    id int primary key auto_increment,
    name varchar(50) not null, -- ten nganh nghe
    description varchar(50), -- mo ta nganh nghe
    create_at datetime,
    creat_by int,
    update_at datetime,
    update_by int,
    delete_at datetime
);


-- tao bang phan quyen
create table if not exists roles (
    id int primary key auto_increment,
    name varchar(50),
    description varchar(50),
    create_at datetime,
    creat_by int,
    update_at datetime,
    update_by int,
);

-- tao bang danh sach cac doi tuong nguoi dung
create table if not exists users_type (
    id int primary key auto_increment,
    name varchar(20), -- phan loai TTS, Nghiep doan, Cong ty phai cu, xi nghiep tiep nhan
    create_at datetime,
    creat_by int,
    update_at datetime,
    update_by int
);

-- tao bang người dùng (chưa ok)
create table if not exists users (
    id int primary key auto_increment,
    username varchar(20),
    password_encode varchar(100),
    users_type_id int, -- phan loai Nghiep doan, Cong ty phai cu, xi nghiep tiep nhan
    company_name int, -- có thể là tên nghiệp đoàn, công ty phái cử, công ty tiêp nhận
    position varchar(100), -- chức vụ
    phone_number varchar(20),
    email varchar(50),
    create_at datetime,
    creat_by int,
    update_at datetime,
    update_by int,
    foreign key (users_type_id) references users_type (id)
);

-- tao bang phan quyen người dùng
create table if not exists permission  (
    id int primary key auto_increment,
    users_type_id int, -- doi tuong nguoi dung
    can_create BOOLEAN NOT NULL DEFAULT false,
    can_read BOOLEAN NOT NULL DEFAULT false,
    can_update BOOLEAN NOT NULL DEFAULT false,
    can_delete BOOLEAN NOT NULL DEFAULT false,
    create_at datetime,
    creat_by int,
    update_at datetime,
    update_by int,
);







