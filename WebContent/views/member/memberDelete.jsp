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
<style>
* {
	vertical-align: baseline;
	margin: 0;
	padding: 0;
	border-radius: 0;
	-webkit-font-smoothing: antialiased;
	-webkit-text-size-adjust: none;
	-ms-text-size-adjust: none;
	text-size-adjust: none;
	list-style: none;
	-webkit-tap-highlight-color: transparent;
	font-smoothing: antialiased;
}
* {
	font-family: "Noto Sans KR Light","Noto Sans CJK KR","Noto Sans KR",sans-serif;
	font-weight: 300;
}


*, ::after, ::before {
	box-sizing: border-box;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
}

a img, fieldset, img {
	border: none;
}
caption, legend {
	overflow: hidden;
	position: absolute;
	width: 1px;
	height: 1px;
	border: none;
	clip: rect(1px, 1px, 1px, 1px);
	clip: rect(1px, 1px, 1px, 1px);
}

body {
	color: #666;
	font-size: 16px;
	word-break: break-all;
	word-spacing: -0.5px;
	letter-spacing: -0.9px;
	background-color: #fff;
}




.modal {
	display: none;
	position: relative;
	top: 120px;
	left: 50%;
	z-index: 110;
	width: 800px;
	padding: 60px 60px 70px;
	background-color: #fff;
}
.modal-sizeS {
	width: 560px;
}

.modal .head {
	position: relative;
	margin: -8px 0 40px;
}



.pwd .title {
	color: #222;
	font-family: "Noto Sans KR Medium","Noto Sans KR",sans-serif;
	font-size: 18px;
	font-weight: 500;
	margin-bottom: 20px;
}
.formField .item {
	position: relative;
	margin-top: 10px;
	padding: 0;
}

.formField .btnWrap {
    margin-top: 20px;
    text-align: center;
}
.block {
	display: block;
    width: 20% !important;
}
.button {
	border: 1px solid #254069;
	display: inline-block;
	vertical-align: middle;
	min-width: 120px;
	height: 40px;
	margin: 0 3px;
	padding: 0 20px;
	border-radius: 3px;
	color: #254069;
	font-size: 14px;
	text-align: center;
	line-height: 38px;
	cursor: pointer;
}

.button-color01 {
	border-color: #3086c9;
	color: #fff;
	background-color: #3086c9;
}
:first-child.button {
	margin-left: 0px;
}

.pwd .button {
	height: 30px;
	line-height: 20px;
}
.input {
	width: 250px;
	height: 50px;
	font-size: 16px;
	line-height: 50px;
}
input[type=number], input[type=password], input[type=tel], input[type=text] {
	-webkit-appearance: none;
	max-width: 100%;
	padding: 0 10px 0 18px;
	background: 0 0;
}
input[type=number], input[type=password], input[type=tel], input[type=text], select, textarea {
	border: 1px solid #ddd;
	color: #666;
}

.pwd .input {
	width: 100%;
	height: 50px;
}

.modal .head .title {
	color: #000;
	font-family: "Noto Sans KR Medium","Noto Sans KR",sans-serif;
	font-size: 34px;
	font-weight: 500;
	line-height: 1.29;
}
.title2 {
    margin-top: 30px;
    font-weight: bolder;
}


</style>
<script type="text/javascript">
    function cancle() {
		location.href="mypage.me";
    }
</script>

</head>
<body>

    <%@ include file="../common/myPagebar.jsp"%>
	
	<div id="wrap">
<section tabindex="0" class="modal modal-sizeS modal-findPwd" id="modalFindPwd" style="margin-left: -280px; display: block;">

<!-- modal -->
	<!-- head -->
	<div class="head">
        <h1 class="title">회원탈퇴</h1>
        <p class="title2">회원탈퇴를 원하시면 비밀번호를 입력하신 후 회원탈퇴 버튼을 클릭해 주세요. 탈퇴하시면 회원정보가 데이터베이스에서 완전히 삭제됩니다.</p>
	</div>
	<!-- //head -->
	<!-- body -->
	<div class="body">
		<!-- pwd -->
		<div class="formField pwd">
			<form name="idForm" id="idForm" onsubmit="return pwdValidate();" action="<%=request.getContextPath()%>/delete.me" method="post">
				<fieldset>
					<legend>회원탈퇴</legend>
					<h2 class="title">회원탈퇴</h2>
					<div class="item">
						<input name="pwd" title="비밀번호" class="input" id="idPwd" maxlength="20" type="password" placeholder="비밀번호">
                    </div>
                    <div class="item">
						<input name="pwdChk" title="비밀번호 확인" class="input" id="idPwdChk" maxlength="20" type="password" placeholder="비밀번호 확인">
					</div>
					<!-- btnWrap -->
					<div class="btnWrap">
                        <button class="button button-color01 block" id="btnCancle" type="button" onclick="cancle()">취소</button>
                        <button class="button button-color01 block" id="btnDelete" type="submit">회원탈퇴</button>
					</div>
					<!-- //btnWrap -->
				</fieldset>
			</form>
		</div>
	</div>
</section>
</div>


<script>


		function pwdValidate(){
			// 각 input 요소 가져오기
			var pwd = $("input[name='pwd']");
			var pwdChk = $("input[name='pwdChk']");
			
			
			// 두 input 요소에 하나라도 누락되지 않았는지 검사
			if(pwd.val().trim() == "" || pwdChk.val().trim() == ""){
				alert("모든 비밀번호 입력해주세요.");
				return false;
			}
			
			// 변경할 비밀번호와 변경할 비밀번호 확인 값이 일치하는지 검사
			if(pwd.val() != pwdChk.val()){
				alert("비밀번호가 다릅니다. 다시입력해주세요");
				pwdChk.val("").focus();
				return false;
			}
	
		}
		
		
</script>
<script>
	
	var msg = "<%=msg%>";

	$(function(){
	
		if(msg != "null"){
			alert(msg);
		}
	});
	
</script>
</body>
</html>