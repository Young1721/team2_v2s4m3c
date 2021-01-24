/**********************************/
/* Table Name: 상품 종류 */
/**********************************/
CREATE TABLE productgrp(
		productgrp_no                 		NUMBER(10)		 NOT NULL,
		productgrp_name               		VARCHAR2(20)		 NOT NULL,
		productgrp_seqno              		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		productgrp_visible            		CHAR(1)		 DEFAULT 'Y'		 NOT NULL
);

COMMENT ON TABLE productgrp is '상품 종류';
COMMENT ON COLUMN productgrp.productgrp_no is '상품 종류 번호';
COMMENT ON COLUMN productgrp.productgrp_name is '상품 종류';
COMMENT ON COLUMN productgrp.productgrp_seqno is '출력 순서';
COMMENT ON COLUMN productgrp.productgrp_visible is '출력 모드';


/**********************************/
/* Table Name: 상품 */
/**********************************/
CREATE TABLE product(
		product_no                    		NUMBER(10)		 NOT NULL,
		productgrp_seqno              		NUMBER(10)		 NOT NULL,
		product_name                  		VARCHAR2(100)		 NOT NULL,
		product_brand                 		VARCHAR2(100)		 NOT NULL,
		product_origin                		VARCHAR2(100)		 NOT NULL,
		product_frequency             		NUMBER(10)		 NOT NULL,
		product_description           		VARCHAR2(2000)		 NOT NULL,
		product_cost                  		NUMBER(10)		 NOT NULL,
		product_ml                    		NUMBER(10)		 NOT NULL,
		product_passwd                		NUMBER(20)		 NOT NULL,
		product_replycnt              		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		product_file1                 		VARCHAR2(100)		 NULL ,
		product_thumb1                		VARCHAR2(100)		 NULL ,
		product_size                  		NUMBER(10)		 DEFAULT 0		 NULL ,
		product_indent                		NUMBER(2)		 DEFAULT 0		 NOT NULL,
		product_ansnum                		NUMBER(3)		 DEFAULT 0		 NOT NULL,
		product_grpno                 		NUMBER(8)		 DEFAULT 0		 NOT NULL,
		product_cnt                   		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		product_recom                 		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		product_date                  		DATE		 NOT NULL,
		productgrp_no                 		NUMBER(10)		 NOT NULL
);

COMMENT ON TABLE product is '상품';
COMMENT ON COLUMN product.product_no is '상품 번호';
COMMENT ON COLUMN product.productgrp_seqno is '출력 순서';
COMMENT ON COLUMN product.product_name is '제품명';
COMMENT ON COLUMN product.product_brand is '브랜드';
COMMENT ON COLUMN product.product_origin is '원산지';
COMMENT ON COLUMN product.product_frequency is '도수';
COMMENT ON COLUMN product.product_description is '내용';
COMMENT ON COLUMN product.product_cost is '가격';
COMMENT ON COLUMN product.product_ml is '내용량';
COMMENT ON COLUMN product.product_passwd is '비밀번호';
COMMENT ON COLUMN product.product_replycnt is '댓글수';
COMMENT ON COLUMN product.product_file1 is '메인이미지';
COMMENT ON COLUMN product.product_thumb1 is '메인 이미지 Preview';
COMMENT ON COLUMN product.product_size is '메인 이미지 크기';
COMMENT ON COLUMN product.product_indent is '들여쓰기/답변차수';
COMMENT ON COLUMN product.product_ansnum is '답변순서';
COMMENT ON COLUMN product.product_grpno is '그룹번호';
COMMENT ON COLUMN product.product_cnt is '조회수';
COMMENT ON COLUMN product.product_recom is '추천수';
COMMENT ON COLUMN product.product_date is '등록일';
COMMENT ON COLUMN product.productgrp_no is '상품 종류 번호';


/**********************************/
/* Table Name: 쇼핑카트 */
/**********************************/
CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NOT NULL,
		product_no                    		NUMBER(10)		 NOT NULL,
		cart_cnt                      		NUMBER(10)		 NULL ,
		cart_tot                      		NUMBER(10)		 NULL ,
		cart_rdate                    		DATE		 NOT NULL
);

COMMENT ON TABLE cart is '쇼핑카트';
COMMENT ON COLUMN cart.cart_no is '카트번호';
COMMENT ON COLUMN cart.product_no is '상품번호';
COMMENT ON COLUMN cart.cart_cnt is '수량';
COMMENT ON COLUMN cart.cart_tot is '합계';
COMMENT ON COLUMN cart.cart_rdate is '날짜';



ALTER TABLE productgrp ADD CONSTRAINT IDX_productgrp_PK PRIMARY KEY (productgrp_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (product_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (productgrp_no) REFERENCES productgrp (productgrp_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no);

