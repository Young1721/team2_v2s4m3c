package dev.mvc.cart;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.productgrp.ProductgrpVO;

@Controller
public class CartCont {

  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  public CartCont() {
    System.out.println("--> CartCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value = "/cart/create_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String create_ajax(CartVO cartVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.cartProc.create(cartVO); // 占쏙옙占� 처占쏙옙
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * 占쏙옙占� http://localhost:9090/resort/categrp/list.do
   * 
   * @return
   */
  @RequestMapping(value="/cart/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
//    if (adminProc.isAdmin(session)) { // 占쏙옙占쏙옙占쏙옙 占싸깍옙占쏙옙占쏙옙 占쏙옙占�
      List<CartVO> list = cartProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/cart/list_ajax"); // /webapp/categrp/list_ajax.jsp
//    } else {
//      mav.setViewName("/admin/login_need"); // /webapp/admin/login_need.jsp    
//    }

    // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
        
    return mav;
  }
  
  /**
   * Ajax + read http://localhost:9090/resort/categrp/read_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cart/read_ajax.do", method = RequestMethod.GET,
                          produces = "text/plain;charset=UTF-8")
  public String read_ajax(int cart_no) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    CartVO cartVO = this.cartProc.read(cart_no);

    JSONObject json = new JSONObject();
    json.put("cart_no", cart_no);
    json.put("cart_check", cartVO.getCart_check());
    json.put("cart_tot", cartVO.getCart_tot());
    json.put("cart_cnt", cartVO.getCart_cnt());

    return json.toString();
  }

  /**
   * Ajax 占쏙옙占� 占쏙옙占� 처占쏙옙 http://localhost:9090/resort/categrp/update_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cart/update_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String update_ajax(CartVO cartVO) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.cartProc.update(cartVO); // 占쏙옙占� 처占쏙옙
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }
  
  /**
   * 占쏙옙占쏙옙占쏙옙 http://localhost:9090/team2/productgrp/read_delete.do
   * 
   * @return
   */
  @RequestMapping(value = "/cart/read_delete.do", method = RequestMethod.GET)
  public ModelAndView read_delete(int cart_no) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/cart/read_delete"); // /webapp/categrp/read_delete.jsp

    CartVO cartVO = this.cartProc.read(cart_no);
    mav.addObject("cartVO", cartVO);

    List<CartVO> list = this.cartProc.list();
    mav.addObject("list", list);

    return mav; // forward
  }
  

  /**
   * 占쏙옙占쏙옙 처占쏙옙 + Ajax
   * @param productgrpno
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cart/delete_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String delete_ajax(int cart_no) {
    try {
      Thread.sleep(3000);
    } catch (InterruptedException e) {
      e.printStackTrace();
    }
    
    int cnt = this.cartProc.delete(cart_no);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

  

  @RequestMapping(value = "/cart/update_check.do", method = RequestMethod.GET)
  public ModelAndView update_cart_check(CartVO cartVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.cartProc.update_cart_check(cartVO);
    mav.addObject("cnt", cnt); // request占쏙옙 占쏙옙占쏙옙

    mav.setViewName("redirect:/cart/list.do"); //

    return mav;
  }
  
  /**
   * 占쏙옙占싸곤옙침占쏙옙 占쏙옙占쏙옙占싹댐옙 占쌨쏙옙占쏙옙 占쏙옙占�
   * @return
   */
  @RequestMapping(value="/cart/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/cart/" + url); // forward
    
    return mav; // forward
  }
  

}
