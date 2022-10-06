select 
  count(customer_id) count_no_trans, 
  customer_id 
from 
  Visits 
where 
  visit_id not in (
    select 
      distinct visit_id 
    from 
      Transactions
  ) 
group by 
  customer_id
