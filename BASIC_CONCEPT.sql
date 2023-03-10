CREATE DATABASE BASIC_CONCEPT;
USE BASIC_CONCEPT;

-- WHAT IS A RDBMS ?
/*
1)	RDBMS stands for Relational Database Management System.
2)	RDBMS is a program used to maintain a relational database.
3)	RDBMS is the basis for all modern database systems such as 
4)	MySQL, Microsoft SQL Server, Oracle, and Microsoft Access. 
5)	RDBMS uses SQL queries to access the data in the database.
*/

-- SQL COMMANDS : DDL , DML , DCL , TCL , DQL
/*
DDL : CREATE , ALTER , DROP , TRUNCATE
DML : INSERT , UPDATE , DELETE
DCL : GRANT , REVOKE
TCL : COMMIT , ROLLBACK , SAVEPOINT
DQL : SELECT
*/

-- CREATE - DDL :
-- CREATING EMP_INFO TABLE (TRANSACTION TABLE):
CREATE TABLE EMP_INFO(
SNO INT UNIQUE AUTO_INCREMENT,
EMP_ID VARCHAR(20)  PRIMARY KEY,
EMP_NAME VARCHAR(20) NOT NULL,
AGE INT CHECK(AGE >=15),
NATIONALITY VARCHAR(20) DEFAULT('INDIAN'),
EMP_CITY_ID INT,
EMP_DEPT_ID INT,
FOREIGN KEY(EMP_CITY_ID) REFERENCES CITY(CITY_ID),
FOREIGN KEY(EMP_DEPT_ID) REFERENCES DEPT(DEPT_ID)
);
-- CREATING CITY TABLE (MASTER TABLE):
CREATE TABLE CITY(
CITY_ID INT PRIMARY KEY,
CITY_NAME VARCHAR(20)
);
-- CREATING DEPT TABLE (MASTER TABLE):
CREATE TABLE DEPT(
DEPT_ID INT PRIMARY KEY,
DEPT_NAME VARCHAR(20)
);

-- ALTER - DDL:
ALTER TABLE EMP_INFO MODIFY EMP_ID VARCHAR(20);

-- DROP - DDL:
DROP TABLE EMP_INFO;

-- TRUNCATE - DDL:
TRUNCATE TABLE EMP_INFO;

-- -----------------------------------

-- INSERT - DML :
INSERT INTO EMP_INFO(EMP_ID,EMP_NAME,AGE,EMP_CITY_ID,EMP_DEPT_ID) VALUES
('E0000001','ASHURA',20,1,6),
('E0000002','INDRA',22,1,5),
('E0000003','MADARA',30,3,4),
('E0000004','HASURAMA SENJU',28,3,2),
('E0000005','KAKASHI',25,7,4),
('E0000006','OBITO',24,7,5),
('E0000007','ITACHI',22,6,6),
('E0000008','MIGHT GUY',25,6,2),
('E0000009','GARA',19,3,2),
('E0000010','KONOHAMARU',15,3,1),
('E0000011','NEJI',18,3,3),
('E0000012','ROCK LEE',18,3,4),
('E0000013','NARUTO',18,3,5),
('E0000014','HINATA',18,3,6),
('E0000015','RIN',24,7,6),
('E0000016','SASUKE',18,4,5),
('E0000017','SAKURA',18,4,6),
('E0000018','JIRAIYA',38,2,6),
('E0000019','ORACHIMARU',37,2,5),
('E0000020','TSUNADE',37,2,4),
('E0000021','YAHIKO',27,5,6),
('E0000022','NAGATO',26,5,5),
('E0000023','KONAN',26,5,4);

INSERT INTO CITY(CITY_ID,CITY_NAME) VALUES
(1,'CHENNAI'),(2,'BANGALORE'),(3,'HYDERBAD'),(4,'PUNE'),(5,'MUMBAI'),(6,'KOLKATA'),(7,'DELHI');

INSERT INTO DEPT(DEPT_ID , DEPT_NAME) VALUES
(1,'WEB_DESIGNER'),(2,'FRONT-END_DEVELOPER'),(3,'BACK-END_DEVELOPER'),(4,'SQL_DEVELOPER'),(5,'DEVOPS_DEVELOPER'),(6,'FULL-STACK_DEVELOPER');

-- UPDATE - DML :
-- DELETE - DML :
-- -----------------------------------
-- SELECT - DQL :
SELECT * FROM EMP_INFO;
SELECT * FROM CITY;
SELECT * FROM DEPT;
-- _______________________________________________________________________________________________________________

-- DATA TYPES
/*
INT* / NUMBER
VARCHAR()* , CHAR() , STRING , TEXT,
FLOAT,
BOOLEAN,
DATE*,
*/
-- _______________________________________________________________________________________________________________

-- CONSTRAINTS 
/*
NOT NULL,
PRIMARY KEY,
FOREIGN KEY,
UNIQUE,
CHECK, 
DEFAULT
*/

-- _______________________________________________________________________________________________________________

-- NORMALIZATION IN SQL
-- _______________________________________________________________________________________________________________

-- OPERATORS
/*
1) ARITHMETIC OPERATORS : + , - , * , / , %
2) BITWISE OPERATORS : & , | , ^
3) COMPARISON OPERATORS : = , > , < , >= , <= , <>
4) COMPOUND OPERATORS : += , -= , *= , /= , %= , &= , ^-= , |*=
5) LOGICAL OPERATORS : ALL , AND , ANY , BETWEEN , EXISTS , IN , LIKE , NOT , OR , SOME  
*/
-- _______________________________________________________________________________________________________________

-- CASE STATEMENT
SELECT A.SNO, A.EMP_ID, A.EMP_NAME, A.AGE, A.NATIONALITY, B.CITY_NAME, C.DEPT_NAME, CASE
WHEN C.DEPT_NAME = 'WEB_DESIGNER' THEN 'WD'
WHEN C.DEPT_NAME = 'FRONT-END_DEVELOPER' THEN 'FED'
WHEN C.DEPT_NAME = 'BACK-END_DEVELOPER' THEN 'BED'
WHEN C.DEPT_NAME = 'SQL_DEVELOPER' THEN 'DB/SQL'
WHEN C.DEPT_NAME = 'DEVOPS_DEVELOPER' THEN 'DEVOPS'
WHEN C.DEPT_NAME = 'FULL-STACK_DEVELOPER' THEN 'FSD'
END AS EMP_DEPT
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID 
ORDER BY A.EMP_ID;

-- _______________________________________________________________________________________________________________

-- IMPORTANT SQL CLAUSE

-- 1) WHERE CLAUSE :
SELECT A.SNO, A.EMP_ID, A.EMP_NAME, A.AGE, A.NATIONALITY, B.CITY_NAME, C.DEPT_NAME
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID
WHERE B.CITY_NAME = 'KOLKATA';

-- 2) LIKE CLAUSE :
SELECT A.SNO, A.EMP_ID, A.EMP_NAME, A.AGE, A.NATIONALITY, B.CITY_NAME, C.DEPT_NAME
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID
WHERE A.EMP_NAME LIKE '%SENJU%';

-- 3) ORDER-BY CLAUSE :
SELECT A.SNO, A.EMP_ID, A.EMP_NAME, A.AGE, A.NATIONALITY, B.CITY_NAME, C.DEPT_NAME
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID 
ORDER BY A.EMP_ID;

-- 4) GROUP-BY CLAUSE :
SELECT B.CITY_NAME, COUNT(*) AS 'TOTAL_EMP'-- A.SNO, A.EMP_ID, A.EMP_NAME, A.AGE, A.NATIONALITY, B.CITY_NAME, C.DEPT_NAME
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID
GROUP BY B.CITY_NAME ORDER BY COUNT(*) DESC;

-- 5) LIMIT CLAUSE :
SELECT A.SNO, A.EMP_ID, A.EMP_NAME, A.AGE, A.NATIONALITY, B.CITY_NAME, C.DEPT_NAME
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID
ORDER BY A.EMP_ID 
LIMIT 3;

-- 6) AND AND OR CLAUSE :
SELECT A.SNO, A.EMP_ID, A.EMP_NAME, A.AGE, A.NATIONALITY, B.CITY_NAME, C.DEPT_NAME
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID
WHERE A.EMP_NAME LIKE 'NAR%' AND  A.EMP_NAME LIKE '%TO' OR   A.EMP_NAME LIKE 'HI%';
-- _______________________________________________________________________________________________________________

-- INNER JOIN
SELECT A.SNO, A.EMP_ID, A.EMP_NAME, A.AGE, A.NATIONALITY, B.CITY_NAME, C.DEPT_NAME
FROM EMP_INFO A
INNER JOIN CITY B ON A.EMP_CITY_ID = B.CITY_ID
INNER JOIN DEPT C ON A.EMP_DEPT_ID = C.DEPT_ID;
-- _______________________________________________________________________________________________________________