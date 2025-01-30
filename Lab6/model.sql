use lab5;

-- This lab is to be completed using the same database of lab5 from last week 
-- Download the database “Lab5” from the blackboard and import it into MySQL 
-- Write SQL lines using SELECT/FROM/WHERE/GROUP BY/HAVING/ORDER BY to 
-- accomplish each of the following 

-- • Generate all classrooms within the college of computing in an ascending 
-- order of their capacity 

SELECT * FROM classroom 
WHERE Building = "Computing"
ORDER BY Capacity;


-- • Generate all courses ordered ascendingly by their credits, then descendingly 
-- by course_id 

SELECT * FROM course 
ORDER BY Credits ASC, Course_id DESC;

-- • Generate the course with the maximum credits in the table course. The four 
-- columns of the table should be displayed for this course 

SELECT * FROM course
WHERE Credits =(SELECT MAX(Credits) FROM course);


-- • Generate the number of courses, and the sum of their credits for each 
-- department within the college of computing. The output should have three 
-- columns: dept_name, No_Course, Total_Credits. Courses with no 
-- department should not be displayed 

SELECT Dept_name, 
 COUNT(Course_id) as No_Course,
 SUM(Credits) as Total_Credits
FROM course
GROUP BY Dept_name
HAVING Dept_name IS NOT NULL;


-- • Generate the number of courses, which have prerequisite, for each 
-- department within the college of computing. The output should have two 
-- columns: dept_name, No_Course. Courses with no department should not 
-- be displayed

SELECT Dept_name, COUNT(course.Course_id) as No_Course
FROM course, prereq 
WHERE course.Course_id = prereq.Course_id
GROUP BY Dept_name
HAVING Dept_name IS NOT NULL;