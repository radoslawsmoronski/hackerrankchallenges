select
    IIF(g.grade >= 8, s.name, NULL), g.grade, s.marks
from
    Students s, Grades g
where
    s.marks between g.min_mark and g.max_mark
order by
    g.grade desc, s.name;