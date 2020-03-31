<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.faq.model.vo.*" %>
<%
	ArrayList<Faq> list = (ArrayList<Faq>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
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
	.listArea{
		width:100%;
		border-top:2px solid gray;
		margin-top:3.5px;
	}
	.listArea>tbody{
		font-size:15px;
	}
	.listArea>tbody td{
		height:50px;
		text-align:center;
	}
	.listArea>tbody>tr:hover{
		cursor:pointer;
	}
</style>
</head>
<body>

	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="outer">
		<h2 align="left">Faq</h2>
		<button onclick="location.href='<%= request.getContextPath()%>/adminInsertForm.fq'" style="margin-left:94%">Faq 작성</button>
		<table class="listArea">
			<thead>
				<th width="10%">글번호</th>
				<th width="15%">구분</th>
				<th width="75%">질문</th>
			</thead>
			<tbody>
				<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="3">조회된 리스트가 없습니다.</td>
				</tr>
				<% }else{ %>
					<% for(Faq f : list){ %>
					<tr>
						<td><%= f.getFaqNo() %></td>
						<td><%= f.getType() %></td>
						<td><%= f.getQuestion() %></td>
					</tr>
					<% } %>	
				<% } %>
			</tbody>
		</table>
		
		<br>
		
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.fq';"> &lt;&lt; </button>
			
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.fq?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<%} %>
			
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(currentPage == p){ %>
				<button disabled> <%=p%> </button>
				<%}else{ %>
				<button onclick="location.href='<%= request.getContextPath()%>/adminList.fq?currentPage=<%=p%>';"> <%= p %> </button>
				<%} %>
			
				
			<%} %>
			
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.fq?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.fq?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				
				var faqNo = $(this).children().eq(0).text();
				
				location.href="<%= request.getContextPath()%>/adminDetail.fq?faqNo=" + faqNo;
			});
		});
	</script>
</body>
</html>