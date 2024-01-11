select
    s.name
from
    Students s
join Packages p on p.id = s.id
join Friends f on f.id = s.id
join Packages fp on fp.id = f.friend_id
where
    p.salary < fp.salary
order by
    fp.salary;