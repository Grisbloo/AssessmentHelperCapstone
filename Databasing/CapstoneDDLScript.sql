CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    ProfessorName VARCHAR(50),
    ProfessorDepartment INT,
    --ProfessorRank fulltime/assistant
    --EvaluationCycle every year/ every 2 years
    foreign key (ProfessorDepartment) references Department
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    ProfessorID INT,
    CourseDescription VARCHAR(255) NOT NULL,
    foreign key (ProfessorID) references Professors
);

CREATE TABLE Sections (
    SectionID INT PRIMARY KEY,
    SectionName VARCHAR(5),
    CourseID INT,
    ProfessorID INT,
    Semester VARCHAR(50),
    Yearnumber  INT,
    foreign key (CourseID) references Courses,
    foreign key (ProfessorID) references Professors
);

CREATE TABLE Observations (
    ObservationID INT PRIMARY KEY,
    ObservationDate DATE,
    --Probably more needs to be added to this
    ObservationTime TIME
);