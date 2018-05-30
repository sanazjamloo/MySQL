DELIMITER $

DROP procedure if exists student$

CREATE procedure student (in_student_id INT, in_event_id INT)

BEGIN

BEGIN

  SELECT s.student_id AS Student_id,
         sc.event_id AS  Event_id,
         sc.score AS Score,
         g.category AS category
  FROM student AS s
  JOIN score AS sc
  JOIN grade_event AS g
  WHERE s.student_id = in_student_id AND sc.event_id = in_event_id
  GROUP BY sc.student_id;

  END;




END$
DELIMITER;
