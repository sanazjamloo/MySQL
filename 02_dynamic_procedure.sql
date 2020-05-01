/* Write a procedure using dynamic SQL as follows.

The procedure accepts a table name as input parameter. (Table SCORE is passed as input parameter).
The procedure should have three OUT parameters which will print the status_message as “Success”, status_code as “0” and “output_table”.
Write a dynamic sql by constructing the passed in table name and compute the SUM, AVG, MAX, MIN of scores by using group by on event_id.
After executing the procedure, store the results into a temporary table and return the table name in the output parameter.
When you print the output_table parameter you should see the table name with the calculated scores.*/
DELIMITER $

DROP procedure if exists dynamic_procedure$
CREATE procedure dynamic_procedure (IN in_score INT, OUT status_message VARCHAR('Sucsess'),  OUT status_code INT(0), OUT VARCHAR (output_table))

BEGIN

DECLARE l_statics INT;

    BEGIN
    SELECT sum(score), avg(score), max(score), min(score) INTO l_statics
    FROM Score AS sc
    WHERE sc.score =  in_score
    GROUP BY event_id;
    END;
    SELECT l_statics;

END$

DELIMITER ;
