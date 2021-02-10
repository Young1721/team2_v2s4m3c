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
    
<script type="text/javascript">
  $(function() {
    $('#btn_send').on('click', send);
    $("#total_sum").html("0 원");  // 초기값 0 원
  }); 

 /* 체크된 체크박스 값만 더하여 누적합계 산출 */
 function price_sum() {
   var sum=0;
   var cnt = $(".ck_box").length;
   for(var i = 0; i < cnt; i++) {
     if($(".ck_box")[i].checked == true  ) {
         sum += parseInt($(".ck_box")[i].value);
     } 
   } 
   $("#total_sum").html(sum+" 원");
}


  function update_proc() {
    // alert('update_proc() execute.');
    // return;
    // $('#btn_close').attr("data-focus", "이동할 태그 지정");
    
    // var frm = $('#frm'); // id가 frm인 태그 검색
    // $('#frm').attr('action', './update_ajax.do');
    // var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
    // var params = 'contentsno=' + ${param.contentsno};
    var params = $('#frm').serialize(); // 직렬화, 폼의 데이터를 키와 값의 구조로 조합
    // alert('params: ' + params);
    // return;

    var msg = '';
    $.ajax({
      url: './update_ajax.do', // spring execute
      type: 'post',  // post
      cache: false, // 응답 결과 임시 저장 취소
      async: true,  // true: 비동기 통신
      dataType: 'json', // 응답 형식: json, html, xml...
      data: params,      // 데이터
      success: function(rdata) { // 서버로부터 성공적으로 응답이 온경우
        if (rdata.cnt > 0) {
         // msg = "『" + $('#productgrp_name').val() + "』 카테고리 그룹을 수정했습니다."
         msg = "『』 카트 상품을 수정했습니다."
          msg += " <button type='button' onclick='location.reload(true)'>확인</button>";
        } else {
          // msg = "『" + $('#name').val() + "』 카테고리 그룹 수정에 실패했습니다."
          msg = "『』 카트 상품 수정에 실패했습니다."
        }
        $('#panel1').html(msg); // 메시지 출력
      },
      // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
      error: function(request, status, error) { // callback 함수
        var msg = 'ERROR\n';
        msg += 'request.status: '+request.status + '\n';
        msg += 'message: '+error;
        console.log(msg);
      }
    });
      
    // 처리중 출력
    var gif = '';
    gif +="<div style='margin: 0px auto; text-align: center;'>";
    gif +="  <img src='./images/ani04.gif' style='width: 10%;'>";
    gif +="</div>";
      
    $('#panel1').html(gif);
    $('#panel1').show(); // 출력 */    
  }
  
  $(".btn_select_delete").click(function () {
    var double_check = confirm("선택하신 상품이 삭제됩니다.");
    if(double_check) {
         var cartno_list = [];
         
         $("input[name='ck_box']:checked").each(function() {
             cartno_list.push($(this).attr("data-cartno"));  
          }); // 체크된 항목을 배열에 저장
          var param = { 
              "cartno_list" : cartno_list
          };  // 카트번호 배열 저장
          
         $.ajax({
             url: "./delete_ajax.do",
             dataType: "json",
             type: "post",
             data: param,
             success: function(rdata){
                  if(rdata.result != 0) {
                    location.href="./list.do";
                  } else {
                    alert("삭제 X");
                  }
                }, 
                error: function(request, status, error) {
                  var msg = 'ERROR request.status: '+request.status + '/ ' + error;
                  console.log(msg); // Chrome console 출력
                }  // Ajax 통신 error, 응답 코드가 200이 아닌경우, dataType이 다른경우 
          });  //   ajax 호출
    } 
});

  $(".btn_delete_${cart_no}").click(function () {
    var double_check = confirm("선택된 상품을 삭제하시겠습니까?");
    if(double_check) {
         var cartno_list = [];
         
         cartno_list.push($(this).attr("data-cartno"));  
          var param = { 
              "cartno_list" : cartno_list
          };  // 카트번호 배열 저장
          
         $.ajax({
             url: "./delete_ajax.do",
             dataType: "json",
             type: "post",
             data: param,
             success: function(rdata){
                  if(rdata.result != 0) {
                    location.href="./list.do";
                  } else {
                    alert("삭제 X");
                  }
                }, 
                error: function(request, status, error) {
                  var msg = 'ERROR request.status: '+request.status + '/ ' + error;
                  console.log(msg); // Chrome console 출력
                }  // Ajax 통신 error, 응답 코드가 200이 아닌경우, dataType이 다른경우 

          });  //   ajax 호출
    } 
});
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
 
  <DIV class='title_line'>카테고리 그룹</DIV>
 
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='form1' id=form1 method='POST' action=''>
      <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
      <input type='hidden' name='cart_no' id='cart_no' value='0'>
              
      <label>수량</label>
      <input type='text' name='cart_cnt' id='cart_cnt' value='1' required="required" style='width: 25%;'>
  
      <label>형식</label>
      <select name='cart_check' id='cart_check'>
        <option value='Y' selected="selected">Y</option>
        <option value='N'>N</option>
      </select>
       
      <button type="button" id='btn_send'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
    
  </DIV>
  <DIV id='panel1' style="width: 40%; text-align: center; margin: 10px auto; display: none;"></DIV> 
  
  <form name="form1" id="form1" method="post" action="./update.do">
  <TABLE class='table table-striped'>
    <colgroup>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>    
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 10%;'/>
      <col style='width: 20%;'/>
    </colgroup>
   
    <thead>  
    <TR>
      <TH class="th_bs"><input type="checkbox" name="check_all" id="check_all"> 전체 선택</TH>   
      <TH class="th_bs">메인 이미지</TH>
      <TH class="th_bs">상품명</TH>
      <TH class="th_bs">단가</TH>
      <TH class="th_bs">수량</TH>
      <TH class="th_bs">금액</TH>
      <TH class="th_bs">날짜</TH>
      <TH class="th_bs">기타</TH>
    </TR>
    </thead>
    
    <tbody>
    <c:forEach var="cartVO" items="${list}" varStatus="i">
      <c:set var="cart_no" value="${cartVO.cart_no }" />
      <TR>
        <TD class="td_bs"><input type="checkbox" name="ck_box" class="ck_box" data-cartno="${cart_no}" 
                                               value="${cartVO.product_cost}"  onClick="price_sum()" />
              <script>
               $(".ck_box").click(function(){
                    $("#check_all").prop("checked", false);  // 전체 선택 체크박스 체크 해제
                    price_sum();
               });
              </script>                                                                                  
          </TD>
        <TD class="td_bs"><IMG src='../product/storage/main_images/${cartVO.product_thumb1 }' style='margin-top: 2px; width: 100px; height: 100px;'></TD>
        <TD class="td_bs">${cartVO.product_name }</TD>
        <TD class="td_bs">${cartVO.product_cost }</TD>
        <TD class="td_bs">${cartVO.cart_cnt }</TD>
        <TD class="td_bs">${cartVO.product_cost * cartVO.cart_cnt}</TD>
        <TD class="td_bs">${cartVO.cart_rdate.substring(0, 10) }</TD>
         
        
        <TD class="td_bs">
          <A href="javascript:update_form(${cart_no })" title="수정"><span class="glyphicon glyphicon-pencil"></span></A>
          <A href="javascript:delete_form(${cart_no })" title="삭제"><span class="glyphicon glyphicon-trash"></span></A>
        </TD>   
      </TR>   
    </c:forEach> 
        <TR style="height: 100px; font-weight: bolder; font-size: 1.4em;">
        <TD class="td_bs"  rowspan="2">결제 합계</TD>
        <TD class="td_bs"  rowspan="2" colspan="3" id="total_sum"></TD>        
      </TR>     
    </tbody>
   
  </TABLE>
  </form>
 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 
 