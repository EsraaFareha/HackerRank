select  Doctor, Professor, Singer, Actor
from (select row_number() over(partition by occupation order by name) numb ,* from OCCUPATIONS ) as source
pivot
(min(name) for occupation in  (Doctor, Professor, Singer, Actor)) as pivotable
order by numb