select f1.x, f1.y
from functions f1
where EXISTS (SELECT 1 FROM functions f2 WHERE f1.x <> f2.x AND f1.y <> f2.y
AND f1.x = f2.y AND f1.y = f2.x) AND f1.x <= f1.y
union
select x, y from functions where x=y
group by x, y having count(*) > 1 order by x;