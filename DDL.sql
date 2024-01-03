create database AcademyDB


create table Curators 
(
     Id int identity(1,1) primary key not null,
	 [Name] nvarchar(MAX) not null default('None'),
	 [Surname] nvarchar(MAX) not null default('None'),
)

create table Faculties
(
	Id int identity(1,1) primary key not null,
	Financing money not null check (Financing >= 0) default(0),
	[Name] nvarchar(100) not null default('None') unique,
)

create table Departments
(
	Id int identity(1,1) primary key not null,
	Financing money not null check (Financing >= 0) default(0),
	[Name] nvarchar(100) not null default('None') unique,
	FacultyId int not null  foreign key references [Faculties](Id)
)

create table Groups
(
	Id int identity(1,1) primary key not null,
	[Name] nvarchar(10) not null default('None') unique,
	[Year] int check([Year] >=1 and [Year] <=5) not null,
	[DepartmentId] int not null foreign key references [Departments](Id) 
)


create table GroupsCurators
(
	Id int identity(1,1) primary key not null,
	CuratorId int not null foreign key references [Curators](Id),
	GroupId int not null foreign key references [Groups](Id)
)


create table Subjects
(
	Id int identity(1,1) primary key not null,
	[Name] nvarchar(100) not null default('None') unique,
)

create table Teachers
(
	Id int identity(1,1) primary key not null,
	[Name] nvarchar(MAX) not null default('None'),
	Salary money  not null check (Salary > 0),
	[Surname] nvarchar(MAX) not null default('None'),
)



create table Lectures
(
	Id int identity(1,1) primary key not null,
	LectureRoom nvarchar(MAX) not null default('None'),
	SubjectId int not null foreign key references [Subjects](Id),
	TeacherId int not null foreign key references [Teachers](Id)
)



create table GroupsLectures
(
	Id int identity(1,1) primary key not null,
	GroupId int not null foreign key references [Groups](Id),
	LectureId int not null foreign key references [Lectures](Id)
)


