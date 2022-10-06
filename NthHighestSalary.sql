CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS BEGIN RETURN (
  SELECT 
    DISTINCT Salary AS getNthHighestSalary 
  FROM 
    Employee 
  ORDER BY 
    Salary DESC OFFSET (@N -1) Rows fetch next 1 rows only
);
END
