
create database [med]
go

USE [med]
go


-- Вставка даних в таблицю Departments
INSERT INTO Departments (Building, Financing, Name)
VALUES
	(5, 30000, 'Eye Examination'),
    (1, 10000, 'Ophthalmology'),
    (2, 15000, 'Physiotherapy'),
    (3, 25000, 'Cardiology'),
    (4, 18000, 'Neurology'),
    (5, 30000, 'Oncology');

-- Вставка даних в таблицю Diseases
INSERT INTO Diseases (Name)
VALUES
    ('Flu'),
    ('Asthma'),
    ('Diabetes'),
    ('Hypertension'),
    ('Cancer'),
    ('Arthritis'),
    ('Migraine');

-- Вставка даних в таблицю Doctors
INSERT INTO Doctors (Name, Salary, Surname)
VALUES
    ('John', 5000, 'Smith'),
    ('Emily', 5500, 'Johnson'),
    ('Michael', 6000, 'Williams'),
    ('Jessica', 5200, 'Brown'),
    ('Daniel', 5800, 'Jones'),
	('Daniel', 5800, 'Smith');

-- Вставка даних в таблицю Examinations
INSERT INTO Examinations (Name)
VALUES
	('GRVI'),
    ('MRI'),
    ('X-Ray'),
    ('Blood Test'),
    ('Ultrasound'),
    ('Endoscopy');

-- Вставка даних в таблицю Inters
INSERT INTO Inters (DoctorId)
VALUES
    (1),
    (2),
    (3);

-- Вставка даних в таблицю Professors
INSERT INTO Professors (DoctorId)
VALUES
    (4),
    (5);

-- Вставка даних в таблицю Wards
INSERT INTO Wards (Name, Places, DepartmentId)
VALUES
	('Ward9', 20, 5),
    ('Ward8', 15, 2),
    ('Ward7', 25, 3),
    ('Ward6', 18, 4),
    ('Ward1', 20, 1),
    ('Ward2', 15, 2),
    ('Ward3', 25, 3),
    ('Ward4', 18, 4),
    ('Ward5', 30, 5);

-- Вставка даних в таблицю DoctorsExaminations
INSERT INTO DoctorsExaminations (DiseaseId, DoctorId, ExaminationId, WardId)
VALUES
    (1, 1, 3, 1),
    (2, 2, 1, 2),
    (3, 3, 2, 3),
    (4, 4, 4, 4),
    (5, 5, 5, 5);
