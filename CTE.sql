use salary_record;

with cte_tab as
(
select first_name,
age,
gender,
employee_id from staff_demographics
),
cte_tab_2 as
(
select occupation,
salary,
employee_id from staff_salary
)

select * from cte_tab
join cte_tab_2 on
cte_tab.employee_id = cte_tab_2.employee_id;