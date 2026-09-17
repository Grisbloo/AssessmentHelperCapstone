CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    ProfessorName VARCHAR(50),
    ProfessorDepartment INT,
    foreign key (ProfessorDepartment) references Department
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    ProfessorID INT,
    CourseDescription VARCHAR(255) NOT NULL,
    foreign key (ProfessorID) references Professors
);