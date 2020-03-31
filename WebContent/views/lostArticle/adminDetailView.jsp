<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.lostarticle.model.vo.Lostarticle" %>
<%
	Lostarticle l = (Lostarticle)request.getAttribute("l");
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
				<th width="20%">번호</th>
				<th width="40%">지점</th>
				<th width="40%">작성일</th>
			</tr>
			<tr class="content">
				<td><%=l.getLostNo() %></td>
				<td><%=l.getPlace() %></td>
				<td><%=l.getLostDate() %></td>
			</tr>
			<tr>
				<th>작성자</th>
				<th>번호</th>
				<th>이메일</th>
			</tr>
			<tr class="content">
				<td><%=l.getName() %></td>
				<td><%=l.getPhone() %></td>
				<td><%=l.getEmail() %></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="2"><%=l.getTitle() %></td>
			</tr>
			<tr>
				<td colspan="3">
					<p><%=l.getContent() %></p>
				</td>
			</tr>
		</table>
		
		<div class="btns" align="right">
			<%if(l.getReplyStatus().equals("N")) {%>
			<button type="button" id="reply">답변하기</button>
			<%}else{ %>
			<button type="button" id="reply">답변보기</button>
			<%} %>
			<button type="button" onclick="history.back(-1);">뒤로가기</button>
		</div>
		
		<form action="<%=request.getContextPath()%>/reply.lo" method="POST">
			<div id="modal">
	   
			    <div class="modal_content" style="margin-top: -40%; width: 824px; height: 444px;">
			    	<%if(l.getReplyStatus().equals("N")) {%>
				        <h2>답변하기</h2>
					        <textarea name="replyContent" style="margin: 0px; width: 787px; height: 343px; resize:none;" placeholder="답변을 입력해주세요." id="replyAnswer"></textarea>
					        <input type="hidden" name="lostNo" value="<%=l.getLostNo() %>">
					        <button type="button" id="modal_close_btn">취소</button>
					        
						    <button type="submit" id="replyContent" style="margin-right: 10px;">답변등록</button>
			       	<%}else{ %>
			       		<h2>답변보기</h2>
				       
				        <textarea style="margin: 0px; width: 787px; height: 343px; resize:none;" readonly><%=l.getReplyContent()%></textarea>
				       
				        <button type="button" id="modal_close_btn">확인</button>
			       	<%} %>
			    </div>
			   
			    <div class="modal_layer"></div>
			</div>
		</form>
	</div>
	
	<script>
	    document.getElementById("reply").onclick = function() {
	        document.getElementById("modal").style.display="block";
	    }
	   
	    document.getElementById("modal_close_btn").onclick = function() {
	        document.getElementById("modal").style.display="none";
	    }
	</script>
</body>
</html>