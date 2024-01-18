select
    h.hacker_id,
    h.name
from
    Hackers h
left join
    Submissions s on s.hacker_id = h.hacker_id
left join
    Challenges ch on ch.challenge_id = s.challenge_id
left join
    Difficulty d on d.difficulty_level = ch.difficulty_level
where
    d.score = s.score
group by
    h.hacker_id, h.name
having
    COUNT(*) >= 2
order by
    COUNT(h.hacker_id) desc, h.hacker_id asc;