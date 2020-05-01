/*Please create a function with the following specification.
a.The function takes TWO input parameters for student Id’s, {start_student_id and end_student_id}.
b.Identify the student who has received maximum score among these students.
c.The function should return the student’s MAX score as a RETURN value who have achieved maximum score.*/
DELIMITER $

DROP function if exists maxScore$

CREATE function maxScore (start_student_id INT, end_student_id INT)
returns INT deterministic

BEGIN
  DECLARE l_topStudent INT;

      BEGIN
      SELECT max(score) INTO l_topStudent
      FROM Score AS sc
      WHERE sc.student_id =  start_student_id
      GROUP BY student_id;
      END;
      return l_topStudent;

END$
DELIMITER ;
