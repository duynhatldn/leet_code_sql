select 
  b.name, 
  isnull(a.total, 0) travelled_distance 
from 
  (
    select 
      sum(distance) total, 
      user_id 
    from 
      Rides 
    group by 
      user_id
  ) a 
  right join Users b on a.user_id = b.id 
order by 
  a.total desc, 
  b.name
