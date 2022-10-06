select 
  a.user_id, 
  max(a.time_stamp) last_stamp 
from 
  (
    select 
      user_id, 
      time_stamp 
    from 
      Logins 
    where 
      datediff(year, time_stamp, '2020')= 0
  ) a 
group by 
  user_id