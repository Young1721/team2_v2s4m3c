package dev.mvc.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.cart.CartProc")
public class CartProc implements CartProcInter{
  
  @Autowired
  private CartDAOInter cartDAO;
  
  public CartProc() {
    System.out.println("--> CartProc created.");
  }

  @Override
  public int create(CartVO cartVO) {
    int cnt=this.cartDAO.create(cartVO);
    return cnt;
  }

  @Override
  public List<CartVO> list() {
    List<CartVO> list = this.cartDAO.list();
    return list;
  }

  @Override
  public CartVO read(int cart_no) {
    CartVO cartVO = this.cartDAO.read(cart_no);
    return cartVO;
  }

  @Override
  public int update(CartVO cartVO) {
    int cnt = this.cartDAO.update(cartVO);
    return cnt;
  }

  @Override
  public int delete(int cart_no) {
    int cnt = this.cartDAO.delete(cart_no);
    return cnt;
  }

}
