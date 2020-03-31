<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
    
    
body {
  color: #666;
  background: #f5f6f7;
}   
#jb-container {
  width: 1000px;
  height: 900px;
  margin: 0px auto;
  margin-top:30px;
  padding: 20px;
  border: none;
}
.jb-header {
  padding: 20px;
  margin-bottom: 20px;
  border: 1px solid #bcbcbc;
  height: 220px;
  border-radius: 20px;
  background: -webkit-linear-gradient(18deg, rgb(208, 207, 200), rgb(255, 255, 255));
  background: linear-gradient(18deg, rgb(208, 207, 200), rgb(255, 255, 255));
  border-bottom: 10px solid; 
}

.userTitle {
    margin-top: 30px;
    text-align: center;
	
    
}
.userTitle h1 {
	font-size:35px;
	font-weight:bold;
}
.userTitle h3 {
	font-size:25px;
	font-weight:bold;
	padding:30px;	
}
.userInfo{
    font-size: 16px;
    text-align: left;
    letter-spacing: 3px;
    word-spacing: 12px;
    width: 500px;
    margin: 0px auto;
    font-weight:bold;
	padding:6px;
	padding-left:250px;
	line-height:1.6em;
}

.btn_info{
    float: right;
    width: 200px;
    margin-top: -65px;
    margin-right: 20px;
}

.go_info {
	width: 200px;
	height: 50px;
	background-color: #ff6b1b;
	color: #fff;
	letter-spacing: -1px;
	font-size: 15px;
	padding: 0;
	text-align: left;
    padding-left: 20px;
    border-radius: 10px;
}
.go_info em {
	margin-left: 10px;
	position: absolute;
	font-size: 26px;
	transform: scale(0.5, 1);
	font-weight: 100;
	margin-top: -3px;
}


#jb-content {
  width: 450px;
  padding: 20px;
  margin-bottom: 70px;
  float: left;
  border: 1px solid #bcbcbc;
  height:300px;
  margin-top:40px;
}
#jb-sidebar {
  width: 400px;
  padding: 20px;
  margin-bottom: 70px;
  float: right;
  border: 1px solid #bcbcbc;
  height:300px;
  margin-top:40px;
}
#jb-sidebar h2 {
  margin-top: -10px;
  text-align: center;
}
#jb-sidebar h3 {
  text-align: center;
}
#jb-content h2 {
  margin-top: -10px;
  text-align: center;
}
#jb-content h3 {
  text-align: center;
}
#jb-footer {
  clear: both;
  padding: 20px;
  text-align: center;
}
#pick {
  width: 170px;
  height: 280px;
  float: left;
  cursor: pointer;
}
#watched {
  width: 170px;
  height: 280px;
  float: right;
  cursor: pointer;
}
#bookpicture {
  width: 240px;
  height: 240px;
  float: left;
}
#bookdetail {
  width: 240px;
  height: 240px;
  float: right;
}
</style>
</head>
<body>

	<%@ include file="../common/myPagebar.jsp"%>



  <div id="jb-container">
           <div class="jb-header">
            <div class="userTitle">
                <h1><%= loginUser.getName() %>님 반갑습니다!</h1>
                <h3>회원님의 현재 등급은 '<%= loginUser.getGrade() %>' 입니다</h3>
            </div>
            <div class="userInfo">
                <p> 아이디 : <%= loginUser.getId() %></p>
                <p> 이름    : <%= loginUser.getName() %></p>
                <p> 이메일 : <%= loginUser.getEmail() %></p>
                <p> 휴대폰번호 : <%= loginUser.getPhone() %></p>
            </div>
            <div class="btn_info">
                <button class="go_info" onclick="moveMyinfo();" type="button">회원정보수정 바로가기<em>&gt;</em></button>
            </div>
        </div>
        
        <div id="jb-content" style="text-align: center;">
          <h2>예매확인</h2>
          <%@ include file="../reserved/myPageReserved.jsp"%>
          
        </div>
        
        <div id="jb-sidebar">
          <h2>관람한영화</h2>
          <%@ include file="../payment/myPayment.jsp"%>
        </div>

        <div id=jb-footer>
        <div class="question">
	        <table class="question_tb">
	    		<thead>
		    		<h2><span>1:1 문의</span></h2>
		    			<hr>	
			    			<tr>
			        			<th width="650">제목</th>
			        			<th width="150">등록일</th>
			        			<th width="150">상태</th>
			    			</tr>
			    			<tr>
			        			<td width="650">테스트</td>
			        			<td width="150">2020-02-22</td>
			        			<td width="150">처리중</td>
			    			</tr>
	    		</thead>
	  		</table>
	    		<button id="Question_more" type="submit">더보기</button>
	  		</div>
  		</div>
      </div>
      
      <script>
          	function moveMyinfo() {
        location.href = "<%=contextPath%>/infoForm.me"
         }
      </script>
</body>
</html> 