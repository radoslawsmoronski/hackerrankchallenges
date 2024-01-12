select
    c.company_code,
    c.founder,
    
    (select count(*) from(select distinct lead_manager_code, company_code
    from Lead_Manager where company_code = c.company_code) as subquery),
    
    (select count(*) from(select distinct senior_manager_code, company_code
    from Senior_Manager where company_code = c.company_code) as subquery),
    
    (select count(*) from(select distinct manager_code, company_code
    from Manager where company_code = c.company_code) as subquery),
    
    (select count(*) from(select distinct employee_code, company_code
    from Employee where company_code = c.company_code) as subquery)
    
from
    Company c
ORDER BY
    CAST(SUBSTRING(company_code, 0, 1) AS INT);