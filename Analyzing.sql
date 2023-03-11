
with mx  (mo,d,x)
as (select datepart(month,record_date) as mo ,
     data_type, max(data_value) as x
from temperature_records
where data_type='max'
group by datepart(month,record_date),data_type
--order by mo
),

 mn  (mo,d,n)
as (select datepart(month,record_date) as mo ,
     data_type, min(data_value) as n
from temperature_records
where data_type='min'
group by datepart(month,record_date),data_type
--order by mo
),

 vg  (mo,d,g)
as (select datepart(month,record_date) as mo ,
     data_type, ROUND(AVG(CAST(data_value AS FLOAT)),0) as g
from temperature_records
where data_type='avg'
group by datepart(month,record_date),data_type
--order by mo
),

 temp(mo,d,v)
 as(select datepart(month,record_date) as mo ,
     data_type, data_value 
from temperature_records)


    select distinct t.mo as month, mx.x as max, mn.n as min, vg.g as avg
    from temp t
    left join mx on t.mo =mx.mo
	left join mn on t.mo=mn.mo
	left join vg on t.mo=vg.mo


