use lab2;

CREATE TABLE Classroom (
    Building VARCHAR(15) NOT NULL,
    Room_number VARCHAR(7) NOT NULL,
    Capacity INT(4),
    PRIMARY KEY (Building, Room_number)
);
create table Department(
	Dept_name varchar(20) not null,
    Building  varchar(15),
    Budget Decimal(12, 2) check (Budget > 0),
    PRIMARY KEY (Dept_name, Building)
);

create table Course(
	Course_id varchar(8) not null primary key,
    Title varchar(50),
    Dept_name varchar(20),
    Credits Int(2) check (Credits > 0),
    FOREIGN KEY (Dept_name) REFERENCES Department(Dept_name) ON DELETE SET NULL
);

create table Instructor(
	ID varchar(5) not null primary key,
    Name varchar(20) not null,
    Dept_name varchar(20),
    Salary Decimal(8,2) check (Salary > 29000),
    FOREIGN KEY (Dept_name) REFERENCES Department(Dept_name) ON DELETE SET NULL
);

CREATE TABLE Section (
    Course_id VARCHAR(8) NOT NULL,
    Sec_id VARCHAR(8) NOT NULL,
    Semester VARCHAR(6) NOT NULL CHECK (Semester IN ('Fall', 'Winter', 'Spring', 'Summer')),
    Year INT(4) NOT NULL,
    Building VARCHAR(15),
    Room_number VARCHAR(7),
    Time_slot_id VARCHAR(4),
    PRIMARY KEY (Course_id, Sec_id, Semester, Year),
    FOREIGN KEY (Course_id) REFERENCES Course(Course_id) ON DELETE SET NULL,
    FOREIGN KEY (Building) REFERENCES Classroom(Building) ON DELETE SET NULL,
    FOREIGN KEY (Room_number) REFERENCES Classroom(Room_number) ON DELETE SET NULL
);
create Table Student(
	ID varchar(5) not null primary key,
	Name varchar(20) not null,
    Dept_name varchar(20),
    Tot_cred int(3) check(Tot_cred >=0),
    FOREIGN KEY (Dept_name) REFERENCES Department(Dept_name) ON DELETE SET NULL
);

CREATE TABLE Teaches (
    ID VARCHAR(5) NOT NULL,
    Course_id VARCHAR(8) NOT NULL,
    Sec_id VARCHAR(8) NOT NULL,
    Semester VARCHAR(6) NOT NULL,
    Year INT(4) NOT NULL,
    PRIMARY KEY (ID, Course_id, Sec_id, Semester, Year), -- Composite Primary Key
    FOREIGN KEY (ID) REFERENCES Instructor(ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_id, Sec_id, Semester, Year) 
        REFERENCES Section(Course_id, Sec_id, Semester, Year) ON DELETE CASCADE
);

CREATE TABLE Takes (
    ID VARCHAR(5) NOT NULL,
    Course_id VARCHAR(8) NOT NULL,
    Sec_id VARCHAR(8) NOT NULL,
    Semester VARCHAR(6) NOT NULL,
    Year INT(4) NOT NULL,
    Grade VARCHAR(2),
    PRIMARY KEY (ID, Course_id, Sec_id, Semester, Year), -- Composite Primary Key
    FOREIGN KEY (ID) REFERENCES Student(ID) ON DELETE CASCADE,
    FOREIGN KEY (Course_id, Sec_id, Semester, Year) 
        REFERENCES Section(Course_id, Sec_id, Semester, Year) ON DELETE CASCADE
);

create Table Advisor(
	S_ID varchar(5) not null primary key,
    I_ID varchar(5),
    FOREIGN KEY (S_ID) REFERENCES Student(ID) ON DELETE cascade,
    FOREIGN KEY (I_ID) REFERENCES Instructor(ID) ON DELETE SET NULL
);

create Table Time_slot(
	Time_slot_id Varchar(4) Not null,
	Day Varchar(1),
	Start_hr int(2),
	Start_min int(2),
	End_hr int(2),
	End_min int(2),
    primary key (Time_slot_id, Day, Start_hr, Start_min, End_hr, End_min)
);


CREATE TABLE Prereq (
    Course_ID VARCHAR(8) NOT NULL,
    Prereq_ID VARCHAR(8) NOT NULL,
    PRIMARY KEY (Course_ID, Prereq_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID) ON DELETE CASCADE,
    FOREIGN KEY (Prereq_ID) REFERENCES Course(Course_ID)
);

