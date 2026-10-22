1. Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

-- 2. Create Student table
CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(DepartmentID)
);

-- 3. Create Course table
CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

-- 4. Create Enrollment table
CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID)
        REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID)
        REFERENCES Course(CourseID)
);

-- 5. Insert sample values
INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'Mathematics'),
(3, 'Commerce');

INSERT INTO Student VALUES
(101, 'Arun', 1),
(102, 'Priya', 2),
(103, 'Kumar', 1),
(104, 'Divya', 3);

INSERT INTO Course VALUES
(201, 'Database Systems'),
(202, 'Mathematics'),
(203, 'Data Structures');

INSERT INTO Enrollment VALUES
(1, 101, 201),
(2, 102, 202),
(3, 103, 203),
(4, 104, 201);

-- 6. Create the view
CREATE VIEW StudentDetails AS
SELECT
    S.StudentName,
    C.CourseName,
    D.DepartmentName
FROM Student S
JOIN Enrollment E
    ON S.StudentID = E.StudentID
JOIN Course C
    ON E.CourseID = C.CourseID
JOIN Department D
    ON S.DepartmentID = D.DepartmentID;

-- 7. Display the view
SELECT * FROM StudentDetails;
