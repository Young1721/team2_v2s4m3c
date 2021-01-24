package dev.mvc.cart;

public class CartVO {
  /*
   * CREATE TABLE cart(
    cart_no                           NUMBER(10)     NOT NULL    PRIMARY KEY,
    product_no                        NUMBER(10)     NOT NULL,
    cart_cnt                          NUMBER(10)     NULL ,
    cart_tot                          NUMBER(10)     NULL ,
    cart_rdate                        DATE     NOT NULL,
  FOREIGN KEY (product_no) REFERENCES product (product_no)
);
   */
  
  private int cart_no;
  private int product_no;
  private int cart_cnt;
  private int cart_tot;
  private String cart_rdate;
  
  public int getCart_no() {
    return cart_no;
  }
  public void setCart_no(int cart_no) {
    this.cart_no = cart_no;
  }
  public int getProduct_no() {
    return product_no;
  }
  public void setProduct_no(int product_no) {
    this.product_no = product_no;
  }
  public int getCart_cnt() {
    return cart_cnt;
  }
  public void setCart_cnt(int cart_cnt) {
    this.cart_cnt = cart_cnt;
  }
  public int getCart_tot() {
    return cart_tot;
  }
  public void setCart_tot(int cart_tot) {
    this.cart_tot = cart_tot;
  }
  public String getCart_rdate() {
    return cart_rdate;
  }
  public void setCart_rdate(String cart_rdate) {
    this.cart_rdate = cart_rdate;
  }

  
}
