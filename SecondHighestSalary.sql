select Max(a.salary) as SecondHighestSalary 
    from (select * from Employee 
          where salary <> (select Max(salary) 
          from Employee)) a