CREATE OR REPLACE FUNCTION max_min( IN stu_id integer, OUT max_cid integer, OUT min_cid integer ) 
RETURNS RECORD as $$ 
DECLARE  
    max_score integer; 
    min_score integer;
BEGIN 
    SELECT max(score) INTO max_score
    FROM Exams
    WHERE sid = stu_id;

    SELECT min(score) INTO min_score
    FROM Exams
    WHERE sid = stu_id;

    SELECT cid INTO max_cid
    FROM Exams
    WHERE score = max_score;

    IF min_score < max_score
    THEN 
        SELECT cid INTO min_cid
        FROM Exams
        WHERE score = min_score;
    ELSE
        min_cid := NULL;
    END IF;

END; 
$$ LANGUAGE plpgsql;