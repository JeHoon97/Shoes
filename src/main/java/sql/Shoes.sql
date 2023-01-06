-- 관리자 --
create table shoes_admin(
    id varchar2(20) not null,
    password varchar2(20) not null,
    name varchar2(20) not null,
    email varchar2(30) not null
);

insert into shoes_admin values('test', 'test', '허제훈', 'test@gmail.com');
select * from shoes_admin;
commit;

-- 카테고리 --
create table category(
    cat_num number(5) primary key,
    code varchar2(10) not null,
    cat_name varchar2(20) not null
);

create sequence cat_seq;

select * from category;

-- 상품등록 --
create table product(
    pNum number(10) primary key,
    pName varchar2(50) not null,
    pCategory_fk varchar2(30) not null,
    pCompany varchar2(50),
    pImage varchar2(50),
    pQty number(5) default 0,
    price number(10) default 0,
    pSpec varchar2(20),
    pContent varchar2(300),
    pPoint number(8) default 0,
    pInputDate date
);

create sequence prod_seq
minvalue 0
increment by 1
start with 0
nocache;

-- 회원 --
create table shoesMember(
    id varchar2(20) not null,
    pw varchar2(20) not null,
    name varchar2(20) not null,
    tel varchar2(20) not null,
    email varchar2(50) not null,
    addr varchar2(100) not null,
    rdate timestamp not null
);