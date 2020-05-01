-- capturing a duplicate value in the table

DELIMITER $

DROP procedure if exists exception_handling$

CREATE procedure exception_handling (in_student_id INT, in_event_id INT)

BEGIN
DECLARE duplicate_key          INT default 0;
DECLARE foreign_key_failed     INT default 0;

BEGIN

    BEGIN
    /*DECLARE CONTINUE HANDLER FOR 1062 SET duplicate_key = 1; */

    DECLARE EXIT HANDLER FOR 1062 SET duplicate_key = 1;
    DECLARE CONTINUE HANDLER FOR 1451 SET foreign_key_failed = 888;
    INSERT INTO student (student_id
                        , name
                        , gender
                      ) VALUES
                      (in_student_id
                      , 'testUser'
                      , 'M'
                      );


    DELETE from grade_event WHERE event_id = in_event_id;
    END;


    IF duplicate_key = 1 THEN
      SELECT CONCAT ('User :', user(), 'is trying to insert student:' , in_student_id, ' that already exists.') Message;
      END IF;
    IF foreign_key_failed = 888 THEN
    SELECT CONCAT ('User :', user(), 'is trying to delete a parent entity:' , in_event_id, ' for which a child exists.') Message;
      END IF;



    END;


END$

DELIMITER ;
