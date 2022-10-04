select a.id,
case
    when a.p_id is null then 'Root'
    when a.id in (select distinct b.p_id from Tree b) then 'Inner'
    else 'Leaf'
end as type
from Tree a