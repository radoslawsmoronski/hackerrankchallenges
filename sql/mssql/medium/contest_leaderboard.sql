select s1.hacker_id, h.name, total_max_score
from Submissions s1
JOIN Hackers h on s1.hacker_id = h.hacker_id
CROSS APPLY (
    select SUM(max_score) AS total_max_score
    from (
		select MAX(s2.score) AS max_score
        from Submissions s2
        where s2.hacker_id = s1.hacker_id
        group by s2.challenge_id
    ) subquery
) AS subquery
group by s1.hacker_id, h.name, total_max_score
having total_max_score > 0
order by total_max_score DESC, s1.hacker_id;