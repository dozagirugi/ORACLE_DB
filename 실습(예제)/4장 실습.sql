-- ���� ���̺� ���캸��
-- DESC�� ���̺��� ���� �󼼺��� ��ɾ��̴�
DESC EMP;

-- �μ� ���̺� ���� ���캸��
DESC DEPT; 

-- �޿� ���̺� ���� ���캸��
DESC SALGRADE;

-- 4�� �ǽ� 
SELECT *
FROM EMP;

SELECT EMPNO, ENAME
FROM EMP;

-- �ߺ� ������ ����
SELECT DISTINCT JOB
FROM EMP;

-- �ĺ��ϱ� ���� �ǹ��ִ� ��Ī �����ϱ�, ���� ��Ģ������ �����ϴ�
SELECT ENAME, SAL, SAL*12+COMM "����", COMM
FROM EMP;

-- ORDER BY ����ϱ�
SELECT *
FROM EMP
ORDER BY SAL;

-- ���� ����
SELECT *
FROM EMP
ORDER BY SAL DESC;