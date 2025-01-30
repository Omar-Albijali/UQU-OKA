use lab5;

SELECT course_id, title FROM course;

SELECT DISTINCT dept_name, credits FROM course;

SELECT Room_Number, Capacity/2 AS ExamCapacity 
FROM classroom 
WHERE Building = "Computing";

SELECT Room_Number, Capacity
FROM classroom 
WHERE Building = "Computing" AND Room_number LIKE "Lab%";

SELECT * FROM course WHERE Dept_name = "Computer Engineering";

SELECT * FROM classroom 
WHERE Capacity > 50;

SELECT DISTINCT Time_slot_id, Start_hr FROM time_slot
WHERE Start_hr BETWEEN 10 AND 15;

SELECT Course_id, Credits FROM course
WHERE Credits <> 3 AND Dept_name IS NOT NULL;

SELECT Course_id, Title FROM course, department
WHERE course.Dept_name = department.Dept_name AND department.Budget = 70000;

SELECT course.Course_id, Title, Prereq_id FROM course, prereq
WHERE course.Dept_name = "Data Science" AND course.Course_id = prereq.Course_id;

