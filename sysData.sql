--CREATE USER ���̵� IDENTIFIED BY ��й�ȣ; --���̵�, ��� ����� ��
alter session set "_ORACLE_SCRIPT"=true; --12c�������ʹ� ���̵� ���鶧 c##�� �ٿ���� ������ ������ ��ɹ��� ġ�� ����ó�� �������� ���� ����
CREATE USER KHS IDENTIFIED BY oracle;

-- ���� �Ǵ� ���� �����ؾ� ���Ӱ���
GRANT connect, resource, create table to KHS; -- ����, �ڿ�����, ���̺���� ���� ����
