select
    max(months * salary), count(months * salary) 
from
    Employee
where
    (months * salary) like (select max(months * salary) from Employee);