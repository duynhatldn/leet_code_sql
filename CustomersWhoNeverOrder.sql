select a.name as Customers 
from Customers a 
    left join Orders b on b.customerId = a.id 
where b.id is null