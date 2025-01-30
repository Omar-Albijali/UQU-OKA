use lab7;

-- • List the course_id, title, semester, and year for all courses, whether the 
-- course has sections associated to it or not 

select course.course_id, title, semester, year
from course left join section on course.Course_id = section.Course_id;


-- • List the course_id, title, semester, and year only for those courses having 
-- sections associated to them. Course should be ordered descendingly by the 
-- course_id 

select distinct course.course_id, title, semester, year
from course inner join section on course.Course_id = section.Course_id
order by course.course_id desc;

-- • List the course_id, title, dept_name, and budget of the offering department for 
-- courses, whose credits exceed the average number of credits of all courses. 

select course_id, title, course.Dept_name, credits, budget
from course inner join department on
course.Dept_name = department.Dept_name and
credits > (select avg(credits) from course);

-- • List the course_id, title, and count of associated sections for those courses 
-- offered in winter 1446. 

select course.course_id, title, count(section.Course_id) as `count`
from course inner join section on course.Course_id = section.Course_id
group by course.Course_id;

-- • List the dept_name, course_id, title, sec_id, room_number, and capacity for 
-- all sections that are given in a classroom with a  capacity greater than or 
-- equal 50. Output should be ordered ascendingly by course_id then sec_id 

select dept_name, section.course_id, title, sec_id, classroom.Room_number, capacity
from section inner join course on course.Course_id = section.Course_id
	 inner join classroom on  section.Room_number = classroom.Room_number 
      
     where classroom.Capacity >= 50
order by course_id asc, sec_id asc;


-- • [You are about to finish. Let’s find our course and your section]: list 
-- course_id, title, credits, sec_id, building, room_number, time_slot_id for the 
-- course whose title is “Database Fundamentals”. Only sections of winter 1446 
-- should be displayed. 

select course.course_id, title, credits, sec_id, building, room_number, time_slot_id
from course inner join section on course.Course_id = section.Course_id
where title = "Database Fundamentals" 
	and Semester = "winter" and Year = "1446";
