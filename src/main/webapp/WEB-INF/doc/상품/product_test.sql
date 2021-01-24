/**********************************/
/* Table Name: ��ǰ ���� */
/**********************************/
CREATE TABLE productgrp(
		productgrp_no                 		NUMBER(10)		 NOT NULL,
		productgrp_name               		VARCHAR2(20)		 NOT NULL,
		productgrp_seqno              		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		productgrp_visible            		CHAR(1)		 DEFAULT 'Y'		 NOT NULL
);

COMMENT ON TABLE productgrp is '��ǰ ����';
COMMENT ON COLUMN productgrp.productgrp_no is '��ǰ ���� ��ȣ';
COMMENT ON COLUMN productgrp.productgrp_name is '��ǰ ����';
COMMENT ON COLUMN productgrp.productgrp_seqno is '��� ����';
COMMENT ON COLUMN productgrp.productgrp_visible is '��� ���';


/**********************************/
/* Table Name: ��ǰ */
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

COMMENT ON TABLE product is '��ǰ';
COMMENT ON COLUMN product.product_no is '��ǰ ��ȣ';
COMMENT ON COLUMN product.productgrp_seqno is '��� ����';
COMMENT ON COLUMN product.product_name is '��ǰ��';
COMMENT ON COLUMN product.product_brand is '�귣��';
COMMENT ON COLUMN product.product_origin is '������';
COMMENT ON COLUMN product.product_frequency is '����';
COMMENT ON COLUMN product.product_description is '����';
COMMENT ON COLUMN product.product_cost is '����';
COMMENT ON COLUMN product.product_ml is '���뷮';
COMMENT ON COLUMN product.product_passwd is '��й�ȣ';
COMMENT ON COLUMN product.product_replycnt is '��ۼ�';
COMMENT ON COLUMN product.product_file1 is '�����̹���';
COMMENT ON COLUMN product.product_thumb1 is '���� �̹��� Preview';
COMMENT ON COLUMN product.product_size is '���� �̹��� ũ��';
COMMENT ON COLUMN product.product_indent is '�鿩����/�亯����';
COMMENT ON COLUMN product.product_ansnum is '�亯����';
COMMENT ON COLUMN product.product_grpno is '�׷��ȣ';
COMMENT ON COLUMN product.product_cnt is '��ȸ��';
COMMENT ON COLUMN product.product_recom is '��õ��';
COMMENT ON COLUMN product.product_date is '�����';
COMMENT ON COLUMN product.productgrp_no is '��ǰ ���� ��ȣ';


/**********************************/
/* Table Name: ����īƮ */
/**********************************/
CREATE TABLE cart(
		cart_no                       		NUMBER(10)		 NOT NULL,
		product_no                    		NUMBER(10)		 NOT NULL,
		cart_cnt                      		NUMBER(10)		 NULL ,
		cart_tot                      		NUMBER(10)		 NULL ,
		cart_rdate                    		DATE		 NOT NULL
);

COMMENT ON TABLE cart is '����īƮ';
COMMENT ON COLUMN cart.cart_no is 'īƮ��ȣ';
COMMENT ON COLUMN cart.product_no is '��ǰ��ȣ';
COMMENT ON COLUMN cart.cart_cnt is '����';
COMMENT ON COLUMN cart.cart_tot is '�հ�';
COMMENT ON COLUMN cart.cart_rdate is '��¥';



ALTER TABLE productgrp ADD CONSTRAINT IDX_productgrp_PK PRIMARY KEY (productgrp_no);

ALTER TABLE product ADD CONSTRAINT IDX_product_PK PRIMARY KEY (product_no);
ALTER TABLE product ADD CONSTRAINT IDX_product_FK0 FOREIGN KEY (productgrp_no) REFERENCES productgrp (productgrp_no);

ALTER TABLE cart ADD CONSTRAINT IDX_cart_PK PRIMARY KEY (cart_no);
ALTER TABLE cart ADD CONSTRAINT IDX_cart_FK0 FOREIGN KEY (product_no) REFERENCES product (product_no);

