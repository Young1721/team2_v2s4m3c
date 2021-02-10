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

import dev.mvc.member.MemberProcInter;
@Controller
public class CartCont {

  
  @Autowired
  @Qualifier("dev.mvc.cart.CartProc")
  private CartProcInter cartProc;
  
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc;
  
  public CartCont() {
    System.out.println("--> CartCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value = "/cart/create_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String create_ajax(CartVO cartVO, HttpSession session) {
    
    int member_no = (int)session.getAttribute("member_no");
    cartVO.setMember_no(member_no);
    int cnt = this.cartProc.create(cartVO); // �벑濡�
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }

  /**
   * http://localhost:9090/resort/categrp/list.do
   * 
   * @return
   */
  @RequestMapping(value="/cart/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    int member_no = (int)session.getAttribute("member_no");


    int sumMoney = this.cartProc.sumMoney(member_no);
    List<CartVO> list = this.cartProc.list(member_no);
    System.out.println(sumMoney);
    mav.addObject("sumMoney", sumMoney);
    mav.addObject("list", list);
    
    mav.setViewName("/cart/list_ajax");
    

    return mav;
  }
  
 

  /**
   * Ajax  http://localhost:9090/resort/categrp/update_ajax.do
   * 
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cart/update_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String update_ajax(CartVO cartVO) {

    
    int cnt = this.cartProc.update(cartVO);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);

    return json.toString();
  }
  
  

  /**
   * 
   * @param cart_no
   * @return
   */
  @ResponseBody
  @RequestMapping(value = "/cart/delete_ajax.do", method = RequestMethod.POST,
                          produces = "text/plain;charset=UTF-8")
  public String delete_ajax(int cart_no) {

    
    int cnt = this.cartProc.delete(cart_no);
    
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
    
    return json.toString();
  }

  

  @RequestMapping(value = "/cart/update_check.do", method = RequestMethod.GET)
  public ModelAndView update_cart_check(CartVO cartVO) {
    ModelAndView mav = new ModelAndView();

    int cnt = this.cartProc.update_cart_check(cartVO);
    mav.addObject("cnt", cnt); // request�뜝�룞�삕 �뜝�룞�삕�뜝�룞�삕

    mav.setViewName("redirect:/cart/list.do"); //

    return mav;
  }
  

}
