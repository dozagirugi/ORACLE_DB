-- 7�� �ǽ�
SELECT COUNT(ENAME), SUM(SAL)
FROM EMP;

--COUNT(*)�� ��� ��, ���� NULL���̸� ���� ����.
SELECT COUNT(*), COUNT(MGR)
FROM EMP;

--�ִ밪 �ּҰ� ��� ���
SELECT MAX(SAL) AS �ְ����, MIN(SAL) AS ��������, TRUNC(AVG(SAL)) AS ��տ���
FROM EMP;

--ȸ����� �ο��� ���� ���, �ְ�/���� ���� ���
SELECT COUNT(ENAME) AS ȸ����ο�, 
MAX(SAL) AS ȸ���_�ְ����, 
MIN(SAL) AS ȸ���_��������, 
TRUNC(AVG(SAL)) AS ȸ���_�������
FROM EMP
WHERE DEPTNO = 10;

--GROUP BY �Լ��� �μ� �� �ο�, �ְ�/���� ����, ��� ���� ����ϱ�
SELECT DEPTNO,
COUNT(ENAME) AS ȸ����ο�, 
MAX(SAL) AS ȸ���_�ְ����, 
MIN(SAL) AS ȸ���_��������, 
TRUNC(AVG(SAL)) AS ȸ���_�������
FROM EMP
GROUP BY DEPTNO;

-- HAVING�� GROUP BY�� ���� ������ ��Ÿ����
-- ���� �� ���������� 2000�̻��� ��쿡�� ����϶�
SELECT JOB,
COUNT(ENAME) AS ȸ����ο�, 
MAX(SAL) AS ȸ���_�ְ����, 
MIN(SAL) AS ȸ���_��������, 
TRUNC(AVG(SAL)) AS ȸ���_�������
FROM EMP
GROUP BY JOB
HAVING MIN(SAL)> 1000
ORDER BY TRUNC(AVG(SAL));