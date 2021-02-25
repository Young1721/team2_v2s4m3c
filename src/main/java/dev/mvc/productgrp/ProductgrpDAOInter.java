package dev.mvc.productgrp;

import java.util.List;

public interface ProductgrpDAOInter {

  /**
  * 상품그룹 등록
  * <insert id="create" parameterType="ProductgrpVO">
  * @return
  */
  public int create(ProductgrpVO productgrpVO);
  
  /**
  * 상품그룹 목록
  * <select id="list_productgrp_seqno_asc" resultType="ProductgrpVO">
  * @return
  */
  public List<ProductgrpVO> list_productgrp_seqno_asc();
  
  public ProductgrpVO read(int productgrp_no);
  
  public int update(ProductgrpVO productgrpVO);
  
  public int delete(int productgrp_no);
  
  public int update_seqno_up(int productgrp_no);
  
  public int update_seqno_down(int productgrp_no);
  
  public int update_productgrp_visible(ProductgrpVO productgrpVO);
  
  public int increaseCnt(int productgrp_no);    

  public int decreaseCnt(int productgrp_no);

}
