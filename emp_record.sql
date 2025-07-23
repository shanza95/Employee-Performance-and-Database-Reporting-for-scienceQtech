
## project - ScienceQtech Employee Performance Mapping

create database emp_record;
use emp_record;

# 3. WAQ to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, 
	# and make a list of employees and details of their department.
select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT from emp_record_table;

# 4. WAQ to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING 
	# if the EMP_RATING is:
		# - less than 2,	greater than 4,		between two and four

select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table
WHERE EMP_RATING <=2 OR EMP_RATING >= 4;

# 5. WAQ to concatenate the FIRST NAME and the LAST_NAME of employees in the Finance department from the employee table 
	# and then give the resultant column alias as NAME.
SELECT CONCAT(FIRST_NAME,' ',LAST_NAME) as NAME from emp_record_table 
WHERE DEPT = 'FINANCE' ;

# 6. WAQ to list only those employees who have someone reporting to them. 
	# Also, show the number of reporters (including the President).
SELECT COUNT(EMP_ID) AS NO_OF_REPORTERS, MANAGER_ID FROM emp_record_table
WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID
ORDER BY MANAGER_ID DESC; 

# 7. WAQ to list down all the employees from the healthcare and finance departments using union.
select * FROM emp_record_table WHERE DEPT = 'FINANCE' 
UNION 
select * FROM emp_record_table WHERE DEPT = 'HEALTHCARE';

# 8. WAQ to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, AND EMP_RATING GROUPED BY DEPT.
	# also include the respective employee rating along with the max emp rating for the department.
select EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPT, 
MAX(EMP_RATING) OVER (PARTITION BY DEPT) as MAX_RATING from emp_record_table
ORDER BY EMP_RATING DESC;

# 9. WAQ to calculate the minimum and maximum salary of the employees in each role.
select ROLE, MIN(SALARY) AS MIN_SALARY, MAX(SALARY) AS MAX_SALARY 
from emp_record_table
GROUP BY ROLE;

# 10. WAQ to assign ranks to each employee based on their experience.
SELECT EMP_ID, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS EMP_NAME, DEPT, ROLE,
RANK() OVER (ORDER BY EXP) AS EMP_EXP_RANKING
from emp_record_table
ORDER BY EXP DESC;

# 11. WAQ to create a view that displays the employees in various countries whose salary is more than six thousand.
create view VIEW_SALARY as
select EMP_ID, COUNTRY, SALARY from emp_record_table
WHERE SALARY >= 6000;
select * from VIEW_SALARY;

# 12. # WA NESTED QUERY to find employees with experience of more than ten years.
select EMP_ID, FIRST_NAME, LAST_NAME, EXP from emp_record_table
where EXP > (SELECT 10);

# 13. WAQ to create a stored procedure to retrieve the details of the employees whose experience is more than three years.
USE `emp_record`;
DROP procedure IF EXISTS `emp_exp`;

DELIMITER $$
USE `emp_record`$$
CREATE PROCEDURE `emp_exp` ()
BEGIN
select* from emp_record_table where exp > 3;
END$$

DELIMITER ;
call emp_exp();

# 14. WAQ using stored functions in the project table to check 
	# whether the job profile assigned to each employee in the data science team matches the organization's set standard.
    
# The standard being:
    /* 
    - For an employee EXP <= 2 			---- 		'JUNIOR DATA SCIENTIST'
    - For an employee EXP = 2 - 5 		------ 		'ASSOCIATE DATA SCIENTIST',
	- For an employee EXP = 5 - 10 		------		'SENIOR DATA SCIENTIST',
	- For an employee EXP = 10 - 12 	------		'LEAD DATA SCIENTIST',
	- For an employee EXP = 12 - 16 	------		 'MANAGER'.
*/

USE `emp_record`;
DROP function IF EXISTS `get_expected_profile`;

DELIMITER $$
USE `emp_record`$$
CREATE FUNCTION get_expected_profile(EXP FLOAT)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    RETURN 
        CASE
            WHEN EXP <= 2 THEN 'JUNIOR DATA SCIENTIST'
            WHEN EXP > 2 AND EXP <= 5 THEN 'ASSOCIATE DATA SCIENTIST'
            WHEN EXP > 5 AND EXP <= 10 THEN 'SENIOR DATA SCIENTIST'
            WHEN EXP > 10 AND EXP <= 12 THEN 'LEAD DATA SCIENTIST'
            WHEN EXP > 12 AND EXP <= 16 THEN 'MANAGER'
            ELSE 'UNDEFINED'
        END;
END;$$

DELIMITER ;

# To check the mismatch, run the following query
select EMP_ID, FIRST_NAME, LAST_NAME, 
ROLE as ACTUAL_PROFILE,
get_expected_profile(EXP) as EXPECTED_PROFILE
 from data_science_team
where ROLE <> get_expected_profile(EXP);

# AS A RESPOND TO THIS QUERY, WE GET EMPTY TABLE BECAUSE THERE'S NO MISMATCH ROLE, ALL EMPLOYEES ALREADY HAVE THE CORRECT JOB_PROFILE.

# 15. Create an index to improve the cost and performance of the query to 
		# find the employee whose FIRST_NAME is 'Eric' in the employee table after checking the execution plan.

# Before indexing, we can check how the query performs:
EXPLAIN SELECT* FROM emp_record_table where FIRST_NAME = 'Eric';

CREATE INDEX index_first_name ON emp_record_table(FIRST_NAME(10));

# recheck the execution plan
EXPLAIN SELECT* FROM emp_record_table where FIRST_NAME = 'Eric';
# or
show indexes from emp_record_table;

# 16. WAQ to calculate the bonus for all the employees, based on their ratings and salaries
	# (use the formula: 5% of salary * employee rating)

select EMP_ID, CONCAT(FIRST_NAME, ' ', LAST_NAME) AS NAME, EMP_RATING, SALARY,
(SALARY *0.05)*EMP_RATING AS BONUS from emp_record_table;

# 17. WAQ to calculate the average salary distribution based on the continent and country.
select CONTINENT, COUNTRY, 
AVG(SALARY) AS AVG_SALARY from emp_record_table
GROUP BY CONTINENT, COUNTRY
ORDER BY CONTINENT, COUNTRY;



