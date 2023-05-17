use hrb;
create table Employeers (
employeerid int primary key,
    -> organisationname varchar(40),
    -> address varchar(50),
    -> contactnumber int,
    -> emailid varchar(50)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> create table joblisting (
    -> jobid int primary key,
    -> employeerid int,
    -> jobdescription varchar(50),
    -> jobprofile varchar(50),
    -> joblocation varchar(50),
    -> jobseekerid int,
    -> constraint fk_emp foreign key(employeerid) references Employeers(employeerid),
    -> ^C
mysql> create table joblisting (
    -> jobid int primary key,
    -> employeerid int,
    -> jobdescription varchar(50),
    -> jobprofile varchar(50),
    -> joblocation varchar(50),
    -> jobseekerid int,
    -> constraint fk_emp foreign key(employeerid) references Employeers(employeerid)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> create tabel jobseeker(
    -> jobseekerid int primary key,
    -> name varchar(50),
    -> seekaddress varchar(50),
    -> phonenumber int,
    -> resumedetails varchar(50),
    -> skillid int
    -> );
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'tabel jobseeker(
jobseekerid int primary key,
name varchar(50),
seekaddress varc' at line 1
mysql> create table jobseeker(
    -> jobseekerid int primary key,
    -> name varchar(50),
    -> seekaddress varchar(50),
    -> phonenumber int,
    -> resumedetails varchar(50),
    -> skillid int
    -> );
Query OK, 0 rows affected (0.07 sec)

mysql> create table skills *
    -> ^C
mysql> create table skills (
    -> skillid int,
    -> ^C
mysql> create table skills (
    -> skillid int primary key,
    -> skillname varchar(50),
    -> skilllevel int
    -> );
Query OK, 0 rows affected (0.09 sec)

mysql> alter table jobseeker
    -> add constraint fk_skill foreign key(skillid) references skills(skillid);
Query OK, 0 rows affected (0.14 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table joblisting
    -> add constraint fk_jobseek foreign key(jobseekerid) references jobseeker(jobseekerid);
Query OK, 0 rows affected (0.27 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> create table interview (
    -> interviewid int primary key,
    -> interviewtime date,
    -> interviewdate date,
    -> jobid int,
    -> jobseekerid int,
    -> constraint fk_jobid foreign key(jobid) references joblisting(jobid),
    -> constraint fk_jobseek foreign key(jobseekerid) references jobseeker(jobseekerid)
    -> );
ERROR 1826 (HY000): Duplicate foreign key constraint name 'fk_jobseek'
mysql> create table interview (
    -> interviewid int primary key,
    -> interviewtime date,
    -> interviewdate date,
    -> jobid int,
    -> jobseekerid int,
    -> constraint fk_jobid foreign key(jobid) references joblisting(jobid),
    -> constraint fk_jobseek2 foreign key(jobseekerid) references jobseeker(jobseekerid)
    -> );
Query OK, 0 rows affected (0.11 sec)

mysql> create table application (
    -> applicationid int primary key,
    -> jobid int,
    -> applicationdate date,
    -> applicationstatus varchar(30),
    -> constraint fk_app foreign key(jobid) references joblisting(jobid)
    -> );
