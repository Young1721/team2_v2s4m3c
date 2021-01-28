/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
DROP TABLE cart;
CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cart_cnt                      		NUMBER(10)		 NULL ,
        cart_check           		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		cart_tot                      		NUMBER(10)		 NULL ,
		cart_rdate                    		DATE		 NOT NULL
);

COMMENT ON TABLE cart is '쇼핑카트';
COMMENT ON COLUMN cart.cart_no is '카트번호';
-- COMMENT ON COLUMN cart.product_no is '상품번호';
COMMENT ON COLUMN cart.cart_check is '선택 카트';
COMMENT ON COLUMN cart.cart_cnt is '수량';
COMMENT ON COLUMN cart.cart_tot is '합계';
COMMENT ON COLUMN cart.cart_rdate is '날짜';

DROP SEQUENCE cart_seq;
CREATE SEQUENCE cart_seq
  START WITH 1              -- 시작 번호
  INCREMENT BY 1          -- 증가값
  MAXVALUE 9999999999 -- 최대값: 9999999 --> NUMBER(7) 대응
  CACHE 2                       -- 2번은 메모리에서만 계산
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












