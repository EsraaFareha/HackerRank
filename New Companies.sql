select  c.company_code ,c.founder,
count(distinct l.lead_manager_code)  as total_lead,
count(distinct s.senior_manager_code) as total_senior,
count(distinct m.manager_code)  as total_manager,
count(distinct e.employee_code)  as total_employee
from company c
left join lead_manager l on c.company_code=l.company_code
left join  senior_manager s on l.lead_manager_code= s.lead_manager_code
left join manager m on m.senior_manager_code= s.senior_manager_code
left join employee e on e.manager_code= m.manager_code
group by c.company_code ,c.founder
order by c.company_code
