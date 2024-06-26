--6장 실습
--단일행 함수
--문자 함수 (UPPER: 대문자, LOWER: 소문자, INITCAP: 첫글자만 대문자)
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

--명령어와 테이블명은 대/소문자를 따지지 않지만 문자열 데이터는 대/소문자를 따지기 때문에 조회시 UPPER를 씌우자
SELECT * FROM EMP
WHERE ENAME = UPPER('smith');

--문자열 길이를 구하는 함수 LENGTH()
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

--문자열의 용량(바이트)값을 출력하는 함수 LENGTHB()
SELECT LENGTH('한글'), LENGTHB('한글')
FROM DUAL;

--문자열 잘라내기 SUBSTR(문자열, 시작위치, 길이) *끝까지 자르고 싶을때는 길이 입력은 생략 가능*
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)
FROM EMP;

--특정 문자 위치 찾기 INSTR(문자열, 찾을 문자, 시작 위치, 몇 번째?)
SELECT INSTR('HELLO WORLD','L') AS FIRST_INSTR,
INSTR('HELLO WORLD','L',5) AS SECOND_INSTR,
INSTR('HELLO WORLD','L',2,2) AS THIRD_INSTR --두번째 문자에서부터 찾고('E') 찾은 문자들('L') 중 두번째로 나온 문자의 위치를 출력해라!
FROM DUAL;

--특정 문자를 다른 문자로 바꾸는 REPLACE
SELECT '010-1234-5678' AS BEFORE,
REPLACE('010-1234-5678', '-', '*') AS FIRST_AFTER,
REPLACE('010-1234-5678', '-') AS SECOND_AFTER
FROM DUAL;

--빈 공간을 채우는 LPAD(LEFT PADDING), RPAD(RIGHT PADDING)
SELECT 'ORACLE',
LPAD('ORACLE', 10, '*') AS LEFT_PAD,
RPAD('ORACLE', 10, '~') AS RIGHT_PAD,
LPAD('ORACLE', 10) AS LEFT_PAD2,
RPAD('ORACLE', 10) AS RIGHT_PAD2
FROM DUAL;

--두 문자열을 합치는 CONCAT
SELECT CONCAT(EMPNO, ENAME),
CONCAT(EMPNO, CONCAT (' : ', ENAME))
FROM EMP
WHERE ENAME = 'JAMES';

--특정 문자를 제거해주는 'trim', 'ltrim', 'rtrim'
--특정 문자가 없을 경우 공백을 제거한다 (기본)
SELECT '[' || TRIM('  Oracle  ') || ']' AS TRIM,
'[' || TRIM(LEADING '*' FROM '**Oracle**') || ']' AS LTRIM,
'[' || TRIM(TRAILING '*' FROM '**Oracle**') || ']' AS RTRIM,
'[' || TRIM(BOTH FROM '  Oracle  ') || ']' AS BOTH
FROM DUAL;

SELECT TRIM('   Oracle   ') AS TRIM,
TRIM(LEADING FROM '   Oracle   ') AS LTRIM,
TRIM(TRAILING FROM '   Oracle   ') AS RTRIM,
TRIM(BOTH  FROM '   Oracle   ') AS BOTH
FROM DUAL;

--숫자 관련 함수
--1)ROUND([실수], [반올림 할 위치]): 특정 자리에서부터 반올림 한다 (자릿수가 마이너스일때는 소수점 위를 의미함)
SELECT ROUND(1234.5678) AS ROUND,
ROUND(1234.5678, 0) AS ROUND_0,
ROUND(1234.5678, 1) AS ROUND_1,
ROUND(1234.5678, 2) AS ROUND_2,
ROUND(1234.5678, 3) AS ROUND_3,
ROUND(1267.5678, -1) AS ROUND_M1,
ROUND(1267.5678, -2) AS ROUND_M2
FROM DUAL;

--2)TRUNC(숫자, 버릴 자리 위치) :특정 자리에서부터 버린다.
SELECT TRUNC(1234.5678) AS TRUNC,
TRUNC(1234.5678, 1) AS TRUNC_1,
TRUNC(1234.5678, 2) AS TRUNC_2,
TRUNC(1234.5678, -1) AS TRUNC_M1,
TRUNC(1234.5678, -2) AS TRUNC_M2
FROM DUAL;

--가까운 정수 CEIL(올림), FLOOR(내림)
SELECT CEIL(3.14),
FLOOR(3.14),
CEIL(-3.14),
FLOOR(-3.14)
FROM DUAL;

--나눈 나머지 값 MOD -> JAVA에서는 %연산자와 같다
SELECT MOD(15,6),
MOD(10,2),
MOD(11,2)
FROM DUAL;

--날짜를 다루는 함수
--sysdate는 현재 날짜.

SELECT SYSDATE AS 오늘,
SYSDATE -1 AS 어제,
SYSDATE -2 AS 그제,
SYSDATE +1 AS 내일,
SYSDATE +2 AS 모레
FROM DUAL;

--ADD_MONTH 몇 개월 이후 날짜
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 6)
FROM DUAL;

--입사 10주년 되는 사원들의 데이터를 출력하라
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
FROM EMP;

--두 날짜 간의 개월 수 차이 MONTHS_BETWEEN
SELECT EMPNO, ENAME, HIREDATE, SYSDATE, 
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS 근무개월수,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS 근무개월수_정수
FROM EMP;

--NEXT_DAY(기준 날짜, 원하는 요일): 기준 날짜 이후의 다음 원하는 요일
--LAST_DAY(기준 날짜): 기준 날짜 해당 달의 마지막 날
SELECT SYSDATE, 
NEXT_DAY(SYSDATE, '월요일'),
LAST_DAY(SYSDATE)
FROM DUAL;

--날짜도 ROUND(반올림), 버림(TRUNC)가 가능하다
SELECT SYSDATE, 
ROUND(SYSDATE, 'YYYY') AS YEAR,
ROUND(SYSDATE, 'MM') AS MONTH,
ROUND(SYSDATE, 'DD') AS DAY,
ROUND(SYSDATE, 'HH') AS HOUR
FROM DUAL;

SELECT SYSDATE, 
TRUNC(SYSDATE, 'YYYY') AS YEAR,
TRUNC(SYSDATE, 'MM') AS MONTH,
TRUNC(SYSDATE, 'DD') AS DAY,
TRUNC(SYSDATE, 'HH') AS HOUR
FROM DUAL;

--형 변환 함수
--TO_CHAR: 숫자/날짜 => 문자
--TO_NUMBER: 문자 => 숫자
--TO_DATE: 문자 => 날짜

--0)자동변환: 숫자(EMPNO)랑 문자('100000')를 더하면 자동으로 숫자 연산으로 변환된다
SELECT EMPNO, EMPNO+'100000', ENAME
FROM EMP
WHERE ENAME = 'JAMES';

--1)TO_CHAR *기준 날짜 뒤에 포맷 규칙을 꼭 지켜야한다*
--포맷 사이의 기호는 자유
SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH-DD-DAY//HH24:MI') AS 현재날짜시간
FROM DUAL;

--9는 자리수를 의미한다(다른 숫자는 안되고 9만 된다) 
--','는 소수점을 표시하는 자리를 나타낸다
SELECT SAL AS 월급, 
TO_CHAR(SAL, '$999,999') AS 달러,
TO_CHAR(SAL, 'L999,999') AS 현지통화,
TO_CHAR(SAL, '999,999.99999') AS 소수점
FROM EMP;

--2)TO_NUMBER
SELECT TO_NUMBER('2,000', '999,999') - TO_NUMBER('1,500', '999,999')
FROM DUAL;

--3)TO_DATE
--변경하려는 날짜와 원하는 결과 날짜 포맷이 대응이 되어야 한다.
SELECT TO_DATE('20240404', 'YYYYMMDD') AS 현재날짜,
TO_DATE('2024-04-04', 'YY-MM-DD') AS 현재날짜
FROM DUAL;

--NULL 처리 함수 
--1)NVL
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
NVL(COMM, 0) AS RESULT_COMM,
SAL + NVL(COMM, 0) AS RESULT_SALCOMM
FROM EMP;

--2)NVL2
SELECT EMPNO, ENAME, COMM,
NVL2(COMM, 'O', 'X') AS 커미션받는여부,
NVL2(COMM, SAL*12+COMM, SAL*12) AS 통합연봉
FROM EMP;

--조건에 맞는 데이터 반환 :DECODE함수와 CASE문
--1)DECODE
SELECT EMPNO, ENAME, JOB, SAL AS 연봉,
DECODE(JOB, --검사대상이 될 데이터
'MANAGER', SAL*1.1, --'MANAGER'일 경우 SAL*1.1 출력하기
'SALESMAN', SAL*1.05, --'SALESMAN'일 경우 SAL*1.05 출력하기
'ANALYST', SAL, --'ANALYST'일 경우 SAL 출력하기
SAL*1.03) AS 연봉인상후 --그 외의 직업들은 모두 SAL*1.03 출력하기
FROM EMP;

--2)CASE: DECODE문과 사용방법이 똑같다
--<DECODE와의 차이점>
--1. 괄호와 콤마를 사용하지 않는다. 
--2. 대신 'WHEN', 'THEN'을 사용한다. 
--3. 마지막에 END를 입력해야한다
SELECT EMPNO, ENAME, JOB, SAL AS 연봉,
CASE JOB
WHEN 'MANAGER' THEN SAL*1.1
WHEN 'SALESMAN' THEN SAL*1.05
WHEN 'ANALYST' THEN SAL
ELSE SAL*1.03
END AS 연봉인상후
FROM EMP;