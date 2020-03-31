<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
	.total {
		position:static;
	}
	
    .sub-title{max-width:1200px; height:129px; padding-top:65px; margin:0 auto; background-image:url(resources/images/mypagetop.jpg); background-repeat:no-repeat; color:#fff; font-size:320%; text-align:center; margin:0px auto;}
    
    .sub-tabs{width:1200px; background-color:#fafafa; border-top:1px solid #d0d0d0; border-bottom:1px solid #d0d0d0; margin:0px auto;}
    
    .sub-tabs ul{width:1079px; margin:0 auto; text-align:center; overflow:hidden;}
    
    .sub-tabs li{float:left; width:25%; height:100%; text-align:center; }
    .sub-tabs li a{display:block; width:100%; padding:14px 0; font-size:14px; letter-spacing:-1px; color: rgb(153, 153, 153); text-decoration: none;}
    
	.sub-tabs>ul>li>ul>li{
    display: block;
    height: 35px;
    float: none;
    text-align: center;
    position: relative;
    font-size: 16px;
    margin: 0;
    padding: 0;
    }
    
	.sub-tabs>ul>li>ul{
    list-style-type:none;
    padding:0;
    display:none;
	}
	.sub-tabs>ul>li>a:hover+ul{
    display:block;
	}
	.sub-tabs>ul>li>ul:hover{
    display:block;
	}
</style>
</head>
<body>

	<%@ include file="../common/menubar.jsp"%>

	 <!-- 마이페이지 상단 공통 start -->
	<div class=total>
    <div class="sub-title">마이페이지</div>
    <div class="sub-tabs">
        <ul>
            <li>
            	<a href="<%=request.getContextPath()%>/infoChange.me">회원정보</a>
            		<ul>
						<li>
							<a href="<%=request.getContextPath()%>/infoForm.me">회원정보수정</a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/updatePwdForm.me">비밀번호변경</a>
						</li>
						<li>
							<a href="<%=request.getContextPath()%>/deleteForm.me">회원탈퇴</a>
						</li>
					</ul>
            </li>
            <li>
            	<a href="#">MY 영화</a>
            		<ul>
						<li>
							<a href="<%=request.getContextPath() %>/reserveDetail.do">예매확인</a>
						</li>
						<li>
							<a href="<%=request.getContextPath() %>/paymentDetail.do">관람한영화</a>
						</li>
					</ul>
            </li>
            <li><a href="#">일대일문의</a>
            </li>
        </ul>
    </div>
    </div>
    <!-- 마이페이지 상단 공통 end -->

</body>
</html> 