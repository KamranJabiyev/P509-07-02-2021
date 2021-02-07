CREATE DATABASE P509

DROP DATABASE P509

Use P509

CREATE TABLE Students(
	Id int,
	Name nvarchar(100),
	Surname nvarchar(100)
)

DROP TABLE Students

ALTER TABLE Students
ADD Email varchar(250),Age int

ALTER TABLE Students
DROP COLUMN Age

EXEC sp_rename Stu,Students

EXEC sp_rename 'Students.Email','Mail'

--CRUD
INSERT INTO Students 
VALUES(1,'Rufet','Zulfiqarov','r@code.az')



INSERT INTO Students 
VALUES(2,'Aqil','Beshirov','a@code.az'),
	  (3,'Kamran','Haciyev','k@code.az'),
	  (4,'Nigar','Kamran','n@code.az')

INSERT INTO Students (Id,Name)
VALUES(5,'Ilkin')

UPDATE Students SET Surname='Zulfiqarov'
WHERE Id=1

DELETE FROM Students 
Where Id=1

ALTER TABLE Students
ADD Age int

SELECT * FROM Students

UPDATE Students SET Age=18,Surname='Kamran'
WHERE Id=4

SELECT Name 'Ad',Surname 'Soyad' FROM Students
WHERE Age>=25

SELECT * FROM Students
--WHERE Mail LIKE '%code%'
--WHERE Age>=25 AND Name='Rufet'
--WHERE Age>=25 OR Name='Kamran'
--WHERE Age BETWEEN 23 AND 26
--WHERE Age<=26 AND Age>=23
--WHERE Id in(2,4,1)

SELECT COUNT(*) 'Student Count' FROM Students

SELECT CHARINDEX('@',Mail) FROM Students

SELECT SUBSTRING(Mail,1,3) FROM Students

SELECT SUBSTRING(Mail,1,CHARINDEX('@',Mail)-1) FROM Students

SELECT SUBSTRING(Mail,CHARINDEX('@',Mail)+1,LEN(Mail)) FROM Students

SELECT * FROM Students
WHERE Id=(SELECT Id FROM Students WHERE Mail='aads@mail.az')

SELECT AVG(Age) 'Average' FROM Students

SELECT MAX(Age) 'Max' FROM Students

SELECT MIN(Age) 'Min' FROM Students

SELECT * FROM Students
WHERE Age=(SELECT MIN(Age) FROM Students)

SELECT * FROM Students
WHERE Age<=(SELECT AVG(Age) FROM Students)

DROP TABLE Students

CREATE TABLE Students(
	Id int primary key identity,
	Name nvarchar(100) NOT NULL,
	Surname nvarchar(100),
	Email nvarchar(250) unique,
	Age int check(Age>=15)
)

INSERT INTO Students
VALUES('Kamran','Haciyev','k@code.az',23)

SELECT * FROM Students

INSERT INTO Students (Name,Email,Age)
VALUES('Agil','kadasf@code.az',6)

SELECT * FROM Students
WHERE Surname IS NULL

SELECT * FROM Students
WHERE Surname IS NOT NULL

