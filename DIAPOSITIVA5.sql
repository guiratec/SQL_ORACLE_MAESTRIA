/* SET SERVEROUTPUT ON
DECLARE
v_sumsalary EMPLOYEES.SALARY%TYPE;
BEGIN
 SELECT SUM(SALARY) INTO v_sumsalary FROM EMPLOYEES WHERE DEPARTMENT_ID = 90;
 DBMS_OUTPUT.PUT_LINE('la suma del salario es: ' || TO_CHAR(v_sumsalary));
END;
/ */

--============= EJERCICIO 2======
--SET SERVEROUTPUT ON

--select LAST_NAME,SALARY from EMPLOYEES where job_id = 'ST_CLERK';
/* COLUMN EMPLOYEE_ID FORMAT A8
COLUMN FIRST_NAME FORMAT A10
COLUMN JOB_ID FORMAT A10
COLUMN SALARY FORMAT A8
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY FROM EMPLOYEES WHERE JOB_ID = 'ST_CLERK'; */

/* DECLARE

v_puesto EMPLOYEES.JOB_ID%TYPE := 'ST_CLERK';

v_aumento EMPLOYEES.SALARY%TYPE := 500;--CUALQUIER CANTIDAD

BEGIN

 UPDATE EMPLOYEES 

 SET SALARY =SALARY+v_aumento 

 WHERE job_id = v_puesto;

 DBMS_OUTPUT.PUT_LINE('filas afectadas :'|| SQL%ROWCOUNT);

 COMMIT;

END; */

--============= EJERCICIO 3======
/* SET SERVEROUTPUT ON
--SELECT DEPARTMENT_ID FROM EMPLOYEES WHERE DEPARTMENT_ID=10;
DECLARE
v_idDepartamentoDelet EMPLOYEES.DEPARTMENT_ID%TYPE := 10;
BEGIN
 DELETE FROM EMPLOYEES  
 WHERE DEPARTMENT_ID = v_idDepartamentoDelet;
 DBMS_OUTPUT.PUT_LINE('filas afectadas :'|| SQL%ROWCOUNT);
 COMMIT;
END;
/ */

/* SET SERVEROUTPUT ON
DECLARE
  TOTAL_EMP NUMBER;
BEGIN
  SELECT COUNT (DEPARTMENT_ID) INTO TOTAL_EMP FROM EMPLOYEES
  WHERE DEPARTMENT_ID=10;
  DELETE FROM EMPLOYEES WHERE DEPARTMENT_ID=10;
  DBMS_OUTPUT.PUT_LINE('Se eliminaron '||TOTAL_EMP||' Empleados');
END;
/ */
--=================================================
--ESTE COMANDO LO QUE HACE ES VER LAS RESTRICCIONES KEY 
--FOREANA PARA ELIMINAR EN CASSCADA
--====================================================
/* SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, DELETE_RULE
  FROM USER_CONSTRAINTS
  WHERE TABLE_NAME='EMPLOYEES'; */
  
------------ CONSULTAR REGLAS CONSTRAINT EN TABLA DEPARTAMENTOS  
/* SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, DELETE_RULE
  FROM USER_CONSTRAINTS
  WHERE TABLE_NAME='DEPARTMENTS'; */
 
-------- ELIMNAR CLAVE FORANEA DE EM_DEPARTMENT_ID_FK 
  /* ALTER TABLE EMPLOYEES
    DROP CONSTRAINT EMP_DEPT_FK; */

---------AGREGAR NUEVA CLAVE FORANEA CON RESTRICCION EN CASCADA  
/* ALTER TABLE EMPLOYEES
ADD CONSTRAINT EMP_DEPT_FK
FOREIGN KEY (DEPARTMENT_ID)
REFERENCES DEPARTMENTS(DEPARTMENT_ID)
ON DELETE CASCADE; */
---------------------------------------------------------------

--============= EJERCICIO 4======

/* SET SERVEROUTPUT ON
DECLARE
v_numdepartalto DEPARTMENTS.DEPARTMENT_ID%TYPE; 
BEGIN
 SELECT MAX(DEPARTMENT_ID) INTO v_numdepartalto
 FROM DEPARTMENTS;
 DBMS_OUTPUT.PUT_LINE('El numero de departamento mas alto es:'|| v_numdepartalto);
END;
/ */

--============= EJERCICIO 5======

/*SET SERVEROUTPUT ON

DECLARE
v_numdepartalto DEPARTMENTS.DEPARTMENT_ID%TYPE; 

BEGIN
  SELECT MAX(DEPARTMENT_ID) INTO v_numdepartalto 
  FROM DEPARTMENTS;

  DECLARE
  v_nombredepartment DEPARTMENTS.DEPARTMENT_NAME%TYPE; 
  BEGIN
   v_nombredepartment := 'Logistica';

   INSERT INTO DEPARTMENTS

   VALUES (v_numdepartalto+10,v_nombredepartment, NULL, NULL);

   DBMS_OUTPUT.PUT_LINE('DEPARTMENT_ID: '||(v_numdepartalto+10)||' DEPARTMENT_NAME: '||v_nombredepartment||' MANAGER_ID: '||'NULL'||' LOCATION_ID: '||'NULL');

   COMMIT;

  END;
END;
/
*/

/*=======================================
 \^o^/_______ EJERCICIO 6 ________\^o^/
=======================================*/

/*SET SERVEROUTPUT ON

DECLARE

p_deptno DEPARTMENTS.DEPARTMENT_ID%TYPE:=280; 

p_loc DEPARTMENTS.LOCATION_ID%TYPE;

BEGIN

 p_loc := 1700;

 UPDATE DEPARTMENTS

  SET DEPARTMENTS.LOCATION_ID = p_loc

 WHERE DEPARTMENTS.DEPARTMENT_ID = p_deptno;

 DBMS_OUTPUT.PUT_LINE('filas afectadas :'|| SQL%ROWCOUNT);

 COMMIT;

  
 DECLARE

 DEPARTAMENTOS DEPARTMENTS%ROWTYPE;

 BEGIN

   SELECT *

   INTO DEPARTAMENTOS

   FROM DEPARTMENTS WHERE DEPARTMENTS.DEPARTMENT_ID = p_deptno;

   DBMS_OUTPUT.PUT_LINE('DEPARTMENT_ID: '||(DEPARTAMENTOS.DEPARTMENT_ID)||' DEPARTMENT_NAME: '||DEPARTAMENTOS.DEPARTMENT_NAME||' MANAGER_ID: '||DEPARTAMENTOS.MANAGER_ID||' LOCATION_ID: '||DEPARTAMENTOS.LOCATION_ID);

 END;  

END;
/
*/

/*=======================================
 \^o^/_______ EJERCICIO 7 ________\^o^/
=======================================*/
/*SET SERVEROUTPUT ON

DECLARE

p_deptno DEPARTMENTS.DEPARTMENT_ID%TYPE;

BEGIN  

 p_deptno:=280;

 DELETE FROM DEPARTMENTS WHERE DEPARTMENTS.DEPARTMENT_ID=p_deptno;

 DBMS_OUTPUT.PUT_LINE('filas afectadas :'|| SQL%ROWCOUNT);

 COMMIT;

END;
/
*/

/*=======================================
 \^o^/_______ EJERCICIO 8 ________\^o^/
=======================================*/
/*
SET SERVEROUTPUT ON
DECLARE
  TYPE TELEFONOS IS VARRAY(10) OF NUMBER;
  TELF TELEFONOS;
BEGIN
    TELF:= TELEFONOS(36541,36542,36543,36544,36545,36546,36547,36548,36549,36550);
    FOR ROW1 IN 1..TELF.COUNT LOOP
      DBMS_OUTPUT.PUT_LINE ('El Telefono #'||ROW1||' - '||TELF(ROW1));
    END LOOP;
END;
/
*/

/*=======================================
__________ FIN DIAPOSITIVA 5 _______
=======================================*/