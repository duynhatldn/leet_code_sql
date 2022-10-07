select 
  a.date Day, 
  CAST(
    CAST(
      isnull(cancelled, 0) AS DECIMAL(5, 2)
    )/ CAST(
      (
        isnull(completed, 0)+ isnull(cancelled, 0)
      ) AS DECIMAL(5, 2)
    ) AS DECIMAL(5, 2)
  ) 'Cancellation Rate' 
from 
  (
    select 
      request_at date, 
      sum(
        case when status = 'completed' then 1 end
      ) completed, 
      sum(
        case when status != 'completed' then 1 end
      ) cancelled 
    from 
      Trips 
    where 
      client_id not in (
        select 
          users_id 
        from 
          Users 
        where 
          banned = 'Yes' 
          and role = 'client'
      ) 
      and driver_id not in (
        select 
          users_id 
        from 
          Users 
        where 
          banned = 'Yes' 
          and role = 'driver'
      ) and request_at between '2013-10-01' and '2013-10-03'
    group by 
      request_at
  ) a