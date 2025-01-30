use lab4;

INSERT INTO classroom (Building,Room_Number,Capacity) 
VALUES("Computing",1, 96),	("Computing",2, 24),
	("Computing",5, 50),("Computing",101, 40),
	("Engineering",101, 36);


INSERT INTO department (Dept_name,Building,Budget)
VALUES("Computer Science", "Computing", classroom70000),
("Software Engineering", "Computing", 70000),
("Computer Engineering", "Computing", 35000),
("Data Science", "Computing", 35000),
("Civil Engineering", "Engineering", 35000);


-- Insert your own data into the student table. Use the rightmost 5 digits of your 
-- student ID. Also, for the name column, use your first and last name only. 

INSERT INTO student 
VALUES("07186", "Omar Alpjaly", "Software Engineering", 66);

-- In the Classroom table, update the capacity of the (Computing+101) classroom to 46 seats.

UPDATE classroom
SET Capacity = 46
WHERE Building = "Computing" AND Room_Number="101";

--  In the Department table, increase the budget of department with 35000 SAR by 5000

UPDATE department
SET Budget = Budget+5000
WHERE Budget = 35000;


-- In the classroom table, delete the (Computing + 2) classroom.
DELETE FROM classroom
WHERE Building = "Computing" AND Room_Number="2";

-- In the department table, delete your own department. What changes occur to 
-- your record in the student table? 

DELETE FROM department
WHERE Dept_name = "Software Engineering"

