package dev.mvc.product;

import java.util.HashMap;
import java.util.List;

public interface ProductDAOInter {
  
  /**
  * 상품 등록
  * <insert id="create" parameterType="ProductVO">
  * @return
  */
  public int create(ProductVO productVO);
  
  /**
   * 상품 전체 목록
   * @return
   */
  public List<ProductVO> list_all();
  
  /**
   * 상품 목록
   * 
   * @return
   */
  public List<ProductVO> list_by_productgrp_no(int productgrp_no);
  
 /**
  * 상품 조회
  * <select id="read" resultType="ProductVO" parameterType="int">
  * @param product_no
  * @return
  */
  public ProductVO read(int product_no);
  
  /**
   * �닔�젙 泥섎━
   * @param reviewVO
   * @return
   */
  public int update(ProductVO productVO);
  
  /**
   * �뙣�뒪�썙�뱶 寃��궗
   * @param hashMap
   * @return
   */
  public int passwd_check(HashMap<String, Object> hashMap);
  
  /**
   * �궘�젣
   * @param review_no
   * @return
   */
  public int delete(int product_no);
  
  /**
   * �씠誘몄� 蹂�寃�
   * @param reviewVO
   * @return
   */
  public int update_img(ProductVO productVO);
  
  public int total_count();

  public int search_count(HashMap<String, Object> hashMap);

  public int increaseAnsnum(HashMap<String, Object> map);

  public int reply(ProductVO productVO);
  
 /**
  * 상품 목록
  * <select id="list_by_productgrp_no_search_paging_join" 
              resultType="Product_MemberVO" parameterType="HashMap">
  * @param map
  * @return
  */
  public List<Product_MemberVO> list_by_productgrp_no_search_paging_join(HashMap<String, Object> map);
  
  public int increaseReplycnt(int product_no);

  public int decreaseReplycnt(int product_no);
  
}
