<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>전통주</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
 
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>전통주 그룹</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
        
        <label>카트번호</label>
      <input type='number' name='productgrp_seqno' value='1' required="required" 
                min='1' max='9999' step='1' style='width: 5%;'> 
        
       <label>수량</label>
      <input type='number' name='productgrp_seqno' value='1' required="required" 
                min='1' max='9999' step='1' style='width: 5%;'>
        
       <label>합계</label>
      <input type='number' name='productgrp_seqno' value='1' required="required" 
                min='1' max='9999' step='1' style='width: 5%;'>
      
       
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 25%;'/>
    <col style='width: 40%;'/>
    <col style='width: 25%;'/>
    <col style='width: 10%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">상품</TH>
    <TH class="th_bs">수량</TH>
    <TH class="th_bs">합계</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="cartVO" items="${list}">
    <c:set var="cart_no" value="${cart_no }" />
    <TR>
      <TD class="td_bs">${cartVO.cart_no }</TD>
      <TD class="td_bs_left"><A href = "../product/read.do?product_no=${cart_no}">${cart_no }</A></TD>
      <TD class="td_bs">

      </TD>
      
      <TD class="td_bs">
        <A href="./read_update.do?cart_no=${cart_no }" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
        <A href="./read_delete.do?cart_no=${cart_no }" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
     </TD>   
    </TR>   
  </c:forEach> 
  </tbody>
 
</TABLE>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 