--create table person 
create table PERSON(
driver_id int primary key,
name varchar(500),
address varchar(500));

--create table car
create table CAR(
regno int primary key,
model varchar(500),
purchase_year int);

--create table accident
create table ACCIDENT(
report_number int primary key,
accd_date date,
location varchar(500));

--create table owns
create table OWNS(
driver_id int ,
regno int);

--create table participated
create table PARTICIPATED(
driver_id int,
regno int,
report_number int ,
damage_amount int);

--creating the foreign keys for table OWNS
alter table OWNS
add constraint fk_regno
foreign key (regno)
REFERENCES CAR(regno);

alter table OWNS
add constraint fk_driver_id
foreign key (driver_id)
REFERENCES PERSON(driver_id);

--creating the foreign keys for table PARTICIPATED
alter table PARTICIPATED
add constraint fk_driver_id2
foreign key (driver_id)
REFERENCES PERSON(driver_id);

alter table PARTICIPATED
add constraint fk_regno2
foreign key (regno)
REFERENCES CAR(regno);

alter table PARTICIPATED
add constraint fk_report_number
foreign key (report_number)
REFERENCES ACCIDENT(report_number);

insert into PERSON VALUES (1,'JOHN','GOA');
insert into PERSON VALUES (2,'JACK','MAHA');
insert into PERSON VALUES (3,'JONES','KAR');
insert into PERSON VALUES (4,'JILL','DEL');
insert into PERSON VALUES (5,'JIMMY','HYD');

insert into CAR VALUES (121,'SUV',2005);
insert into CAR VALUES (122,'LUXURY',2006);
insert into CAR VALUES (123,'SUV',2007);
insert into CAR VALUES (124,'SPORTS',2008);
insert into CAR VALUES (125,'SPORTS',2009);

insert into OWNS VALUES (1,121);
insert into OWNS VALUES (2,122);
insert into OWNS VALUES (3,123);
insert into OWNS VALUES (4,124);
insert into OWNS VALUES (5,125);

insert into ACCIDENT VALUES (0001,SYSDATE,'GOA');
insert into ACCIDENT VALUES (0002,SYSDATE,'MAHA');
insert into ACCIDENT VALUES (0003,SYSDATE,'GUJ');
insert into ACCIDENT VALUES (0004,SYSDATE,'DEL');
insert into ACCIDENT VALUES (0005,SYSDATE,'KOL');

insert into PARTICIPATED VALUES (1,121,0001,1000);
insert into PARTICIPATED VALUES (2,122,0002,2000);
insert into PARTICIPATED VALUES (3,123,0003,3000);
insert into PARTICIPATED VALUES (4,124,0004,4000);
insert into PARTICIPATED VALUES (5,125,0005,5000);

select * from person;
select * from car;
select * from accident;
select * from owns;
select * from participated;
SELECT value
FROM nls_session_parameters
WHERE parameter = 'NLS_DATE_FORMAT';

--question 1 
alter session set
NLS_set_format='dd-mm-yyyy';

--question 2
SELECT driver_id, int
FROM primary key,
WHERE PERSON='PARTICIPATED';

--question 3 
SELECT person.name, person.address, car.regno, car.purchaseyear
FROM PERSON p
JOIN OWNS o ON person.driver_id = owns.driver_id
JOIN CAR c ON owns.regno = car.regno
ORDER BY c.purchaseyear DESC;

--question4
alter table person 
add nooface int;

--question5

--question6
SELECT COUNT(DISTINCT p.driver_id) AS'total_owners_involved'
FROM PERSON p,
JOIN OWNS o ON p.driver_id = o.driver_id,
JOIN PARTICIPATED pa ON p.driver_id = p.driver_id,
JOIN ACCIDENT a ON pa.report_number = a.report_number,
WHERE EXTRACT(YEAR FROM a.accident_date) = 2008;


