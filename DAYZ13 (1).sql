
1/////////

declare
myr emp%rowtype;

cursor c(eno number) is 
select * from employees where employee_id =eno;
begin 

open c(3);
loop
fetch c into myr;
exit when c%notfound;
dbms_output.put_line('id:'||myr.employee_id||chr(9)||'first_name:'||myr.first_name);
end loop;
close c;
end;

2/////////////
declare
rec employees%rowtype;
cursor c(cha char) is 
select * from employees where FIRST_NAME like 'cha';
begin
open c('j%');
loop
fetch c into rec;
exit when c%notfound ;
dbms_output.put_line('id:'||rec.EMPLOYEE_ID||chr(9)||'name:'||rec.FIRST_NAME);
end loop;
close c;
end ;
3//////////////
declare
rec emp%rowtype;
cursor c(sal number) is 
select *from emp where salary<sal;
begin
open c(80000);
loop
fetch c into rec;
exit when c%notfound;
dbms_output.put_line('name:'||rec.name||chr(9)||'salary:'||rec.salary);
end loop;
close c;
end;
4///////////////
declare
rec emp%rowtype;
cursor c1(nam varchar) is
select *from emp where salary > (select salary from emp where name=nam);
begin
open c1('kisan');
loop
fetch c1 into rec;
exit when c1%notfound;
dbms_output.put_line('name:'||rec.name||chr(9)||'salary:'||rec.salary);
end loop;
close c1;
end;
5/////////////
declare
rec emp%rowtype;
cursor c1(nam varchar) is 
select *from emp where salary > (select salary from emp where name=nam);
begin
open c1('&nam');
loop
fetch c1 into rec ;
exit when c1%notfound;
dbms_output.put_line('name:'||rec.name||chr(9)||'salary:'||rec.salary);
end loop;
close c1;
end;
6/////////////////
declare
rec c1%rowtype;
cursor c1(nam varchar:='ram',year number:=2017) is 
select *from emp where name=nam and extract (year from doj)=year;
begin
open c1;
loop
fetch c1 into rec ;
exit when c1%notfound;
dbms_output.put_line('name:'||rec.name||chr(9)||'salary:'||rec.salary);
end loop;
close c1;
end;
7/////////////////
declare
rec emp%rowtype;
e_name emp.name%type;
e_salary emp.salary%type;

cursor c2 is select name,salary from emp where rownum<=5 order by salary desc ;
begin
open c2;
loop
fetch c2 into e_name,e_salary;
exit when c2%notfound;
dbms_output.put_line('name:'||e_name||chr(9)||'salary:'||e_salary);
end loop;
close c2;
end;


STUDENT (rollno, name, class,birthdate,doj,coursename, max_marks)
1.Display details of student who takes ‘Database Management System’ course using parameterized cursor.
2.Display details of students who are born in 1980 or 1982 using parameterized default value cursor.
3.Select all courses where passing marks are more than passing mark(40).
4.Display the name of the student who are enrolled in mca course.
5.Create a parameterized cursor to display the student details who have enrolled bba course after 2010.
1.////

declare
cursor c1(course varchar) is
select *from student where coursename=course;
rec c1%rowtype;
begin
open c1('bca');
loop
fetch c1 into rec;
exit when c1%notfound;
dbms_output.put_line('rollno:'||rec.rollno||chr(9)||'name:'||rec.name||chr(9)||'class'||rec.class||chr(9)||'birthdate:'||rec.birthdate||chr(9)||'date of joining:'||rec.doj||
'coursename:'||rec.coursename||chr(9)||'max_marks:'||rec.max_marks);
end loop;
close c1;
end;
2//////////////
declare
cursor c1(year number) is
select *from student where extract (year from birthdate)=year;
rec c1%rowtype;
begin
open c1(2003);
loop
fetch c1 into rec;
exit when c1%notfound;
dbms_output.put_line('rollno:'||rec.rollno||chr(9)||'name:'||rec.name||chr(9)||'class'||rec.class||chr(9)||'birthdate:'||rec.birthdate||chr(9)||'date of joining:'||rec.doj||
'coursename:'||rec.coursename||chr(9)||'max_marks:'||rec.max_marks);
end loop;
close c1;
end;
3/////////////
declare
cursor c1(marks number) is
select *from student where max_marks>marks;
rec c1%rowtype;
begin
open c1(40);
loop
fetch c1 into rec;
exit when c1%notfound;
dbms_output.put_line('rollno:'||rec.rollno||chr(9)||'name:'||rec.name||chr(9)||'class'||rec.class||chr(9)||'birthdate:'||rec.birthdate||chr(9)||'date of joining:'||rec.doj||
'coursename:'||rec.coursename||chr(9)||'max_marks:'||rec.max_marks);
end loop;
close c1;
end;
4/////////////////////////
declare
cursor c1(course varchar) is
select *from student where coursename=course;
rec c1%rowtype;
begin
open c1('mca');
loop
fetch c1 into rec;
exit when c1%notfound;
dbms_output.put_line('rollno:'||rec.rollno||chr(9)||'name:'||rec.name||chr(9)||'class'||rec.class||chr(9)||'birthdate:'||rec.birthdate||chr(9)||'date of joining:'||rec.doj||
'coursename:'||rec.coursename||chr(9)||'max_marks:'||rec.max_marks);
end loop;
close c1;
end;
5////////////////
declare
cursor c1(year number) is
select *from student where coursename = 'bca' and extract (year from doj)>year;
rec c1%rowtype;
begin
open c1(2010);
loop
fetch c1 into rec;
exit when c1%notfound;
dbms_output.put_line('rollno:'||rec.rollno||chr(9)||'name:'||rec.name||chr(9)||'class'||rec.class||chr(9)||'birthdate:'||rec.birthdate||chr(9)||'date of joining:'||rec.doj||
'coursename:'||rec.coursename||chr(9)||'max_marks:'||rec.max_marks);
end loop;
close c1;
end;



























































