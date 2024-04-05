--6�� �ǽ�
--������ �Լ�
--���� �Լ� (UPPER: �빮��, LOWER: �ҹ���, INITCAP: ù���ڸ� �빮��)
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME)
FROM EMP;

--��ɾ�� ���̺���� ��/�ҹ��ڸ� ������ ������ ���ڿ� �����ʹ� ��/�ҹ��ڸ� ������ ������ ��ȸ�� UPPER�� ������
SELECT * FROM EMP
WHERE ENAME = UPPER('smith');

--���ڿ� ���̸� ���ϴ� �Լ� LENGTH()
SELECT ENAME, LENGTH(ENAME)
FROM EMP;

--���ڿ��� �뷮(����Ʈ)���� ����ϴ� �Լ� LENGTHB()
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�')
FROM DUAL;

--���ڿ� �߶󳻱� SUBSTR(���ڿ�, ������ġ, ����) *������ �ڸ��� �������� ���� �Է��� ���� ����*
SELECT JOB, SUBSTR(JOB,1,2), SUBSTR(JOB,3,2), SUBSTR(JOB,5)
FROM EMP;

--Ư�� ���� ��ġ ã�� INSTR(���ڿ�, ã�� ����, ���� ��ġ, �� ��°?)
SELECT INSTR('HELLO WORLD','L') AS FIRST_INSTR,
INSTR('HELLO WORLD','L',5) AS SECOND_INSTR,
INSTR('HELLO WORLD','L',2,2) AS THIRD_INSTR --�ι�° ���ڿ������� ã��('E') ã�� ���ڵ�('L') �� �ι�°�� ���� ������ ��ġ�� ����ض�!
FROM DUAL;

--Ư�� ���ڸ� �ٸ� ���ڷ� �ٲٴ� REPLACE
SELECT '010-1234-5678' AS BEFORE,
REPLACE('010-1234-5678', '-', '*') AS FIRST_AFTER,
REPLACE('010-1234-5678', '-') AS SECOND_AFTER
FROM DUAL;

--�� ������ ä��� LPAD(LEFT PADDING), RPAD(RIGHT PADDING)
SELECT 'ORACLE',
LPAD('ORACLE', 10, '*') AS LEFT_PAD,
RPAD('ORACLE', 10, '~') AS RIGHT_PAD,
LPAD('ORACLE', 10) AS LEFT_PAD2,
RPAD('ORACLE', 10) AS RIGHT_PAD2
FROM DUAL;

--�� ���ڿ��� ��ġ�� CONCAT
SELECT CONCAT(EMPNO, ENAME),
CONCAT(EMPNO, CONCAT (' : ', ENAME))
FROM EMP
WHERE ENAME = 'JAMES';

--Ư�� ���ڸ� �������ִ� 'trim', 'ltrim', 'rtrim'
--Ư�� ���ڰ� ���� ��� ������ �����Ѵ� (�⺻)
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

--���� ���� �Լ�
--1)ROUND([�Ǽ�], [�ݿø� �� ��ġ]): Ư�� �ڸ��������� �ݿø� �Ѵ� (�ڸ����� ���̳ʽ��϶��� �Ҽ��� ���� �ǹ���)
SELECT ROUND(1234.5678) AS ROUND,
ROUND(1234.5678, 0) AS ROUND_0,
ROUND(1234.5678, 1) AS ROUND_1,
ROUND(1234.5678, 2) AS ROUND_2,
ROUND(1234.5678, 3) AS ROUND_3,
ROUND(1267.5678, -1) AS ROUND_M1,
ROUND(1267.5678, -2) AS ROUND_M2
FROM DUAL;

--2)TRUNC(����, ���� �ڸ� ��ġ) :Ư�� �ڸ��������� ������.
SELECT TRUNC(1234.5678) AS TRUNC,
TRUNC(1234.5678, 1) AS TRUNC_1,
TRUNC(1234.5678, 2) AS TRUNC_2,
TRUNC(1234.5678, -1) AS TRUNC_M1,
TRUNC(1234.5678, -2) AS TRUNC_M2
FROM DUAL;

--����� ���� CEIL(�ø�), FLOOR(����)
SELECT CEIL(3.14),
FLOOR(3.14),
CEIL(-3.14),
FLOOR(-3.14)
FROM DUAL;

--���� ������ �� MOD -> JAVA������ %�����ڿ� ����
SELECT MOD(15,6),
MOD(10,2),
MOD(11,2)
FROM DUAL;

--��¥�� �ٷ�� �Լ�
--sysdate�� ���� ��¥.

SELECT SYSDATE AS ����,
SYSDATE -1 AS ����,
SYSDATE -2 AS ����,
SYSDATE +1 AS ����,
SYSDATE +2 AS ��
FROM DUAL;

--ADD_MONTH �� ���� ���� ��¥
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 6)
FROM DUAL;

--�Ի� 10�ֳ� �Ǵ� ������� �����͸� ����϶�
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR
FROM EMP;

--�� ��¥ ���� ���� �� ���� MONTHS_BETWEEN
SELECT EMPNO, ENAME, HIREDATE, SYSDATE, 
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS �ٹ�������,
TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS �ٹ�������_����
FROM EMP;

--NEXT_DAY(���� ��¥, ���ϴ� ����): ���� ��¥ ������ ���� ���ϴ� ����
--LAST_DAY(���� ��¥): ���� ��¥ �ش� ���� ������ ��
SELECT SYSDATE, 
NEXT_DAY(SYSDATE, '������'),
LAST_DAY(SYSDATE)
FROM DUAL;

--��¥�� ROUND(�ݿø�), ����(TRUNC)�� �����ϴ�
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

--�� ��ȯ �Լ�
--TO_CHAR: ����/��¥ => ����
--TO_NUMBER: ���� => ����
--TO_DATE: ���� => ��¥

--0)�ڵ���ȯ: ����(EMPNO)�� ����('100000')�� ���ϸ� �ڵ����� ���� �������� ��ȯ�ȴ�
SELECT EMPNO, EMPNO+'100000', ENAME
FROM EMP
WHERE ENAME = 'JAMES';

--1)TO_CHAR *���� ��¥ �ڿ� ���� ��Ģ�� �� ���Ѿ��Ѵ�*
--���� ������ ��ȣ�� ����
SELECT TO_CHAR(SYSDATE, 'YYYY/MONTH-DD-DAY//HH24:MI') AS ���糯¥�ð�
FROM DUAL;

--9�� �ڸ����� �ǹ��Ѵ�(�ٸ� ���ڴ� �ȵǰ� 9�� �ȴ�) 
--','�� �Ҽ����� ǥ���ϴ� �ڸ��� ��Ÿ����
SELECT SAL AS ����, 
TO_CHAR(SAL, '$999,999') AS �޷�,
TO_CHAR(SAL, 'L999,999') AS ������ȭ,
TO_CHAR(SAL, '999,999.99999') AS �Ҽ���
FROM EMP;

--2)TO_NUMBER
SELECT TO_NUMBER('2,000', '999,999') - TO_NUMBER('1,500', '999,999')
FROM DUAL;

--3)TO_DATE
--�����Ϸ��� ��¥�� ���ϴ� ��� ��¥ ������ ������ �Ǿ�� �Ѵ�.
SELECT TO_DATE('20240404', 'YYYYMMDD') AS ���糯¥,
TO_DATE('2024-04-04', 'YY-MM-DD') AS ���糯¥
FROM DUAL;

--NULL ó�� �Լ� 
--1)NVL
SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM,
NVL(COMM, 0) AS RESULT_COMM,
SAL + NVL(COMM, 0) AS RESULT_SALCOMM
FROM EMP;

--2)NVL2
SELECT EMPNO, ENAME, COMM,
NVL2(COMM, 'O', 'X') AS Ŀ�̼ǹ޴¿���,
NVL2(COMM, SAL*12+COMM, SAL*12) AS ���տ���
FROM EMP;

--���ǿ� �´� ������ ��ȯ :DECODE�Լ��� CASE��
--1)DECODE
SELECT EMPNO, ENAME, JOB, SAL AS ����,
DECODE(JOB, --�˻����� �� ������
'MANAGER', SAL*1.1, --'MANAGER'�� ��� SAL*1.1 ����ϱ�
'SALESMAN', SAL*1.05, --'SALESMAN'�� ��� SAL*1.05 ����ϱ�
'ANALYST', SAL, --'ANALYST'�� ��� SAL ����ϱ�
SAL*1.03) AS �����λ��� --�� ���� �������� ��� SAL*1.03 ����ϱ�
FROM EMP;

--2)CASE: DECODE���� ������� �Ȱ���
--<DECODE���� ������>
--1. ��ȣ�� �޸��� ������� �ʴ´�. 
--2. ��� 'WHEN', 'THEN'�� ����Ѵ�. 
--3. �������� END�� �Է��ؾ��Ѵ�
SELECT EMPNO, ENAME, JOB, SAL AS ����,
CASE JOB
WHEN 'MANAGER' THEN SAL*1.1
WHEN 'SALESMAN' THEN SAL*1.05
WHEN 'ANALYST' THEN SAL
ELSE SAL*1.03
END AS �����λ���
FROM EMP;