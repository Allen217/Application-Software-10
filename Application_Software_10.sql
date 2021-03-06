CREATE TABLE EMPL (
NAME CHAR(15),
DOB DATE,
SALARY INT(11)
);
DELIMITER  //
CREATE PROCEDURE EMP_TAB()
BEGIN
DECLARE done INT DEFAULT FALSE;
    DECLARE EMP_NAME CHAR(15);
    DECLARE EMP_DOB DATE;
    DECLARE EMP_SALARY INT(8);
    DECLARE EMP_RECORD CURSOR FOR SELECT NAME,DOB,SALARY FROM EMPLOYEE;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET DONE = TRUE;
    OPEN EMP_RECORD;
    READ_LOOP: LOOP
FETCH EMP_RECORD INTO EMP_NAME, EMP_DOB,EMP_SALARY;
        IF DONE THEN
LEAVE READ_LOOP;
END IF;
        INSERT INTO EMPL VALUES (EMP_NAME,EMP_DOB,EMP_SALARY);
END LOOP;
    CLOSE EMP_RECORD;
END; //
DELIMITER ;

  CALL EMP_TAB;
  SELECT * FROM EMPL;
  
