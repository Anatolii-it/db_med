
create database [med]
go

USE [med]
go


SELECT Name, Places
FROM Wards
WHERE DepartmentId IN (
    SELECT Id
    FROM Departments
    WHERE Building = 5
) AND Places >= 5 AND EXISTS (
    SELECT 1
    FROM Wards
    WHERE DepartmentId IN (
        SELECT Id
        FROM Departments
        WHERE Building = 5
    ) AND Places > 15
);
--2 завдання :
SELECT DISTINCT Departments.Name
FROM Departments
JOIN Wards ON Departments.Id = Wards.DepartmentId
JOIN DoctorsExaminations ON Wards.Id = DoctorsExaminations.WardId
WHERE DoctorsExaminations.Date >= DATEADD(WEEK, -1, GETDATE());

--3 завдання :
SELECT Diseases.Name AS DiseaseName
FROM Diseases
LEFT JOIN DoctorsExaminations ON Diseases.Id = DoctorsExaminations.DiseaseId
WHERE DoctorsExaminations.Id IS NULL;

--4 завдання :
SELECT Doctors.Name + ' ' + Doctors.Surname AS FullDoctorName
FROM Doctors
LEFT JOIN DoctorsExaminations ON Doctors.Id = DoctorsExaminations.DoctorId
WHERE DoctorsExaminations.Id IS NULL;

--5  завдання :
SELECT Name AS DepartmentName
FROM Departments
WHERE NOT EXISTS (
    SELECT 1
    FROM Wards
    INNER JOIN DoctorsExaminations ON Wards.Id = DoctorsExaminations.WardId
    WHERE Wards.DepartmentId = Departments.Id
);

--6  завдання :
SELECT Doctors.Surname
FROM Doctors
INNER JOIN Inters ON Doctors.Id = Inters.DoctorId;

--7  завдання :
SELECT DISTINCT Doctors.Surname
FROM Inters
INNER JOIN Doctors ON Inters.DoctorId = Doctors.Id
WHERE Inters.DoctorId IN (
    SELECT DoctorId
    FROM Inters
    WHERE Salary > (SELECT MIN(Salary) FROM Doctors)
);

--8  завдання :
SELECT Name
FROM Wards
WHERE Places > (
    SELECT MAX(Places)
    FROM Wards
    WHERE DepartmentId IN (
        SELECT Id
        FROM Departments
        WHERE Building = 3
    )
);

--9  завдання :
SELECT DISTINCT Doctors.Surname
FROM Doctors
INNER JOIN DoctorsExaminations ON Doctors.Id = DoctorsExaminations.DoctorId
INNER JOIN Wards ON DoctorsExaminations.WardId = Wards.Id
INNER JOIN Departments ON Wards.DepartmentId = Departments.Id
WHERE Departments.Name IN ('Ophthalmology', 'Physiotherapy');

--10  завдання :
SELECT DISTINCT Departments.Name
FROM Departments
INNER JOIN Inters ON Departments.Id = (SELECT DepartmentId FROM Wards WHERE Wards.Id = Inters.Id)
UNION
SELECT DISTINCT Departments.Name
FROM Departments
INNER JOIN Professors ON Departments.Id = (SELECT DepartmentId FROM Wards WHERE Wards.Id = Professors.Id);

--11  завдання :
SELECT DISTINCT Doctors.Name + ' ' + Doctors.Surname AS FullDoctorName, Departments.Name AS DepartmentName
FROM Doctors
INNER JOIN DoctorsExaminations ON Doctors.Id = DoctorsExaminations.DoctorId
INNER JOIN Wards ON DoctorsExaminations.WardId = Wards.Id
INNER JOIN Departments ON Wards.DepartmentId = Departments.Id
WHERE Departments.Financing > 20000;

--12  завдання :
SELECT DISTINCT Departments.Name AS DepartmentName
FROM Departments
JOIN Wards ON Departments.Id = Wards.DepartmentId
JOIN DoctorsExaminations ON Wards.Id = DoctorsExaminations.WardId
JOIN Doctors ON DoctorsExaminations.DoctorId = Doctors.Id
WHERE Doctors.Salary = (SELECT MAX(Salary) FROM Doctors);



--13  завдання :
SELECT Diseases.Name AS DiseaseName, COUNT(*) AS ExaminationCount
FROM Diseases
INNER JOIN DoctorsExaminations ON Diseases.Id = DoctorsExaminations.DiseaseId
GROUP BY Diseases.Name;
