<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
position: absolute;
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


.idCheckBtn {
	width:100px;
	height:25px;
	margin:0px auto;
	margin-left: 40px;
	border:3px;
	background-color:#23b9ff;
	color:white;
	border-radius: 5px;
}
</style>


</head>
<body>

	<%@ include file="../common/menubar.jsp"%>


<div id="wrap">
	<section class="enroll enroll-join" id="enrollJoin" style="margin-left: -400px; display: block;">
		<div class="head">
			<h1 class="title">회원가입</h1>
		</div>
<!-- //head -->
<!-- body -->
		<div class="body" style="margin-top: 80px;"></div>
<!-- joining -->
		<div class="joining scroll">
			<form name="joinForm" id="memberVo" onsubmit="return check();" action="<%=request.getContextPath()%>/insert.me" method="post" >

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
							<th><span class="essential">*</span>아이디</th>
							<td>
								<input name="id" id="userId" title="아이디" class="input id" required="" maxlength="15" type="text" placeholder="영문, 숫자 포함 6글자 이상">
								<button type="button" class="idCheckBtn" onclick="checkId();">중복확인</button>
							</td>
						</tr>
						<tr>
							<th><span class="essential">*</span>비밀번호</th>
							<td>
								<input name="pwd" title="비밀번호" class="input pwd" id="pwd1" required="" type="password" maxlength="20" placeholder="영문 + 숫자 조합으로 8자 이상">
							</td>
						</tr>
						<tr>
							<th><span class="essential">*</span>비밀번호 확인</th>
							<td>
								<input name="pwdChk" title="비밀번호 확인" class="input pwdChk" id="pwd2" required="" type="password" maxlength="20" placeholder="영문 + 숫자 조합으로 8자 이상">
								<div class="alert alert-success" id="alert-success" style="float:right; margin-right:20px;">비밀번호가 일치합니다.</div> 
								<div class="alert alert-danger" id="alert-danger" style="float:right;">비밀번호가 일치하지 않습니다.</div>
							</td>
						</tr>
						<tr>
							<th><span class="essential">*</span>이름</th>
							<td>
								<input name="name" id="userName" title="이름" class="input name" type="text" maxlength="10">
							</td>
						</tr>
						<tr>
						<th><span class="essential">*</span>생년월일</th>
							<td>
								<input name="birth" id="userBirth" title="생년월일" class="input birth" type="text" maxlength="8" placeholder="ex) 19800320">
							</td>
						</tr>
						<tr>
						<th><span class="essential">*</span>이메일</th>
							<td>
								<input name="email" id="userEmail" title="이메일" class="input mail" type="email" maxlength="50">
							</td>
						</tr>
						<tr>
						<th><span class="essential">*</span>휴대폰번호</th>
							<td>
								<input name="phone" id="userPhone" title="휴대폰번호" class="input phone" type="tel" maxlength="11" placeholder="휴대폰번호 (숫자만)">
							</td>
						</tr>
						<tr>
						<th>전화번호</th>
							<td>
								<input name="tel" id="userTel" title="전화번호" class="input tel" type="tel" maxlength="11" placeholder="전화번호 (숫자만)">
							</td>
						</tr>
						<tr>
						<th><span class="essential">*</span>성별</th>
							<td>
								<span class="optionGroup">
                                    <label for="gender"><input name="gender" title="남성" id="genderM" type="radio" value="M" style="margin-right: 13px;">남성</label>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<label for="gender"><input name="gender" title="여성" id="genderF" type="radio" value="F" style="margin-right: 13px;">여성</label>
								</span>
							</td>
						</tr>
					</tbody>
				</table>
            </div>
            
            <div class="btnWrap">
                <button class="button button-sizeL button-color01" id="joinSubmitBtn" type="submit">회원가입</button>
            </div>
            <!-- //btnWrap -->
            
    </form>           
    </div>
    <!-- //body -->
</section>
</div>
                
 
<script type="text/javascript"> 

	$(function(){ 
	
	$("#alert-success").hide(); 
	$("#alert-danger").hide(); 
	$("input").keyup(function(){ 
		var pwd1=$("#pwd1").val(); 
		var pwd2=$("#pwd2").val(); 
		
		if(pwd1 != "" || pwd2 != ""){ 
			if(pwd1 == pwd2){ 
				$("#alert-success").show(); 
				$("#alert-danger").hide(); 
				$("#joinSubmitBtn").removeAttr("disabled"); 
			}else { 
				$("#alert-success").hide(); 
				$("#alert-danger").show(); 
				$("#joinSubmitBtn").attr("disabled", "disabled"); 
				} 
			} 
		}); 
}); 
	
	
	function checkId() {
		
		var userId = $("#memberVo input[name=id]");
		
		$.ajax({
			url:"checkId.me",
			data:{id:userId.val()},
			type:"post",
			success:function(result){
				
				//console.log(result);
				if(result == 1){
					alert("사용 불가능한 아이디입니다.");
					userId.focus();
					
				}else{
					
					if(confirm("사용 가능한 아이디입니다. 사용하시겠습니까?")){
						//userId.attr("readonly", "true");
						$("#joinSubmitBtn").removeAttr("disabled");
					}else{
						userId.focus();
					}
				}		
			},
		})
	}


	function check() {
		
	 var idReg = /^[a-z]+[a-z0-9]{5,16}$/g; // 아이디
	 var getMail = RegExp(/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/); // 이메일
	 var regex = /^[A-Za-z0-9]{8,20}$/; // 비밀번호
	 var nameJ = /^[가-힣]{2,6}$/; // 이름
	 var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/; // 휴대폰번호
	 var birthJ = /^(19[0-9][0-9]|20\d{2})+(0[0-9]|1[0-2])+(0[1-9]|[1-2][0-9]|3[0-1])$/; // 생년월일

	 
	 if( !idReg.test( $("input[name=id]").val() ) ) {
         alert("아이디는 영문자로 시작하는 6~15자 영문자 또는 숫자이어야 합니다.");
         return false;
     }
    
	if(!birthJ.test($("input[id=userBirth]").val())) {
		alert("생일 형식에 맞게 입력해 주세요.")
		return false;
	}
	
   //아이디와 비밀번호가 동일할 경우 경고 문구
   
   if($("#userId").val() == $("#pwd1").val()){ 
	   alert("아이디와 비밀번호가 같습니다."); 
	   $("#pwd1").val("");
	   $("#pwd2").val("");
	   $("#pwd1").focus(); 
	   return false; 
	   }

   // 비밀번호 유효성 검사
   
   if(!regex.test($("input[id=pwd1]").val())) {
		alert("비밀번호는 영문 + 숫자 조합의 8자리 이상 20자 이하로 작성해 주세요.")	
	    return false;
	}
   
   // 이름 유효성 검사
   
   if(!nameJ.test($("input[id=userName]").val())){
	   alert("이름 형식에 맞게 입력해 주세요.")
	   return false;
   }
   
   // 생년월일 공백 확인
   
   if($("#userBirth").val() == ""){
	  alert("생년월일을 입력해 주세요.")
	  $("#userBirth").val("");
	  $("#userBirth").focus();
	  return false; 	   
  	 }
   
   //이메일 공백 확인 
   
   if($("#userEmail").val() == ""){
	   alert("이메일을 입력해 주세요.");
	   $("#userEmail").focus();
	   return false; 
	   } 
   
   //이메일 유효성 검사 
   
   if(!getMail.test($("#userEmail").val())){ 
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
   
   if(!phoneJ.test($("input[id=userPhone]").val())) {
		alert("휴대폰번호 형식에 맞게 입력해 주세요.")	
	    return false;
	} 	
   

   
   
   
	}
	



</script>


<!-- <script language="JavaScript">
	

	function check() {

	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	if(!document.joinForm.gender.value) {
			alert("성별을 체크해 주세요.");
			return false;
	}
	
	 if(email.value=="") {
         alert("이메일을 입력해 주세요");
         email.focus();
         return false;
     }

     if(!check(re2, email, "적합하지 않은 이메일 형식입니다.")) {
         return false;
     }

}

	

</script>
 -->


</body>
</html>