/**********************************/
/* Table Name: ����īƮ */
/**********************************/
DROP TABLE cart;
CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cart_cnt                      		NUMBER(10)		 NULL ,
        cart_check           		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		cart_tot                      		NUMBER(10)		 NULL ,
		cart_rdate                    		DATE		 NOT NULL
);

COMMENT ON TABLE cart is '����īƮ';
COMMENT ON COLUMN cart.cart_no is 'īƮ��ȣ';
-- COMMENT ON COLUMN cart.product_no is '��ǰ��ȣ';
COMMENT ON COLUMN cart.cart_check is '���� īƮ';
COMMENT ON COLUMN cart.cart_cnt is '����';
COMMENT ON COLUMN cart.cart_tot is '�հ�';
COMMENT ON COLUMN cart.cart_rdate is '��¥';

DROP SEQUENCE cart_seq;
CREATE SEQUENCE cart_seq
  START WITH 1              -- ���� ��ȣ
  INCREMENT BY 1          -- ������
  MAXVALUE 9999999999 -- �ִ밪: 9999999 --> NUMBER(7) ����
  CACHE 2                       -- 2���� �޸𸮿����� ���
  NOCYCLE;   
  
COMMIT;
  
INSERT INTO cart(cart_no, cart_check, cart_cnt, cart_tot, cart_rdate)
VALUES(cart_seq.nextval, 1, 5, 10, sysdate);

INSERT INTO cart(cart_no, cart_check, cart_cnt, cart_tot, cart_rdate)
VALUES(cart_seq.nextval, 2, 7, 80, sysdate);

INSERT INTO cart(cart_no, cart_check, cart_cnt, cart_tot, cart_rdate)
VALUES(cart_seq.nextval, 3, 4, 20, sysdate);

INSERT INTO cart(cart_no, cart_check, cart_cnt, cart_tot, cart_rdate)
VALUES(cart_seq.nextval, 4, 20, 20, sysdate);

INSERT INTO cart(cart_no, cart_check, cart_cnt, cart_tot, cart_rdate)
VALUES(cart_seq.nextval, 5, 5, 5, sysdate);

SELECT cart_no, cart_check, cart_cnt, cart_tot, cart_rdate
FROM cart
ORDER BY cart_no ASC;

commit;












