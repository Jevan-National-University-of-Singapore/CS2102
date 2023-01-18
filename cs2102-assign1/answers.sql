/* cs2102 assignment 1 */

drop view if exists v1, v2, v3, v4, v5, v6, v7, v8, v9, v10 cascade;

create or replace  view v1 (sid,cid) as 
    SELECT DISTINCT sid, cid
    FROM Tutors
    EXCEPT 
    SELECT sid, cid
    FROM Transcripts
;

create or replace view v2 (sid) as 
    SELECT DISTINCT sid
    FROM Tutors
    GROUP BY sid, year, semester
    HAVING count(*) >= 2
;

create or replace view v3 (cid, year, semester) as 
    WITH course_count AS (
        SELECT  cid, year, semester, COUNT(*) AS num
        FROM Transcripts
        GROUP BY cid, year, semester
    )
    SELECT DISTINCT cid, year, semester
    FROM (
        course_count
        NATURAL JOIN (
            SELECT cid, MAX(num) AS highest
            FROM course_count
            GROUP BY cid
        ) AS course_highest
    )
    WHERE num = highest
;

create or replace view v4 (cid, year, semester) as 
    SELECT DISTINCT cid, year, semester
    FROM (
        Offerings
        NATURAL JOIN (
            SELECT cid, COUNT(*) as num_of_profs
            FROM Teaches
            GROUP BY cid, year, semester
        ) AS profs
        NATURAL JOIN (
            SELECT cid, did
            FROM Courses
        ) as offerings_full
    )
    WHERE did = 'cs' OR num_of_profs = 1 OR semester = 2

;

create or replace view v5 (cid) as 
    SELECT DISTINCT cid
    FROM Courses
    WHERE did = 'cs'
    EXCEPT (
        SELECT cid
        FROM Transcripts
        WHERE sid = 'alice'
    )
;

create or replace view v6 (cid, year, semester, cost) as
    SELECT DISTINCT cid, year, semester, sum(cost) AS cost
    FROM (
        SELECT cid, year, semester, sum(hours) * 100 AS cost
        FROM Teaches
        GROUP BY cid, year, semester
        UNION ALL(
            SELECT cid, year, semester, sum(hours) * 50 AS cost
            FROM Tutors
            GROUP BY cid, year, semester
        )
    ) AS foo
    GROUP BY cid, year, semester
;

create or replace view v7 (did, faculty, num_admitted, num_offering, total_enrollment) as 
    WITH students_admitted AS (
        SELECT did as did_sa, count(*) as num_admitted
        FROM Students
        WHERE year = 2021
        GROUP BY did
    ), course_offerings AS (
        SELECT did as did_co, count(*) as num_offering
        FROM (
            Courses
            NATURAL JOIN
            Offerings
        )
        WHERE year = 2021
        GROUP BY did
    ), student_enrollments AS (
        SELECT did as did_se, count(*) as total_enrollment
        FROM (
            Transcripts
            NATURAL JOIN
            Courses
        )
        WHERE year = 2021
        GROUP BY did
    )
    SELECT DISTINCT did, faculty, COALESCE(num_admitted, 0) AS num_admitted, COALESCE(num_offering, 0) AS num_offering, COALESCE(total_enrollment, 0) AS total_enrollment
    FROM (
        Departments D 
        FULL OUTER JOIN
            students_admitted SA
        ON 
            D.did = SA.did_sa
        FULL OUTER JOIN
            course_offerings CO
        ON 
            D.did = CO.did_co
        FULL OUTER JOIN
            student_enrollments SE
        ON
            D.did = SE.did_se
    )
;


create or replace view v8 (sid, year, semester) as
    SELECT DISTINCT sid, year, semester
    FROM(
        Courses
        NATURAL JOIN
            Transcripts
    )
    WHERE
        did = 'cs'
    EXCEPT (
        SELECT sid, year, semester
        FROM(
            Courses
            NATURAL JOIN
                Transcripts
        )
        WHERE
            did <> 'cs'
    )
;

create or replace view v9 (sid, year, semester) as 
    WITH transcipts_top_marks AS (
        SELECT cid, year, semester, max(marks) as top_marks
        FROM Transcripts
        GROUP BY cid, year, semester
    )
    SELECT DISTINCT sid, year, semester
    FROM (
        SELECT sid, year, semester
        FROM transcipts_top_marks
        NATURAL JOIN Transcripts
        WHERE marks = top_marks
    ) AS foo
    EXCEPT (
        SELECT sid, year, semester
        FROM transcipts_top_marks
        NATURAL JOIN Transcripts
        WHERE marks <> top_marks
    )
;

create or replace view v10 (sid1, sid2, sid3, sid4) as 
    WITH hours_2019 AS (
        SELECT sid
        FROM Tutors
        GROUP BY sid, year, semester
        HAVING
            year = 2022
        AND
            semester = 1
        AND
            SUM(hours) >= 10
        EXCEPT (
            SELECT sid
            FROM students
            WHERE year < 2019
        )
    ), possible_teams AS (
        SELECT h1.sid AS sid_1, h2.sid AS sid_2, h3.sid AS sid_3, h4.sid AS sid_4
        FROM 
            hours_2019 h1
            JOIN hours_2019 h2 
            ON h2.sid > h1.sid

            JOIN hours_2019 h3 
            ON h3.sid > h2.sid

            JOIN hours_2019 h4 
            ON h4.sid > h3.sid
    ), cs_1_2 AS (
        SELECT DISTINCT sid
        FROM Transcripts
        WHERE cid = 'cs1'
        INTERSECT
        SELECT DISTINCT sid
        FROM Transcripts
        WHERE cid = 'cs2'
    ), cs_3_4 AS (
        SELECT DISTINCT sid
        FROM Transcripts
        WHERE cid = 'cs3' OR cid = 'cs4'
    )
    SELECT DISTINCT sid_1, sid_2, sid_3, sid_4
    FROM(
        SELECT 
            sid_1, sid_2, sid_3, sid_4, 
            CASE WHEN sid_1 IN (SELECT sid FROM cs_1_2)
            THEN 1 ELSE 0
            END AS cs12_1,
            
            CASE WHEN sid_2 IN (SELECT sid FROM cs_1_2)
            THEN 1 ELSE 0
            END AS cs12_2,

            CASE WHEN sid_3 IN (SELECT sid FROM cs_1_2)
            THEN 1 ELSE 0
            END AS cs12_3,

            CASE WHEN sid_4 IN (SELECT sid FROM cs_1_2)
            THEN 1 ELSE 0
            END AS cs12_4,

            CASE WHEN sid_1 IN (SELECT sid FROM cs_3_4)
            THEN 1 ELSE 0
            END AS cs34_1,
            
            CASE WHEN sid_2 IN (SELECT sid FROM cs_3_4)
            THEN 1 ELSE 0
            END AS cs34_2,

            CASE WHEN sid_3 IN (SELECT sid FROM cs_3_4)
            THEN 1 ELSE 0
            END AS cs34_3,

            CASE WHEN sid_4 IN (SELECT sid FROM cs_3_4)
            THEN 1 ELSE 0
            END AS cs34_4

        FROM
            possible_teams
    ) AS foo
    WHERE 
        cs12_1 + cs12_2 + cs12_3 + cs12_4 >= 2 
    AND 
        cs34_1 + cs34_2 + cs34_3 + cs34_4 >= 2
;

