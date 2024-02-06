SELECT 
    MAX(Doctor) AS Doctor, MAX(Professor) AS Professor,
    MAX(Singer) AS Singer, MAX(Actor) AS Actor
FROM 
    (
        SELECT Occupation, Name,
        ROW_NUMBER() OVER(PARTITION BY Occupation ORDER BY Name) AS rn
        FROM OCCUPATIONS
    ) AS SourceTable
PIVOT
(
    MAX(Name)
    FOR Occupation 
    IN ([Doctor], [Professor], [Singer], [Actor])
) AS PivotTable
GROUP BY rn;