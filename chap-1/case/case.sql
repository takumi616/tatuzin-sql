-- Test table
create table if not exists engineers(
    member_id uuid primary key default gen_random_uuid(),
    sex varchar(1) not null,
    age integer not null,
    country varchar(50) not null,
    job_role varchar(50) not null,
    created_at TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    updated_at TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
);

-- Case sample 1
-- the name 'language' is used in group by statement
-- ⚪︎: postgres, mysql   ×: oracle, db2, sql server
select case country 
when 'JAPAN' then 'Japanese' 
else 'English' 
end as language, 
count(*)
from engineers
group by language;