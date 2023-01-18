create or replace view v1 (sid) as (
    SELECT sid FROM Presenters
    GROUP BY sid
    ORDER BY count(*)
    LIMIT 1
);