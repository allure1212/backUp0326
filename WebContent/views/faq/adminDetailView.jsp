<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.faq.model.vo.Faq" %>
<%
	Faq f = (Faq)request.getAttribute("f");
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
	.outer>table{
		width:100%;
		height:100%;
	}
	.outer>table tr>*{
		border:0.5px solid black;
		height:50px;
	}
	.outer>table p{
		height:300px;
	}
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="outer">
		<table style="border-collapse:collapse">
			<tr>
				<th width="10%">글번호</th>
				<td width="20%" style="text-align:center"><%=f.getFaqNo() %></td>
				<th width="30%">구분</th>
				<td width="40%" class="content"><%=f.getType() %></td>

			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=f.getQuestion() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="4">
					<p><%=f.getAnswer() %></p>
				</td>
			</tr>
		</table>
		
		<div class="btns" align="right">
			<button id="delete" type="button">삭제</button>
			<button type="button" onclick="history.back(-1);">뒤로가기</button>
		</div>
	</div>
	
	<script>
		$(document).ready(function(){
			$('#delete').click(function(){
				var result = confirm("삭제 하시겠습니까?");
				
				if(result){
					alert("삭제가 완료되었습니다.");
					location.replace("adminList.fq");
					location.href='<%= request.getContextPath()%>/adminDelete.fq?faqNo=<%=f.getFaqNo()%>';
				}else{
				
				}
			})
		})
	</script>
</body>
</html>