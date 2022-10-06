select 
  a.name, 
  b.balance 
from 
  Users a 
  join (
    select 
      sum(amount) balance, 
      account 
    from 
      Transactions 
    group by 
      account
  ) b on a.account = b.account 
where 
  b.balance > 10000
