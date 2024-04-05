-- 5�� �ǽ�
SELECT *
FROM EMP
WHERE DEPTNO = 30;

-- �����ȣ�� 7782�� ������� ����ض�.
SELECT *
FROM EMP
WHERE EMPNO = 7782;

-- 30�� �μ��̸鼭 ������ ��������� ������� ����϶�
SELECT *
FROM EMP
WHERE DEPTNO = 30 AND JOB = 'SALESMAN';

-- �����ȣ 7499 �׸��� �μ���ȣ 30�� ���
SELECT *
FROM EMP
WHERE DEPTNO = 30 AND EMPNO = 7499;

-- �μ� ��ȣ�� 20���̰ų� ������ ��������� ��� ���
SELECT *
FROM EMP
WHERE DEPTNO = 20 OR JOB = 'SALESMAN'
ORDER BY DEPTNO, ENAME;

-- ���ڷ� ���굵 �����ϴ� ! -> ���ĺ� ���̴�
SELECT ENAME
FROM EMP
WHERE ENAME <= 'G'
ORDER BY ENAME;

SELECT *
FROM EMP
WHERE SAL != 3000;

-- �� ���� ������ NOT
-- ���� ������ ���� �����̴�.
SELECT *
FROM EMP
WHERE NOT SAL = 3000;

-- IN ������ (OR�� ����)
SELECT *
FROM EMP
--WHERE JOB = 'MANAGER'
--OR JOB = 'SALESMAN'
--OR JOB = 'CLERK';
WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK')
ORDER BY JOB;

-- NOT IN ������ 
SELECT *
FROM EMP
--WHERE JOB != 'MANAGER'
--AND JOB != 'SALESMAN'
--AND JOB != 'CLERK';
WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK')
ORDER BY JOB;

-- BETWEEN A AND B ������ (A�� B������ ��)
SELECT *
FROM EMP
--WHERE SAL >= 2000 AND SAL <=3000
WHERE SAL BETWEEN 2000 AND 3000
ORDER BY SAL;

SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

-- �̸��� AM�� ���ԵǾ� �ִ� ����� ã�ƶ�
SELECT *
FROM EMP
WHERE ENAME LIKE '%AM%';

-- Null ���� �����ڴ� 'IS NULL' OR 'IS NOT NULL' �� �����ϴ�
SELECT * FROM EMP
WHERE COMM IS NULL;

SELECT * FROM EMP
WHERE COMM IS NOT NULL;

-- ���� ������(*����* ������ ���Ʒ� �ִ� ������ ����Ʈ ���� �����Ͱ� �Ȱ��ƾ� �Ѵ�) 
-- 1)UNION : �ߺ��� ���ѵǴ� ������
-- 2)UNION ALL : �ߺ��� ���Ǵ� ������
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 20;
-- 3)MINUS : ������
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;
-- 4)INTERSECT : ������
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
FROM EMP
WHERE DEPTNO = 10;