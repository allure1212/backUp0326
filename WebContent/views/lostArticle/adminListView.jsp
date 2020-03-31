<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.lostarticle.model.vo.*" %>
<%
	ArrayList<Lostarticle> list = (ArrayList<Lostarticle>)request.getAttribute("list");
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
		margin-top:2.5px;
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
		<h2 align="left">분실물문의</h2>
		<div align="right">
			<button onclick="replyAll();" type="button">전체 보기</button>
			<button onclick="replyNo();" type="button">답변미완료 보기</button>
		</div>
		<table class="listArea">
			<thead>
				<th width="10%">글번호</th>
				<th width="10%">영화관</th>
				<th width="55%">제목</th>
				<th width="10%">작성일</th>
				<th width="15%">답변여부</th>
			</thead>
			<tbody id="all">
				<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="5">조회된 리스트가 없습니다.</td>
				</tr>
				<% }else{ %>
					<% for(Lostarticle l : list){ %>
					<tr>
						<td><%= l.getLostNo() %></td>
						<td><%= l.getPlace() %></td>
						<td><%= l.getTitle() %></td>
						<td><%= l.getLostDate() %></td>
						<td>
							<%if(l.getReplyStatus().equals("Y")) {%>
								답변완료
							<%} else{ %>
								답변미완료
							<%} %>
						</td>
					</tr>
					<% } %>
				<% } %>
			</tbody>
			
			<tbody id="no" style="display:none;">
				<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="5">조회된 리스트가 없습니다.</td>
				</tr>
				<% }else{ %>
					<% for(Lostarticle l : list){ %>
						<%if(l.getReplyStatus().equals("N")) {%>
						<tr>
							<td><%= l.getLostNo() %></td>
							<td><%= l.getPlace() %></td>
							<td><%= l.getTitle() %></td>
							<td><%= l.getLostDate() %></td>
							<td>답변미완료</td>
						</tr>
						<%} %>
					<% } %>
				<% } %>
			</tbody>
		</table>
		
		<br>
		
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.lo';"> &lt;&lt; </button>
			
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.lo?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<%} %>
			
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(currentPage == p){ %>
				<button disabled> <%=p%> </button>
				<%}else{ %>
				<button onclick="location.href='<%= request.getContextPath()%>/adminList.lo?currentPage=<%=p%>';"> <%= p %> </button>
				<%} %>
			
				
			<%} %>
			
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.lo?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.lo?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				
				var lostNo = $(this).children().eq(0).text();
				
				location.href="<%= request.getContextPath()%>/adminDetail.lo?lostNo=" + lostNo;
			});
		});
		
		function replyAll(){
			$("#all").css("display","");
			$("#no").css("display","none");
		}
		
		function replyNo(){
			$("#all").css("display","none");
			$("#no").css("display","");
		}
	</script>
</body>
</html>