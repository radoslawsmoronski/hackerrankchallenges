with NumberedRows AS (
select
    lat_n,
    ROW_NUMBER() over (order by LAT_N) AS RowNum,
    COUNT(*) over () as TotalRows
from
    station
)

select
  cast(AVG(CONVERT(FLOAT, lat_n)) as decimal(10,4)) as Median
from
  NumberedRows
where
  RowNum IN ((TotalRows + 1) / 2, (TotalRows + 2) / 2);