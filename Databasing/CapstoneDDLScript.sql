DO $$
DECLARE
    tabname RECORD;
BEGIN
    FOR tabname IN (
        SELECT tablename
        FROM pg_tables
        WHERE schemaname = 'public'
    ) LOOP
        EXECUTE 'DROP TABLE IF EXISTS public.'
            || quote_ident(tabname.tablename)
            || ' CASCADE';
    END LOOP;
END $$;



CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50) NOT NULL
);

CREATE TABLE AcademicTerm (
    TermID INT PRIMARY KEY,
    Semester VARCHAR(10),
    YearNum int
);

CREATE TABLE Professors (
    ProfessorID INT PRIMARY KEY,
    ProfessorName VARCHAR(50) NOT NULL ,
    ProfessorDepartment INT NOT NULL ,
    CurrentLevel VARCHAR(30),
    StartTermID INT,
    foreign key (ProfessorDepartment) references Department(DepartmentID),
    foreign key (StartTermID) references AcademicTerm(TermID)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50) NOT NULL,
    CourseCode VARCHAR(20) NOT NULL,
    CourseDescription VARCHAR(255) NOT NULL
);

CREATE TABLE Sections (
    SectionID INT PRIMARY KEY NOT NULL,
    SectionName VARCHAR(5) NOT NULL,
    CourseID INT NOT NULL,
    TermID  INT NOT NULL,
    MeetingDays VARCHAR(20),
    StartTime TIME,
    EndTime TIME,
    foreign key (TermID) references AcademicTerm(TermID),
    foreign key (CourseID) references Courses(CourseID)
);

CREATE TABLE Observations (
    ObservationID INT PRIMARY KEY,
    ObservationDate DATE,
    ObserverID INT NOT NULL,
    ObserveeID INT NOT NULL,
    ObservationTime TIME,
    foreign key (ObserverID) references Professors(ProfessorID),
    foreign key (ObserveeID) references Professors(ProfessorID)
);

CREATE TABLE TeachingAssignment (
    SectionID INT,
    ProfessorID INT,
    PRIMARY KEY (SectionID, ProfessorID),
    foreign key (SectionID) references Sections(SectionID),
    foreign key (ProfessorID) references Professors(ProfessorID)
);

CREATE TABLE EvaluationCycle (
    CycleID INT PRIMARY KEY,
    --To be worked on (connections included)
    TermID INT NOT NULL,
    SignUpDeadLine DATE,
    ObservationDeadLine DATE,
    FeedbackDeadLine DATE,
    foreign key (TermID) references AcademicTerm(TermID)
);

-- ObservationSignup
    -- SignupID
    -- CycleID
    -- ObserveeID
    -- SectionID

--ObserverRequest
    --RequestID
    --SignupID
    --ObserverID
    --RequestDateTime
    --ExpirationDateTime
    --Status
      --Pending
      --Accepted
      --Declined
      --Expired
      --Cancelled
-- ObservationTemplate
    -- Editable by Assessment Committee

-- ObservationTemplateVersion
    -- Preserve the version used for an observation
    -- Once an observation is signed, it cannot be edited

-- Completed Observation
    -- Cannot be edited