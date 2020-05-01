DELIMITER $

DROP procedure if exists events_procedure$

CREATE procedure events_procedure()

BEGIN

    BEGIN

      INSERT INTO student (name, gender) values ('Test', 'M');

    END;

END$

DELIMITER ;      
