select distinct b.name as Department, a.name as Employee, a.salary as Salary 
from Employee a, Department b, (select max(salary) as ms, departmentId from Employee group by departmentId) c 
where a.departmentId = b.id and a.salary = c.ms and c.departmentId = a.departmentId