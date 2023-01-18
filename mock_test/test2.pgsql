
SELECT sid1, sid2
FROM (
    SELECT DISTINCT P1.sid AS sid1, P2.sid AS sid2, P1.week AS week
    FROM 
        Presenters P1
        CROSS JOIN 
        Presenters P2
    WHERE P1.week = P2.week
    AND P1.sid < P2.sid
) AS Foo
GROUP BY sid1, sid2
HAVING count(*) >= 5;

