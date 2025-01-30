use lab2;

alter table instructor
add column NID int unique first;

alter table student
add column Major varchar(5) after Dept_name,
add column GPA decimal(3, 2) check (GPA <= 4);

alter table course
add constraint Credits check (Credits <= 5);

alter table classroom
rename column Capacity to NoofSeats;

alter table takes
modify Grade int;

rename table prereq to prerequisite;

alter table department
drop column budget;

create view LabView as
select instructor.ID as I_ID, instructor.name, department.dept_name, 
student.ID as S_ID,course.course_id
from instructor, course, department, student;


