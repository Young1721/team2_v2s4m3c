/**********************************/
/* Table Name: 공지사항 */
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

COMMENT ON TABLE notice is '공지사항';
COMMENT ON COLUMN notice.noticeno is '공지번호';
COMMENT ON COLUMN notice.head is '제목';
COMMENT ON COLUMN notice.content is '내용';
COMMENT ON COLUMN notice.rdate is '등록일';
COMMENT ON COLUMN notice.count is '조회수';
COMMENT ON COLUMN notice.visible is '출력모드';

DROP SEQUENCE notice_seq;
-- create 등록
CREATE SEQUENCE notice_seq
  START WITH 1        -- 시작 번호
  INCREMENT BY 1      -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2             -- 2번은 메모리에서만 계산
  NOCYCLE;            -- 다시 1부터 생성되는 것을 방지


INSERT INTO notice(noticeno, head, content, rdate, count, visible)
VALUES(notice_seq.nextval, '공지사항1', '공지글1', sysdate, '0', 'Y');

INSERT INTO notice(noticeno, head, content, rdate, count, visible)
VALUES(notice_seq.nextval, '공지사항2', '공지글2', sysdate, '0', 'Y');

INSERT INTO notice(noticeno, head, content, rdate, count, visible)
VALUES(notice_seq.nextval, '공지사항3', '공지글3', sysdate, '0', 'Y');


SELECT*FROM notice;

--list 목록
SELECT noticeno, head, content, rdate, count, visible
FROM notice
ORDER BY noticeno ASC;
  NOTICENO HEAD          CONTENT         RDATE         COUNT   visible
---------- ----------- ----------------- -------- ---------- --------------
         1 공지사항1     공지글1           20/10/27          0   Y
         2 공지사항2     공지글2           20/10/27          0   Y
         3 공지사항3     공지글3           20/10/27          0   Y

COMMIT;

--read 조회
SELECT noticeno, head, content, rdate, count,  visible
FROM notice
WHERE noticeno=2;
 NOTICENO HEAD          CONTENT         RDATE         COUNT   visible
---------- ---------  -------------  -------------  --------  --------------
         2 공지사항2     공지글2         20/10/27          0    Y
         
--update 수정
UPDATE notice
SET head='등업안내', content='등업필수조건.....', visible='N'
WHERE noticeno=1;
NOTICENO      HEAD        CONTENT            RDATE        COUNT     visible
---------- ------------- ---------------   -----------   ---------  ---------
         1 등업안내       등업필수조건....     20/10/27           0    N


--delete 삭제
DELETE FROM notice 
WHERE noticeno=3;

SELECT*FROM notice;
NOTICENO HEAD            CONTENT         RDATE           COUNT        visible
---------- ----------- ---------------   --------------- -------- ------------
         1 등업안내     등업필수조건....    20/10/27          0       N
         2 공지사항2     공지글2           20/10/27          0       Y
