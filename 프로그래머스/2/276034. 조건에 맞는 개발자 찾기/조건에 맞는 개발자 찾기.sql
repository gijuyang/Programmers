select distinct(id), email, first_name, last_name
from developers d 
join (
    select *
    from skillcodes
    where name in ('Python','C#')
) s
on (d.skill_code & s.code) = s.code
order by id