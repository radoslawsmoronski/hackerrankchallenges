with sub_hackers as (
    select h.hacker_id, h.name, count(*) as ch_amount
    from hackers h
    join challenges ch on h.hacker_id = ch.hacker_id
    group by h.hacker_id, h.name
)
select h.hacker_id, h.name, h.ch_amount
from sub_hackers h
where
    (select count(*) from sub_hackers h2 where (h2.ch_amount = h.ch_amount)) < 2
     or h.ch_amount = (select max(ch_amount) from sub_hackers)
order by h.ch_amount desc, h.hacker_id;