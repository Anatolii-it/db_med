
create database [med]
go

USE [med]
go


--1 Відділення (Departments)
CREATE TABLE Departments (
    Id INT PRIMARY KEY IDENTITY,
    Building INT NOT NULL CHECK (Building BETWEEN 1 AND 5),
    Financing MONEY NOT NULL DEFAULT 0 CHECK (Financing >= 0),
    Name NVARCHAR(100) NOT NULL UNIQUE
);

--2 Захворювання (Diseases)
CREATE TABLE Diseases (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);

--3 Лікарі (Doctors)
CREATE TABLE Doctors (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(MAX) NOT NULL,
    Salary MONEY NOT NULL CHECK (Salary > 0),
    Surname NVARCHAR(MAX) NOT NULL
);

--4 Обстеження (Examinations)
CREATE TABLE Examinations (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(100) NOT NULL UNIQUE
);

--5 Інтерни (Inters)
CREATE TABLE Inters (
    Id INT PRIMARY KEY IDENTITY,
    DoctorId INT NOT NULL,
    FOREIGN KEY (DoctorId) REFERENCES Doctors(Id)
);

--6 Професори (Professors)
CREATE TABLE Professors (
    Id INT PRIMARY KEY IDENTITY,
    DoctorId INT NOT NULL,
    FOREIGN KEY (DoctorId) REFERENCES Doctors(Id)
);

--7 Палати (Wards)
CREATE TABLE Wards (
    Id INT PRIMARY KEY IDENTITY,
    Name NVARCHAR(20) NOT NULL UNIQUE,
    Places INT NOT NULL CHECK (Places >= 1),
    DepartmentId INT NOT NULL,
    FOREIGN KEY (DepartmentId) REFERENCES Departments(Id)
);

--8 Лікарі та обстеження (DoctorsExaminations)
CREATE TABLE DoctorsExaminations (
    Id INT PRIMARY KEY IDENTITY,
    Date DATE NOT NULL DEFAULT GETDATE(),
    DiseaseId INT NOT NULL,
    DoctorId INT NOT NULL,
    ExaminationId INT NOT NULL,
    WardId INT NOT NULL,
    FOREIGN KEY (DiseaseId) REFERENCES Diseases(Id),
    FOREIGN KEY (DoctorId) REFERENCES Doctors(Id),
    FOREIGN KEY (ExaminationId) REFERENCES Examinations(Id),
    FOREIGN KEY (WardId) REFERENCES Wards(Id)
);
