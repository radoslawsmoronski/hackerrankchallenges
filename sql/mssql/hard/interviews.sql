SELECT
    contest_id,
    hacker_id,
    name,
    SUM(Total_Submissions) AS Total_Submissions2,
    SUM(Total_Accepted_Submissions) AS Total_Accepted_Submissions2,
    SUM(Total_Views) AS Total_Views2,
    SUM(Total_Unique_Views) AS Total_Unique_Views2
FROM (
    SELECT
        con.contest_id as contest_id,
        con.hacker_id as hacker_id,
        con.name as name,
        (SELECT SUM(total_submissions)
            FROM Submission_Stats
            WHERE challenge_id = cha.challenge_id
        ) AS Total_Submissions,
        (SELECT SUM(total_accepted_submissions)
            FROM Submission_Stats
            WHERE challenge_id = cha.challenge_id
        ) AS Total_Accepted_Submissions,
        (SELECT SUM(total_views)
            FROM View_Stats
            WHERE challenge_id = cha.challenge_id
        ) AS Total_Views,
        (SELECT SUM(total_unique_views)
            FROM View_Stats
            WHERE challenge_id = cha.challenge_id
        ) AS Total_Unique_Views
    FROM
        Contests con
    FULL JOIN
        Colleges col ON col.contest_id = con.contest_id
    FULL JOIN
        Challenges cha ON cha.college_id = col.college_id
) AS Subquery
GROUP BY
    contest_id, hacker_id, name
HAVING
	SUM(Total_Submissions) > 0
    OR SUM(Total_Accepted_Submissions) > 0
    OR SUM(Total_Views) > 0
    OR SUM(Total_Unique_Views) > 0
ORDER BY
	contest_id