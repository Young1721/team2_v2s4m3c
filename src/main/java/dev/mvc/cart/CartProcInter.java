package dev.mvc.cart;

import java.util.List;

public interface CartProcInter {
  
  public int create(CartVO cartVO);
  
  public List<CartVO> list();
  
  public CartVO read(int cart_no);
  
  public int update(CartVO cartVO);
  
  public int delete(int cart_no);
  
  public int update_cart_check(CartVO cartVO);
}
