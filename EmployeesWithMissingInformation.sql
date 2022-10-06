select 
  case when a.employee_id is not null then a.employee_id else b.employee_id end employee_id 
from 
  Employees a full 
  join Salaries b on a.employee_id = b.employee_id 
where 
  a.name is null 
  or b.salary is null 
order by 
  employee_id
