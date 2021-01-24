package dev.mvc.member;
 
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
 
@Controller
public class MemberCont {
  @Autowired
  @Qualifier("dev.mvc.member.MemberProc")
  private MemberProcInter memberProc = null;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // �̸� ����
  private AdminProcInter adminProc;
  
  public MemberCont(){
    System.out.println("--> MemberCont created.");
  }
  
  // http://localhost:9090/resort/member/checkID.do?id=user1
  /**
  * ID �ߺ� üũ, JSON ���
  * @return
  */
  @ResponseBody
  @RequestMapping(value="/member/checkID.do", method=RequestMethod.GET ,
                         produces = "text/plain;charset=UTF-8" )
  public String checkID(String id) {
    int cnt = this.memberProc.checkID(id);
   
    JSONObject json = new JSONObject();
    json.put("cnt", cnt);
   
    return json.toString(); 
  }

  // http://localhost:9090/resort/member/create.do
  /**
  * ��� ��
  * @return
  */
  @RequestMapping(value="/member/create.do", method=RequestMethod.GET )
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/create"); // webapp/member/create.jsp
   
    return mav; // forward
  }

  /**
   * ��� ó��
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/create.do", method=RequestMethod.POST)
  public ModelAndView create(MemberVO memberVO){
    ModelAndView mav = new ModelAndView();
    
    // System.out.println("id: " + memberVO.getId());
    
    int cnt= memberProc.create(memberVO);
    mav.addObject("cnt", cnt); // redirect parameter ����
    mav.addObject("url", "create_msg"); // create_msg.jsp, redirect parameter ����
    
    mav.setViewName("redirect:/member/msg.do"); // ���ΰ�ħ ����
    
    return mav;
  }
  
  /**
   * ���ΰ�ħ�� �����ϴ� �޽��� ���
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/msg.do", method=RequestMethod.GET)
  public ModelAndView msg(String url){
    ModelAndView mav = new ModelAndView();
    
    // ��� ó�� �޽���: create_msg --> /member/create_msg.jsp
    // ���� ó�� �޽���: update_msg --> /member/update_msg.jsp
    // ���� ó�� �޽���: delete_msg --> /member/delete_msg.jsp
    mav.setViewName("/member/" + url); // forward
    
    return mav; // forward
  }
  
//  @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
//  public ModelAndView list(){
//    ModelAndView mav = new ModelAndView();
//    
//    List<MemberVO> list = this.memberProc.list();    
//    mav.addObject("list", list);
//    mav.setViewName("/member/list"); // webapp/member/list.jsp
//    
//    return mav; // forward
//  }

//  /**
//   * �α��ε� ȸ���� ��� ��� ����
//   * @param session
//   * @return
//   */
//  @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
//  public ModelAndView list(HttpSession session){
//    ModelAndView mav = new ModelAndView();
//    
//    if (memberProc.isMember(session)) {
//      List<MemberVO> list = this.memberProc.list();    
//      mav.addObject("list", list);
//      mav.setViewName("/member/list"); // webapp/member/list.jsp      
//    } else {
//      mav.setViewName("redirect:/member/login_need.jsp");  // ,jsp Ȯ���� ����
//    }
//        
//    return mav; // forward
//  }

  /**
  * �α��ε� �����ڸ� ��� ��� ����
  * @param session
  * @return
  */
  @RequestMapping(value="/member/list.do", method=RequestMethod.GET)
  public ModelAndView list(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      List<MemberVO> list = memberProc.list();
      
      mav.addObject("list", list);
      mav.setViewName("/member/list"); // /webapp/member/list.jsp

    } else {
      mav.setViewName("redirect:/admin/login_need.jsp"); // /webapp/admin/login_need.jsp
    }
    
    return mav;
  }  
  
  /**
   * ȸ�� ��ȸ
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/read.do", method=RequestMethod.GET)
  public ModelAndView read(int member_no){
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(member_no);
    mav.addObject("memberVO", memberVO);
    mav.setViewName("/member/read"); // webapp/member/read.jsp
    
    return mav; // forward
  }
  
  /**
   * ȸ�� ���� ���� ó��
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
  public ModelAndView update(MemberVO memberVO){
    ModelAndView mav = new ModelAndView();
    
    // System.out.println("id: " + memberVO.getId());
    
    int cnt= memberProc.update(memberVO);
    mav.addObject("cnt", cnt); // redirect parameter ����
    mav.addObject("member_no", memberVO.getMember_no()); // redirect parameter ����
    mav.addObject("url", "update_msg"); // update_msg.jsp, redirect parameter ����

    mav.setViewName("redirect:/member/msg.do");
    
    return mav;
  }
  
  /**
   * ȸ�� ����
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int member_no){
    ModelAndView mav = new ModelAndView();
    
    MemberVO memberVO = this.memberProc.read(member_no);
    mav.addObject("memberVO", memberVO);
    mav.setViewName("/member/delete"); // webapp/member/delete.jsp
    
    return mav; // forward
  }
 
  /**
   * ȸ�� ���� ó��
   * @param memberVO
   * @return
   */
  @RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int member_no){
    ModelAndView mav = new ModelAndView();
    
    // System.out.println("id: " + memberVO.getId());
    MemberVO memberVO = this.memberProc.read(member_no);
    
    int cnt= memberProc.delete(member_no);
    mav.addObject("cnt", cnt); // redirect parameter ����
    mav.addObject("mname", memberVO.getMname()); // redirect parameter ����
    mav.addObject("url", "delete_msg"); // delete_msg.jsp, redirect parameter ����
    
    mav.setViewName("redirect:/member/msg.do");
    
    return mav;
  }
  
  /**
   * �н����带 �����մϴ�.
   * @param memberno
   * @return
   */
  @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.GET)
  public ModelAndView passwd_update(int member_no){
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/member/passwd_update");
    
    return mav;
  }
  
  /**
   * �н����� ���� ó��
   * @param memberno ȸ�� ��ȣ
   * @param current_passwd ���� �н�����
   * @param new_passwd ���ο� �н�����
   * @return
   */
  @RequestMapping(value="/member/passwd_update.do", method=RequestMethod.POST)
  public ModelAndView passwd_update(int member_no, String current_passwd, String new_passwd){
    ModelAndView mav = new ModelAndView();
    
    // ���� �н����� �˻�
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("member_no", member_no);
    map.put("passwd", current_passwd);
    
    int cnt = memberProc.passwd_check(map);
    int update_cnt = 0; // ����� �н����� ��
    
    if (cnt == 1) { // ���� �н����尡 ��ġ�ϴ� ���
      map.put("passwd", new_passwd); // ���ο� �н����带 ����
      update_cnt = memberProc.passwd_update(map); // �н����� ���� ó��
      mav.addObject("update_cnt", update_cnt);  // ����� �н������� ����    
    }

    mav.addObject("cnt", cnt); // �н����� ��ġ ����
    mav.addObject("url", "passwd_update_msg");
    
    mav.setViewName("redirect:/member/msg.do");
    
    return mav;
  }
  
  /**
   * �α��� ��
   * @return
   */
  // http://localhost:9090/resort/member/login.do 
  /*
   * @RequestMapping(value = "/member/login.do", method = RequestMethod.GET)
   * public ModelAndView login() { ModelAndView mav = new ModelAndView();
   * 
   * mav.setViewName("/member/login_form"); return mav; }
   */

  /**
   * �α��� ��
   * @return
   */
  // http://localhost:9090/ojt/member/login.do 
  @RequestMapping(value = "/member/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login_cookie(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id ����
    String ck_id_save = ""; // id ���� ���θ� üũ
    String ck_passwd = ""; // passwd ����
    String ck_passwd_save = ""; // passwd ���� ���θ� üũ

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // ��Ű ��ü ����
        
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue(); 
        }else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();  // Y, N
        }else if (cookie.getName().equals("ck_passwd")){
          ck_passwd = cookie.getValue();         // 1234
        }else if(cookie.getName().equals("ck_passwd_save")){
          ck_passwd_save = cookie.getValue();  // Y, N
        }
      }
    }
    
    mav.addObject("ck_id", ck_id); 
    mav.addObject("ck_id_save", ck_id_save);
    mav.addObject("ck_passwd", ck_passwd);
    mav.addObject("ck_passwd_save", ck_passwd_save);
    
    mav.setViewName("/member/login_ck_form");
    return mav;
  }
   
  
  /**
   * �α��� ó��
   * @return
   */
  // http://localhost:9090/resort/member/login.do 
//  @RequestMapping(value = "/member/login.do", 
//                             method = RequestMethod.POST)
//  public ModelAndView login_proc(HttpSession session,
//                                            String id, 
//                                            String passwd) {
//    ModelAndView mav = new ModelAndView();
//    Map<String, Object> map = new HashMap<String, Object>();
//    map.put("id", id);
//    map.put("passwd", passwd);
//    
//    int count = memberProc.login(map);
//    if (count == 1) { // �α��� ����
//      // System.out.println(id + " �α��� ����");
//      MemberVO memberVO = memberProc.readById(id);
//      session.setAttribute("memberno", memberVO.getMemberno());
//      session.setAttribute("id", id);
//      session.setAttribute("mname", memberVO.getMname());
//      
//      mav.setViewName("redirect:/index.do");  
//    } else {
//      mav.setViewName("redirect:/member/login_fail_msg.jsp");
//    }
//        
//    return mav;
//  }

  /**
   * �α��� ó��
   * @param request Cookie�� �б����� �ʿ�
   * @param response Cookie�� �������� �ʿ�
   * @param session �α��� ������ �޸𸮿� ���
   * @param id  ȸ�� ���̵�
   * @param passwd ȸ�� �н�����
   * @param id_save ȸ�� ���̵� Cookie�� ���� ����
   * @param passwd_save �н����� Cookie�� ���� ����
   * @return
   */
  // http://localhost:9090/ojt/member/login.do 
  @RequestMapping(value = "/member/login.do", 
                             method = RequestMethod.POST)
  public ModelAndView login_cookie_proc(
                             HttpServletRequest request,
                             HttpServletResponse response,
                             HttpSession session,
                             String id, String passwd,
                             @RequestParam(value="id_save", defaultValue="") String id_save,
                             @RequestParam(value="passwd_save", defaultValue="") String passwd_save) {
    ModelAndView mav = new ModelAndView();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    
    int count = memberProc.login(map);
    if (count == 1) { // �α��� ����
      // System.out.println(id + " �α��� ����");
      MemberVO memberVO = memberProc.readById(id);
      session.setAttribute("member_no", memberVO.getMember_no());
      session.setAttribute("id", id);
      session.setAttribute("mname", memberVO.getMname());
      
      // -------------------------------------------------------------------
      // id ���� ��� ����
      // -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id�� ������ ���, Checkbox�� üũ�� ���
        Cookie ck_id = new Cookie("ck_id", id);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, �ʴ���
        response.addCookie(ck_id); // id ����
      } else { // N, id�� �������� �ʴ� ���, Checkbox�� üũ ������ ���
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id); // id ����
      }
      // id�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
      // -------------------------------------------------------------------

      // -------------------------------------------------------------------
      // Password ���� ��� ����
      // -------------------------------------------------------------------
      if (passwd_save.equals("Y")) { // �н����� ������ ���
        Cookie ck_passwd = new Cookie("ck_passwd", passwd);
        ck_passwd.setMaxAge(60 * 60 * 72 * 10); // 30 day
        response.addCookie(ck_passwd);
      } else { // N, �н����带 �������� ���� ���
        Cookie ck_passwd = new Cookie("ck_passwd", "");
        ck_passwd.setMaxAge(0);
        response.addCookie(ck_passwd);
      }
      // passwd�� �������� �����ϴ�  CheckBox üũ ����
      Cookie ck_passwd_save = new Cookie("ck_passwd_save", passwd_save);
      ck_passwd_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_passwd_save);
      // -------------------------------------------------------------------
      
      mav.setViewName("redirect:/");  
    } else {
      mav.setViewName("redirect:/member/login_fail_msg.jsp");
    }
        
    return mav;
  }
  
  
  /**
   * �α׾ƿ� ó��
   * @param session
   * @return
   */
  @RequestMapping(value="/member/logout.do", 
                             method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // ��� session ���� ����
    
    mav.setViewName("redirect:/member/logout_msg.jsp");
    
    return mav;
  }
  
}






