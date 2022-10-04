select a.name 
from SalesPerson a 
where a.sales_id not in (select distinct a.sales_id
                        from Orders a join Company b on a.com_id = b.com_id 
                        where b.name = 'RED') 