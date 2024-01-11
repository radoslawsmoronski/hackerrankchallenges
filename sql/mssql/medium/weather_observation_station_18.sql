select
    cast(round(abs(max(lat_n) - min(lat_n))
        + abs(max(long_w) - min(long_w)), 4) as decimal(10,4))
from
    station;