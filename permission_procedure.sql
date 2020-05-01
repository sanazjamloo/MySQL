


DELIMITER $

DROP PROCEDURE IF EXISTS PERMISSIONS_PROCEDURE$

CREATE PROCEDURE PERMISSIONS_PROCEDURE(IN_STUDENT_ID INT)
SQL SECURITY DEFINER /*if you change it to invoker from definer it won't work */

BEGIN
DECLARE l_count	INT;
DECLARE l_student_id INT;


	BEGIN

	SET @l_student_id = in_student_id;

			SET @V_QUERY = CONCAT('DELETE '
									,' FROM STUDENT '
									,' WHERE STUDENT_ID = ?'
									)
									;
			SELECT @V_QUERY;
			PREPARE SQL_STMT FROM @V_QUERY;
			EXECUTE SQL_STMT USING @l_STUDENT_ID;

	END;

END$

DELIMITER ;

/* /usr/local/mysql/bin/mysql -h localhost -u root -p */
