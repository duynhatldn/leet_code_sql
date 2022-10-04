select 
  DISTINCT product_new.product_id, 
  product_new.product_name 
from 
  (
    select 
      * 
    from 
      Product 
    where 
      product_id not in (
        select 
          product_id 
        from 
          Sales 
        where 
          sale_date < '2019-01-01' 
          or sale_date > '2019-03-31'
      )
  ) product_new 
  inner join (
    select 
      product_id 
    from 
      Sales 
    where 
      sale_date between '2019-01-01' 
      and '2019-03-31'
  ) sales_new on product_new.product_id = sales_new.product_id
