select 
  a.sell_date, 
  count(a.product) num_sold, 
  STRING_AGG(a.product, ',') WITHIN GROUP(
    ORDER BY 
      a.product ASC
  ) AS products 
from 
  (
    select 
      distinct * 
    from 
      Activities
  ) a 
group by 
  a.sell_date
