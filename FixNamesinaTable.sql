select 
  user_id, 
  UPPER(
    LEFT(name, 1)
  )+ LOWER(
    SUBSTRING(
      name, 
      2, 
      LEN(name)
    )
  ) name 
from 
  Users 
order by 
  user_id