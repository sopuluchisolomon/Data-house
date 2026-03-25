USE salary_record;

select sts.first_name, 
gender, 
salary, 
sum(salary) over(partition by gender) Total_Salary_by_gender,
row_number() over(partition by gender) Row_num from staff_salary sts
join staff_demographics std
on std.employee_id = sts.employee_id;


select sts.first_name, gender, 
salary from staff_salary sts
join staff_demographics std
on sts.employee_id = std.employee_id
group by sts.first_name, gender, salary;