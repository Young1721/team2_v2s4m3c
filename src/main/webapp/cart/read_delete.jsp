<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>전통주</title>
 
<link href="../css/common.css" rel="stylesheet" type="text/css">
<link href="../css/menu.css" rel="stylesheet" type="text/css">
<link href="../css/style.css" rel="stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>카트  삭제</DIV>
 
  <DIV id='panel_delete' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <div class="msg_warning">상품 그룹을 삭제하면 복구 할 수 없습니다.</div>
    <FORM name='frm_delete' id='frm_delete' method='POST' action='./delete.do'>
      <input type='hidden' name='cart_no' id='cart_no' value='${cartVO.cart_no }'>
        
      <label>수량</label>: ${cartVO.cart_cnt } &nbsp;
      <label>출력 형식</label>: ${cartVO.cart_check } &nbsp;
       
      <button type="submit" id='submit'>삭제</button>
      <button type="button" onclick="location.href='./list.do'">취소</button>
    </FORM>
  </DIV>
   
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 20%;'/>
    <col style='width: 40%;'/>
    <col style='width: 20%;'/>    
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_bs">순서</TH>
    <TH class="th_bs">대분류명</TH>
    <TH class="th_bs">출력</TH>
    <TH class="th_bs">기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="cartVO" items="${list}">
    <c:set var="cartno" value="${cartVO.cart_no }" />
    <TR>
      <TD class="td_bs">${cartVO.cart_cnt }</TD>
      <TD class="td_bs">${cartVO.cart_check }</TD>
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
 
 
 