package dev.mvc.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

public interface MemberProcInter {
  /**
   * �ߺ� ���̵� �˻�
   * @param id
   * @return �ߺ� ���̵� ����
   */
  public int checkID(String id);
  
  /**
   * ȸ�� ����
   * @param memberVO
   * @return
   */
  public int create(MemberVO memberVO);
  
  /**
   * ȸ�� ��ü ���
   * @return
   */
  public List<MemberVO> list();
  
  /**
   * ȸ�� ��ȸ
   * @param memberno
   * @return
   */
  public MemberVO read(int member_no);
  
  /**
   * ȸ�� ���� ��ȸ
   * @param id
   * @return
   */
  public MemberVO readById(String id);
  
  /**
   * ���� ó��
   * @param memberVO
   * @return
   */
  public int update(MemberVO memberVO);
  
  /**
   * ȸ�� ���� ó��
   * @param memberno
   * @return
   */
  public int delete(int member_no);
  
  /**
   * ���� �н����� �˻�
   * @param map
   * @return 0: ��ġ���� ����, 1: ��ġ��
   */
  public int passwd_check(HashMap<Object, Object> map);
  
  /**
   * �н����� ����
   * @param map
   * @return ����� �н����� ����
   */
  public int passwd_update(HashMap<Object, Object> map);
  
  /**
   * �α��� ó��
   */
  public int login(Map<String, Object> map);
  
  /**
   * �α��ε� ȸ�� �������� �˻��մϴ�.
   * @param session
   * @return true: ������
   */
  public boolean isMember(HttpSession session);   
  
}
 


