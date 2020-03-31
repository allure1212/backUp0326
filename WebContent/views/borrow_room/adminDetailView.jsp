<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.borrow_room.model.vo.BorrowRoom" %>
<%
	BorrowRoom b = (BorrowRoom)request.getAttribute("b");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:75%;
		height:100%;
		float:left;
		margin:auto;
		margin-top:30px;
		margin-left:5%;
	}
	.outer>table tr>*{
		border:0.5px solid black;
		height:50px;
	}
	.outer>table{
		width:100%;
		height:100%;
	}
	.outer>table p{
		height:300px;
	}
	.content{
		text-align:center;
	}
	#modal {
	  display:none;
	  position:relative;
	  width:100%;
	  height:100%;
	  z-index:1;
	}
	
	#modal h2 {
	  margin:0;   
	}
	
	#modal button {
	  display:inline-block;
	  width:100px;
	  float:right;
	}
	
	#modal .modal_content {
	  width:300px;
	  margin:100px auto;
	  padding:20px 10px;
	  background:#fff;
	  border:2px solid #666;
	}
	
	#modal .modal_layer {
	  position:fixed;
	  top:0;
	  left:0;
	  width:100%;
	  height:100%;
	  background:rgba(0, 0, 0, 0.5);
	  z-index:-1;
	} 
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="outer">
		<table style="border-collapse:collapse">
			<tr>
				<th>회원번호</th>
				<td colspan="4"><%=b.getMemberNo() %></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td colspan="4"><%=b.getEmail() %></td>
			</tr>
			<tr>
				<th>인원</th>
				<td style="text-align:center">성인 : <%=b.getAdultCount() %> 명</td>
				<td style="text-align:center">청소년 : <%=b.getYouthCount() %> 명</td>
				<td style="text-align:center">노인 : <%=b.getSeniorCount() %> 명</td>
				<td style="text-align:center">장애인 : <%=b.getDisabledCount() %> 명</td>
			</tr>
			<tr>
				<th>희망일자</th>
				<td colspan="4"><%=b.getHopeDate() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="4"><%=b.getTitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="4">
					<p><%=b.getContent() %></p>
				</td>
			</tr>
		</table>
		
		<div class="btns" align="right">
			<button type="button" onclick="history.back(-1);">뒤로가기</button>
		</div>
	</div>
</body>
</html>