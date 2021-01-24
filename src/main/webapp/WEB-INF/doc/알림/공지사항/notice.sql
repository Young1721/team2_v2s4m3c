/**********************************/
/* Table Name: �������� */
/**********************************/

DROP TABLE notice;
CREATE TABLE notice(
    noticeno           NUMBER(10)    NOT NULL       PRIMARY KEY,
    head               CLOB          NOT NULL,
    content            CLOB          NOT NULL,
    rdate              DATE          NOT NULL,
    count              NUMBER(10)    DEFAULT 0      NOT NULL,
    visible            CHAR(1)       DEFAULT 'Y'    NOT NULL        
);

COMMENT ON TABLE notice is '��������';
COMMENT ON COLUMN notice.noticeno is '������ȣ';
COMMENT ON COLUMN notice.head is '����';
COMMENT ON COLUMN notice.content is '����';
COMMENT ON COLUMN notice.rdate is '�����';
COMMENT ON COLUMN notice.count is '��ȸ��';
COMMENT ON COLUMN notice.visible is '��¸��';

DROP SEQUENCE notice_seq;
-- create ���
CREATE SEQUENCE notice_seq
  START WITH 1        -- ���� ��ȣ
  INCREMENT BY 1      -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2             -- 2���� �޸𸮿����� ���
  NOCYCLE;            -- �ٽ� 1���� �����Ǵ� ���� ����


INSERT INTO notice(noticeno, head, content, rdate, count, visible)
VALUES(notice_seq.nextval, '��������1', '������1', sysdate, '0', 'Y');

INSERT INTO notice(noticeno, head, content, rdate, count, visible)
VALUES(notice_seq.nextval, '��������2', '������2', sysdate, '0', 'Y');

INSERT INTO notice(noticeno, head, content, rdate, count, visible)
VALUES(notice_seq.nextval, '��������3', '������3', sysdate, '0', 'Y');


SELECT*FROM notice;

--list ���
SELECT noticeno, head, content, rdate, count, visible
FROM notice
ORDER BY noticeno ASC;
  NOTICENO HEAD          CONTENT         RDATE         COUNT   visible
---------- ----------- ----------------- -------- ---------- --------------
         1 ��������1     ������1           20/10/27          0   Y
         2 ��������2     ������2           20/10/27          0   Y
         3 ��������3     ������3           20/10/27          0   Y

COMMIT;

--read ��ȸ
SELECT noticeno, head, content, rdate, count,  visible
FROM notice
WHERE noticeno=2;
 NOTICENO HEAD          CONTENT         RDATE         COUNT   visible
---------- ---------  -------------  -------------  --------  --------------
         2 ��������2     ������2         20/10/27          0    Y
         
--update ����
UPDATE notice
SET head='����ȳ�', content='����ʼ�����.....', visible='N'
WHERE noticeno=1;
NOTICENO      HEAD        CONTENT            RDATE        COUNT     visible
---------- ------------- ---------------   -----------   ---------  ---------
         1 ����ȳ�       ����ʼ�����....     20/10/27           0    N


--delete ����
DELETE FROM notice 
WHERE noticeno=3;

SELECT*FROM notice;
NOTICENO HEAD            CONTENT         RDATE           COUNT        visible
---------- ----------- ---------------   --------------- -------- ------------
         1 ����ȳ�     ����ʼ�����....    20/10/27          0       N
         2 ��������2     ������2           20/10/27          0       Y
