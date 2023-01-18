CREATE OR REPLACE FUNCTION checkMaximumWorkHours() RETURNS TRIGGER
AS $$
DECLARE
    projectBudget       INTEGER ;
    currentTotalHours   INTEGER ;
BEGIN
    IF (TG_OP = 'INSERT') OR (TG_OP = 'UPDATE') THEN
        SELECT  pbudget INTO projectBudget
        FROM    Projects
        WHERE   pid = NEW.pid;
        
        SELECT  COALESCE(sum(hours), 0) INTO currentTotalHours
        FROM    Works 
        WHERE   pid = NEW.pid;

        IF  currentTotalHours * 100 > projectBudget THEN
            NEW.hours := FLOOR(projectBudget/100 - currentTotalHours);
        END IF;
        RETURN NEW;
    END IF;
END;
$$ LANGUAGE plpgsql;
