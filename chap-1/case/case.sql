-- Test table
create table if not exists engineers(
    member_id uuid primary key default gen_random_uuid(),
    sex varchar(1) not null,
    age smallint not null,
    country varchar(50) not null,
    position varchar(50) not null,
    salary integer not null,
    monitor smallint not null,
    updated_at TIMESTAMP(3) WITH TIME ZONE NOT NULL DEFAULT CURRENT_TIMESTAMP(3)
);

-- Case sample 1
-- the name 'language' is used in group by statement
-- ⚪︎: postgres, mysql   ×: oracle, db2, sql server
select case country 
when 'JAPAN' then 'Japanese'
when 'GERMANY' then 'German'
else 'English' 
end as language,
count(*)
from engineers
group by language;

-- Case sample 2
select 
sum(case position when 'backend' then monitor else 0 end) as backend_monitor,
sum(case position when 'machine learning' then monitor else 0 end) as machine_learning_monitor,
sum(case position when 'frontend' then monitor else 0 end) as frontend_monitor
from engineers;


