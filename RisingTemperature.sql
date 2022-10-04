select a.id 
from Weather a, Weather b 
where a.temperature > b.temperature 
    and datediff(day, b.recordDate, a.recordDate)=1