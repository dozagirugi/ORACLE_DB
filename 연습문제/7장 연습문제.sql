--1
SELECT DEPTNO,
TRUNC(AVG(SAL)) AS AVG_SAL,
MAX(SAL) AS MAX_SAL,
MIN(SAL) AS MIN_SAL,
COUNT(DEPTNO) AS CNT
FROM EMP
GROUP BY DEPTNO;

--2
SELECT JOB, 
COUNT(*)
FROM EMP
GROUP BY JOB
HAVING (COUNT(JOB) > 2);

--3
SELECT TO_CHAR(HIREDATE, 'YYYY') AS 입사년도,
DEPTNO AS 부서번호,
COUNT(DEPTNO) AS 부서별_입사년도
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'), DEPTNO
ORDER BY DEPTNO;

--4
SELECT NVL2(COMM, 'O' ,'X') AS EXIST_COMM,
COUNT(*) AS COUNT
FROM EMP
GROUP BY NVL2(COMM, 'O' ,'X');

SELECT COMM
FROM EMP;

--5
SELECT TO_CHAR(HIREDATE, 'YYYY') HIREYEAR,
DEPTNO,
COUNT(*) COUNT,
--COUNT(TO_CHAR(HIREDATE, 'YYYY')) CNT,
MAX(SAL) MAX_SAL,
SUM(SAL) SUM_SAL,
AVG(SAL) AVG_SAL
FROM EMP
GROUP BY TO_CHAR(HIREDATE, 'YYYY'),DEPTNO
ORDER BY DEPTNO, TO_CHAR(HIREDATE, 'YYYY');