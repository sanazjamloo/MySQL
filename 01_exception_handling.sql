/* 1. Write a stored procedure to query against STUDENT table which does the following.
The procedure accepts “student_id” as input parameter.
The procedure has “out_msg” as OUT parameter which sets the status.
Do a search on this student_id from student table, If the student_id does not exist set the “out_msg” parameter as “No Student ID Found”.
Create One Insert statement to insert student information into student table. If the student_id already exist, handle exception “1062” Duplicate entry found and set “out_msg” OUT parameter with a meaningful message.
INSERT INTO STUDENT (STUDENT_ID, NAME, GENDER) values (5,'x','M');
Create a second Insert statement to insert student information into student table. To handle exception “1110” column name specified twice and set “out_msg” OUT parameter with a meaningful message.
INSERT INTO STUDENT (STUDENT_ID, NAME, NAME, GENDER) values (5,'x','y',’M’)*/

DELIMITER $

DROP procedure if exists exception_handling$
CREATE procedure exception_handling (in_student_id INT, OUT out_msg VARCHAR(100))

BEGIN

DECLARE last_row_fetched       INT default 0;
DECLARE duplicate_key          INT default 0;
DECLARE duplicate_column       INT default 0;


    BEGIN


    DECLARE CONTINUE HANDLER FOR 1062 SET duplicate_key = 1;
    DECLARE CONTINUE HANDLER FOT 1110 SET duplicate_column = 2 ;
    DECLARE CONTINUE HANDLER FOR 1146 SET last_row_fetched = 99; -- Not Found

          OPEN cursor1;
          cursor_loop:LOOP
            FETCH cursor1 INTO in_student_id;
            IF  last_row_fetched = 99 THEN
            LEAVE cursor_loop;
        END IF;
      END LOOP cursor_loop;
      CLOSE cursor1;
      SET  last_row_fetched = 0;
      SELECT CONCAT ('User :', user(), 'No Student ID was found.') Message;

      INSERT INTO student (student_id, name, gender)
              VALUES (in_student_id, 'testUser', 'F');
      IF duplicate_key = 1 THEN
          SELECT CONCAT ('User :', user(), 'is trying to insert student: ', in_student_id, ' that already exists.') Message;
        END IF;

      INSERT INTO student (student_id, name, gender)
              VALUES (in_student_id, 'xyz', 'M');
      IF duplicate_column = 2 THEN
          SELECT CONCAT ('User :', user(), 'is trying to insert student: ', in_student_id, 'colum student_id is specified twice.') Message;

    END;

END$

DELIMITER ;
