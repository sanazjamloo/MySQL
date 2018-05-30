/*Create a function that accepts two input parameters {student_id and gender}.
 Use these input parameters to return the student name.*/
 DELIMITER $
 DROP function if exists getStudentName$

 CREATE function getStudentName (in_student_id INT, in_gender VARCHAR(1))
 returns VARCHAR(20) deterministic

 BEGIN
  DECLARE l_box VARCHAR(20);

      BEGIN
        SELECT name INTO l_box
        FROM student AS s
        WHERE s.student_id = in_student_id AND s.gender = in_gender;
        END;
        return l_box;
END$

DELIMITER ;
