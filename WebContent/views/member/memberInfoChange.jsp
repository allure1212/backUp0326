<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	String msg = (String)request.getAttribute("msg");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>


*, ::after, ::before {
box-sizing: border-box;
-moz-box-sizing: border-box;
-webkit-box-sizing: border-box;
}
a {
text-decoration: none;
}
table {
position: relative;
width: 100%;
border-spacing: 0;
border-collapse: collapse;
}


button, input[type=button], input[type=reset], input[type=submit] {
overflow: visible;
padding: 0;
border: none;
background: 0 0;
}


[type=radio] {
-webkit-appearance: radio;
-moz-appearance: radio;
appearance: radio;
}

.enroll {
display: none;
position: relative;
top: 120px;
left: 50%;
z-index: 110;
width: 800px;
padding: 60px 60px 70px;
background-color: #fff;
}

.btnWrap {
min-height: 40px;
margin-top: 30px;
text-align: center;
}

.button-color01 {
border-color: #3086c9;
color: #fff;
background-color: #3086c9;
}

.button-sizeL {
min-width: 114px;
height: 50px;
padding: 0 10px;
line-height: 48px;
}

.checkBlock {
position: relative;
margin-top: 20px;
}

.checkBlock-all {
margin-bottom: 65px;
background-color: #f4f5f7;
}

.checkBlock + .checkBlock {
margin-top: 40px;
}

.checkBlock .labelTxt {
color: #222;
font-family: "Noto Sans KR Medium","Noto Sans KR",sans-serif;
font-size: 18px;
font-weight: 500;
border: 1px solid #ddd;
display: block;
width: 100%;
padding: 16px 0;
text-align: center;
transition: border-color .2s, color .2s, background-color .2s;
}

[class*=agreeform] > input, [class*=feFo] > select {
position: absolute;
top: 0px;
right: 0px;
bottom: 0px;
left: 0px;
width: 100%;
height: 100%;
margin: 0;
padding: 0;
}



/* enrollField */
.enrollField {
position: relative;
margin-top: 20px;
}
.enrollField .info {
color: #db0000;
font-family: "Noto Sans KR Light","Noto Sans KR",sans-serif;
font-size: 14px;
font-weight: 300;
margin: -24px 0 8px;
text-align: right;
}
.enrollField table {
border-top: 2px solid #222;
border-bottom: 1px solid #ddd;
}
.enrollField td, .enrollField th {
vertical-align: middle;
height: 71px;
padding: 10px 0 10px;
border-top: 1px solid #ddd;
}
.enrollField th {
padding-right: 5px;
padding-left: 20px;
color: #222;
text-align: left;
}

.enrollField td div + div {
padding-top: 10px;
}
.enrollField th .essential {
display: inline-block;
margin: 0 8px 0 -14px;
color: #db0000;
}


/* joining */
.joining .heading {
margin-bottom: 30px;
}


.joining .enrollField .input {
width: 285px;
font-size: 14px;
}

.joining .enrollField td {
padding-right: 10px;
}

.joining .enrollField td {
padding-right: 10px;
}

.joining .enrollField .info {
margin-top: 0px;
margin-bottom: 5px;
font-size: 14px;
}

.joining .enrollField {
width: 680px;
}

.joining .term .inner {
width: 100%;
height: 85px;
padding: 20px 30px;
}



/* 남/여  */
.joining .enrollField span.optionGroup {
margin-left: 15px;
}

.labelTxt + label {
margin-left: 12px;
}

/* 회원가입 타이틀 */
.enroll .head .title {
color: #000;
font-family: "Noto Sans KR Medium","Noto Sans KR",sans-serif;
font-size: 34px;
font-weight: 500;
line-height: 1.29;
}


</style>
<script>
	var msg = "<%=msg%>";
	
	$(function(){
		if(msg != "null"){
			alert(msg);
		}
		
		if(msg == "성공적으로 변경하였습니다."){
			window.close();
		}
	});
	
</script>

</head>
<body>

    <%@ include file="../common/myPagebar.jsp"%>

<div id="wrap">
	<section class="enroll enroll-join" id="enrollJoin" style="margin-left: -400px; display: block;">
		<div class="head">
			<h1 class="title">회원정보수정</h1>
		</div>
<!-- //head -->
<!-- body -->
		<div class="body" style="margin-top: 80px;"></div>
<!-- joining -->
		<div class="joining scroll">
			<form name="joinForm" id="memberVo" onsubmit="return changeInfo();" action="<%=request.getContextPath()%>/infoChange.me" method="post">

<!-- enrollField -->
		<div class="enrollField">
			<p class="info"><span class="essential">*</span> 표시 항목은 필수입력사항입니다.</p>
			
				<table>
					<colgroup>
						<col style="width: 150px;">
						<col style="width: auto;">
					</colgroup>
					<tbody>
						<tr>
							<th>아이디</th>
							<td>
								<input name="id" title="아이디" class="input id" id="userId" required type="text" value="<%= loginUser.getId() %>" style="border:none" readonly>
								<!-- 사용불가 or 불일치 시 : input 'error' 클래스 -->
							</td>
						</tr>
						<tr>
							<th>이름</th>
							<td>
								<input name="name" title="이름" class="input name" id="userName" type="text" value="<%= loginUser.getName() %>" style="border:none" readonly>
							</td>
						</tr>
						<tr>
							<th><span class="essential">*</span>이메일</th>
							<td>
								<input name="email" title="이메일" class="input mail" id="userEmail" type="email" maxlength="50">
							</td>
						</tr>
						<tr>
							<th><span class="essential">*</span>휴대폰번호</th>
							<td>
								<input name="phone" title="휴대폰번호" class="input phone" id="userPhone" type="tel" maxlength="11" placeholder="휴대폰번호 (숫자만)">
							</td>
						</tr>
						<tr>
						<th>전화번호</th>
							<td>
								<input name="tel" title="전화번호" class="input tel" id="userTel" type="tel" maxlength="11" placeholder="전화번호 (숫자만)">
							</td>
						</tr>
					</tbody>
				</table>
            <div class="btnWrap">
                <button class="button button-sizeL button-color01" id="joinSubmitBtn" type="submit">회원정보변경</button>
            </div>
			
            </div>
            
            <!-- //btnWrap -->
            
    </form>           
    </div>
    <!-- //body -->
</section>
</div>


<script>


	function changeInfo() {
	
		 var emailJs = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); // 이메일
		 var phoneJs = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 휴대폰번호
		 //var telJs = /^0([1|2|3|4|5|6|7|8|9]{1,2})?([0-9]{3,4})?([0-9]{3,4})$/; // 전화번호

	
		   //이메일 공백 확인 
		   
		   if($("#userEmail").val() == ""){
			   alert("이메일을 입력해 주세요.");
			   $("#userEmail").focus();
			   return false; 
			   } 
		   
		   //이메일 유효성 검사 
		   
		   if(!emailJs.test($("#userEmail").val())){ 
			   alert("이메일 형식에 맞게 입력해 주세요.") 
			   $("#userEmail").val(""); 
			   $("#userEmail").focus(); 
			   return false; 
			   }
		 
		   // 휴대폰번호 공백 확인
		   
		   if($("#userPhone").val() == ""){
			   alert("휴대폰 번호를 입력해 주세요.")   
			   $("#userPhone").val("");
			   $("#userPhone").focus();
			   return false;
		   	   }
		   
			
		   // 휴대폰번호 유효성 검사 
		   
		   if(!phoneJs.test($("input[id=userPhone]").val())) {
				alert("휴대폰번호 형식에 맞게 입력해 주세요.")	
			    return false;
			} 	
		 
		 
		  /*  // 전화번호 유효성 검사
		   
		   if(!telJs.test($("input[id=userTel]").val())) {
			   alert("전화번호 형식에 맞게 입력해 주세요.")
			   return false;
		   } */
		 
		   
		   
		 
	}





</script>


</body>
</html>