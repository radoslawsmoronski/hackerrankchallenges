select
    sd.Start_Date,
    min(ed.End_Date)
from
    projects sd
join
    projects ed on sd.Start_Date < ed.End_Date
where
    sd.Start_Date not in (select End_Date from projects)
    and ed.End_Date not in (select Start_Date from projects)
group by
    sd.Start_Date
order by
    DATEDIFF(day, sd.Start_Date, min(ed.End_Date)), sd.Start_Date;