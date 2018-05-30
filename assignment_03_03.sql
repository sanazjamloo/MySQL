/*Create a database procedure that accepts one input parameter {student_id and event_id}.
Use these input parameters to return the category that this student belongs to.*/
DELIMITER $

DROP procedure if exists getCategory$

CREATE procedure getCategory (in_student_id INT, in_event_id INT)

BEGIN
  DECLARE l_category VARCHAR(255);
    BEGIN
            SELECT s.student_id AS Student_id,
                   sc.event_id AS  Event_id,
                   sc.score AS Score,
                   g.category AS category
            FROM student AS s
            JOIN score AS sc
            JOIN grade_event AS g
            WHERE s.student_id = in_student_id AND sc.event_id = in_event_id
            GROUP BY s.student_id;

  END;

  END$
DELIMITER ;
