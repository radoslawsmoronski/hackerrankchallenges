select w.id, wp.age, w.coins_needed, w.power
from Wands w
join Wands_Property wp on w.code = wp.code
where
    (select min(w2.coins_needed)
    from Wands w2
    join Wands_Property wp2 on w2.code = wp2.code
    where wp.age = wp2.age and w.power = w2.power) = w.coins_needed
    and wp.is_evil = 0
order by
    w.power desc, wp.age desc;