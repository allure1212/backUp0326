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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
	position: absolute;
	top: 120px;
	left: 50%;
	z-index: 110;
	width: 800px;
	padding: 60px 60px 70px;
	background-color: #fff;
}
.modal-sizeS {
	width: 560px;
	padding-top:150px;
}





.modal .head {
	position: relative;
	margin: -8px 0 40px;
}



.login .title {
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
	margin-top: 10px;
}
.block {
	display: block;
	width: 100% !important;
}
.button {
	border: 1px solid #254069;
	display: inline-block;
	vertical-align: middle;
	min-width: 90px;
	height: 40px;
	margin: 0 3px;
	padding: 0 20px;
	border-radius: 3px;
	color: #254069;
	font-size: 16px;
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

.login .button {
	height: 50px;
	line-height: 50px;
}
.input {
	width: 250px;
	height: 50px;
	font-size: 16px;
	line-height: 50px;
}
input[type=email], input[type=number], input[type=password], input[type=tel], input[type=text] {
	-webkit-appearance: none;
	max-width: 100%;
	padding: 0 10px 0 18px;
	background: 0 0;
}
input[type=email], input[type=number], input[type=password], input[type=tel], input[type=text], select, textarea {
	border: 1px solid #ddd;
	color: #666;
}

.login .input {
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
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>
	
	<div id="wrap">
<section tabindex="0" class="modal modal-sizeS modal-findIdPw" id="modalFindIdPw" style="margin-left: -280px; display: block;">



<!-- modal -->
	<!-- head -->
	<div class="head">
		<h1 class="title">아이디 찾기</h1>
	</div>
	<!-- //head -->
	<!-- body -->
	<div class="body">
		<!-- login -->
		<div class="formField login">
			<form name="idForm" action="<%=request.getContextPath()%>/findId.me" id="idForm" method="post">
				<fieldset>
					<legend>아이디 찾기</legend>
					<h2 class="title">아이디 찾기</h2>
					<div class="item">
						<input name="name" title="이름" class="input" id="idName" type="text" placeholder="이름" required>
					</div>
					<div class="item">
						<input name="email" title="이메일" class="input" id="idEmail" type="text" placeholder="이메일" required>
					</div>
					<!-- btnWrap -->
					<div class="btnWrap">
						<button class="button button-color01 block" id="idBtn" onclick="id_search()" type="submit">아이디 찾기</button>
					</div>
					<!-- //btnWrap -->
				</fieldset>
			</form>
		</div>
	</div>
</section>
</div>

<script>

	$(function(){
	
	var msg = "<%=msg%>";
	
	if(msg != "null") {
		alert('고객님의 아이디는 ' + msg + ' 입니다.');
	}
	
});
	
	 function id_search() { 

		  var frm = document.idForm;

		  if (frm.name.value.length < 1) {
		   alert("이름을 입력해주세요");
		   return;
		  }
		  if (frm.email.value.length < 1) {
		   alert("이메일을 입력해주세요");
		   return;
		  }
		 
		  }
	
</script>


</body>
</html>