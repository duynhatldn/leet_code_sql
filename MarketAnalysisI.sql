select 
  user_id buyer_id, 
  join_date, 
  isnull(orders_in_2019, 0) orders_in_2019 
from 
  Users a 
  left join (
    select 
      count(buyer_id) orders_in_2019, 
      buyer_id 
    from 
      Orders 
    where 
      datediff(year, order_date, '2019') = 0 
    group by 
      buyer_id
  ) b on a.user_id = b.buyer_id
