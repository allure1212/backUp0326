<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

     body, div, ul, ol, li, h1, h2, h3, h4, h5, h6, pre, code, form, fieldset, legend, textarea, p, blockquote, th, td, input, select, textarea, button {
         margin: 0;
         padding: 0;
     }
     .login_pictures {
         width: 100%;
         min-height: 100%;
         font-size: 14px;
         background: #f5f6f7;
         letter-spacing: -1px;
         padding: 30px 0 100px;
     }
     html, body {
         font-size: 12px;
         color: #666;
         font-family: "noto_sans","Noto Sans",Noto Sans Korean Regular,sans-serif,"나눔고딕","Nanum Gothic",dotum,"돋움",gulim,"굴림",Tahoma;
     }
  
     body {
         min-width: 1220px !important;
     }
     body {
         margin-left: 0px !important;
         padding-left: 0px !important;
     }
     body {
         font-size: 12px;
         font-family: "noto_sans","Noto Sans",Noto Sans Korean Regular,sans-serif,"나눔고딕","Nanum Gothic",dotum,"돋움",gulim,"굴림",Tahoma;
     }
     .login_777 {
         width: 482px;
         margin: 0 auto;
         padding-top:100px;
     }
     .tc {
         text-align: center !important;
     }
     .login_pictures .welcome {
         padding: 0 0 20px;
     }
     .login_pictures .idCookie {
         color: #9e9e9e;
         height: 50px;
         border-bottom: 1px solid #dcddde;
         padding: 15px 0 5px;
         margin-bottom: 30px;
     }

     a {
         color: #999;
         text-decoration: none;
     }

     .fr {
         float: right !important;
     }

     .login_pictures p {
         padding: 10px 0;
     }
     .login_pictures .idCookie a {
         color: #5c5c5c;
         font-weight: 700;
     }
     .login_pictures .idCookie span.bar {
         line-height: 8px;
         font-size: 8px;
         border-left: 1px solid #dcddde;
         margin: 0 6px 0 11px;
     }
     input {
         line-height: 16px !important;
         vertical-align: -3px;
         font-family: dotum,"돋움",gulim,"굴림",Tahoma,sans-serif;
     }

     .login_pictures input, .login_pictures select {
         border: 0 none;
         font-family: "noto_sans","Noto Sans",Noto Sans Korean Regular,sans-serif,"Ã¥ÂÂ Ã¬Å½â€žÃ¬â€˜Â´?Ã¬â€¹Â·Ã£Å½â€¢?Ã¬Ë†Ë†Ã¬â€šâ€¢?Ã¬Â¢Å½Ã«Å“Â¦?Ã¬Å¾Å¾Ã¬Ëœâ„¢Ã©â€¡â€°Ã«ÂÂ»Ã­Ââ€¢?ÃªÂ³â€”Ã«Â­Â½Ã¦Â¹Â²Ã¬Å¡Â¸Ã¬Ëœâ„¢Ã¥ÂÂ Ã¬Å½Å’Ã¬â€šâ€¢Ã©Ë†ÂºÃªÂ³â€”??Ã­ÂÂªÃ¤ÂºÂ¦Ã«â€šâ€ ??ÃªÂ¹â€šÃ¥ÂÂ Ã¬Å½â€žÃ¬â€˜Â´?Ã¯Â½ÂÃ¬Ëœâ„¢Ã¦Â´Â¹ÃŽÂ¿Ã¬Ëœâ„¢Ã¥ÂÂ Ã¬Å½â€žÃ«Å¾Â©?Ã«Å¾Æ’Ã¬Ëœâ„¢Ã¨Â¢ÂÃ¢â€™Â²Ã«Å¸Â»Ã§Â­Å’Ã¢â€°ÂªÃ«Â£Å¾?Ã¬â€¡Â¿Ã«Å“Â?Ã«Å¡Â®Ã«Ââ€žÃ¥ÂÂ Ã¬Ââ„¢Ã¬Ëœâ„¢??Ã¬Â­ÂªÃ¥ÂÂ ?","Nanum Gothic",dotum,"Ã¥ÂÂ Ã¬Å½â€žÃ¬â€˜Â´?Ã¬â€¹Â·Ã¬Ëœâ„¢Ã¦Â´Â¹?ÃªÂ¶â€œÃ§Â­Å’Ã¢â€°ÂªÃ«Â£Å¾?Ã¬â€¡Â¿Ã«Å“Â?Ã«ÂÅ’Ã¬Ëœâ„¢?ÃªÂ³â€”Ã«Â®â€¹?Ã¬Ë†â€¹Ã¬Ëœâ„¢Ã¥ÂÂ Ã¬Ââ‚¬Ã«â‚¬Â¬Ã©Â¸Å¡Ã«Â£Â¹ÃªÂ¼Â·Ã¥Âªâ€ºÃ«Â°Â§Ã«Å“Â?Ã«Å¡Â®Ã«Â±Â¦?Ã¬Â¢â€˜Ã¬Ëœâ„¢",gulim,"Ã¥ÂÂ Ã¬Å½â€žÃ¬â€˜Â´?Ã¯Â½ÂÃ¬Ëœâ„¢Ã¦Â´Â¹ÃŽÂ¼?Ã¥ÂÂ Ã¬Å½â€žÃ«Å¾Â¨Ã¦â‚¬Â¡Ã£Æ’Â¯Ã¬Ëœâ„¢Ã¨Â¢ÂÃ¢â€™Â²Ã«Å¸Â»Ã¥ÂÂ Ã¬Å½â€žÃ«Å¾Â¨Ã¥Â½â€ºÃ¢â€˜Â¼Ã¬Ëœâ„¢Ã¦Â´Â¹ÃŽÂ¼Ã¬Â»Â",Tahoma;
         font-size: 16px;
         color: #000;
     }

     .login_pictures .gray {
         color: #9e9e9e;
     }
     .login_pictures .text14 {
         font-size: 14px;
     }
     .login_pictures .login_input {
         margin: 0 0 10px;
         box-sizing: border-box;
         width: 100%;
     }
     .login_pictures .login_input {
         position: relative;
         background-color: #fff;
     }



     .login_pictures input.loginId, .login_pictures input.loginPw {
         position: relative;
         display: block;
         width: 100%;
         height: 68px;
         line-height: 68;
         border: 1px solid #dfe1e3;
         padding-top: 20px;
         padding-bottom: 20px;
         padding-left: 60px;
         background: transparent;
         box-sizing: border-box;
     }
     .login_pictures input.loginId {
         background-image: url("resources/images/login_ico_id.png");
         background-repeat: no-repeat;
         background-position: 20px 20px;
     }
     .login_pictures input.loginPw {
         margin-top: -1px;
         background-image: url("resources/images/login_ico_pw.png");
         background-repeat: no-repeat;
         background-position: 20px 20px;
         border-top: 1px solid #f5f6f7;
     }
     .login_pictures .welcome h2 {
         font-size: 100px;
         height: 110px;
         font-weight: 100;
         color: #2b2b2b;
         margin-top:50px;
     }
     .login_pictures .title_sub {
         font-size: 23px;
         padding: 5px;
     }
         </style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>         
<script>
 function loginValidate() {
      		
     if($("#login_sub_id").val().trim().length == 0){
      	alert("아이디를 입력하세요");
      	$("#login_sub_id").focus();
      	return false;
     } 
      		
     if($("#login_main_pw").val().trim().length == 0){
      	alert("비밀번호를 입력하세요");
      	$("#login_main_pw").focus();
      	return false;
     }
     
	   	return true;	
      	
     }
      
</script>   
         
</head>
<body>
    
    <%@ include file="../common/menubar.jsp"%>


<div class="login_pictures">
    <!--로그인-->
    <div class="login_777">
        <div class="section tc welcome">
            <h2>Welcome</h2>
            <p class="title_sub">Pictures에 오신 것을 환영 합니다.</p>
        </div>
        <div class="section">
            <form name="loginFrm" style="margin:0" action="<%=request.getContextPath()%>/login.me" method="post" onsubmit="return loginValidate();">
            	<p class="gray text14 tc">로그인을 위하여 아래 아이디와 비밀번호를 입력하여 주세요.</p>
            	<div class="login_input">
                    <input name="userId" tabindex="1" class="loginId" id="login_sub_id" type="text" size="16" maxlength="15" placeholder="아이디" autocomplete="Off">
                    <input name="userPwd" tabindex="2" class="loginPw" id="login_main_pw" type="password" size="16" maxlength="20" placeholder="비밀번호" autocomplete="Off">
            	</div>
	
		<input style="display:block; width:100%; height:80px; line-height:80px; background:#23b9ff; font-size:20px; font-weight:500; color:#fff; text-align:center; cursor:pointer;" type="submit" readonly="readonly" value="로그인">
    
        	</form>
        </div>
        <div class="section idCookie">
            <p class="fr">
                <a href="<%=request.getContextPath()%>/enrollForm.me">회원가입</a><span class="bar"></span>
                <a class="open_find_id" href="<%=request.getContextPath()%>/findIdForm.me">아이디 찾기</a><span class="bar"></span>
                <a class="open_find_pw" href="<%=request.getContextPath()%>/findPwdForm.me">비밀번호 찾기</a>
            </p>
        </div>
    </div>

</div>

</body>
</html>