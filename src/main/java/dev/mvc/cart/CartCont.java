package dev.mvc.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.product.ProductProcInter;
import dev.mvc.product.ProductVO;

@Controller
public class CartCont {
  @Autowired
  @Qualifier("dev.mvc.product.ProductProc")
  private ProductProcInter productProc;
  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  public CartCont() {
    System.out.println("--> CartCont created.");
  }
  
  @RequestMapping(value = "/cart/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    
//    ProductVO productVO = this.productProc.read(product_no);
//    mav.addObject("productVO", productVO);
    
    mav.setViewName("/cart/create");
    
    return mav;
  }
  
  @RequestMapping(value = "/cart/create.do", method = RequestMethod.POST)
  public ModelAndView create(CartVO cartVO) {

    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/create_msg"); // /webapp/productgrp/create_msg.jsp

    int cnt = this.cartProc.create(cartVO); // ��� ó��
    mav.addObject("cnt", cnt); // request.setAttribute("cnt", cnt)

    return mav; // forward
  }
  
  @RequestMapping(value = "/cart/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/list"); 

    List<CartVO> list = this.cartProc.list();
    mav.addObject("list", list);

    return mav; // forward
  }
  
  @RequestMapping(value = "/cart/read_update.do", method = RequestMethod.GET)
  public ModelAndView read(int cart_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/read_update");
  
    CartVO cartVO = this.cartProc.read(cart_no);
    mav.addObject("cartVO", cartVO); // request.setAttribute("productVO", productVO);

    ProductVO productVO = this.productProc.read(cartVO.getProduct_no());
    mav.addObject("productVO", productVO);
    
    List<CartVO> list = this.cartProc.list();
    mav.addObject("list", list);
    return mav;
  }
  
  @RequestMapping(value = "/cart/update.do", method = RequestMethod.POST)
  public ModelAndView update(CartVO cartVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.cartProc.update(cartVO); // 占쏙옙占쏙옙占쏙옙 占싻깍옙
    mav.addObject("cnt", cnt); // request.setAttribute("productVO", productVO);

    mav.setViewName("/cart/update_msg");
    
    return mav;
  }
  
  @RequestMapping(value = "/cart/read_delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int cart_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/read_delete");

    CartVO cartVO = this.cartProc.read(cart_no); // 수정용 읽기
    mav.addObject("cartVO", cartVO); // request.setAttribute("contentsVO", contentsVO);

    List<CartVO> list = this.cartProc.list();
    mav.addObject("list", list);
    
    return mav;
  }
  
  @RequestMapping(value = "/cart/delete.do", method = RequestMethod.POST)
  public ModelAndView delete(CartVO cartVO) {
    ModelAndView mav = new ModelAndView();
    
    int cart_no = cartVO.getCart_no();
    mav.addObject("cart_no", cart_no);

    mav.setViewName("/cart/delete_msg"); // webapp/product/update_msg.jsp

    return mav;
  }
  

}
