<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.member.model.vo.*" %>
<%
	ArrayList<Member> list = (ArrayList<Member>)request.getAttribute("list");
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
		<h2 align="left">회원 관리</h2>
		<div align="right">
			<button onclick="show();" type="button">전체 회원 보기</button>
			<button onclick="yes();" type="button">가입중인 회원 보기</button>
			<button onclick="no();" type="button">탈퇴한 회원 보기</button>
		</div>
		<table class="listArea">
			<thead>
				<th>회원번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>회원등급</th>
				<th>성별</th>
				<th>회원가입일</th>
				<th>탈퇴여부</th>
			</thead>
			<tbody id="all">
				<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="7">조회된 리스트가 없습니다.</td>
				</tr>
				<% }else{ %>
					<% for(Member m : list){ %>
					<tr>
						<td><%= m.getMemberNo() %></td>
						<td><%= m.getId() %></td>
						<td><%= m.getName() %></td>
						<td>
							<%switch(m.getGrade()){ 
								case "N":%>Normal<%break;
								case "B":%>Bronze<%break;
								case "S":%>Silver<%break;
								case "G":%>Gold<%break;
								case "P":%>Platinum<%break;
								default:%>Non-Grade<%break;
							} %>
						</td>
						<td>
							<%if(m.getGender().equals("M"))	{ %>
								남성
							<%}else{ %>
								여성
							<%} %>
						</td>
						<td><%= m.getSignupDate() %></td>
						<td>
							<%if(m.getStatus().equals("N")) {%>
								가입중
							<%} else{ %>
								탈퇴함
							<%} %>
						</td>
					</tr>
					<% } %>
				<% } %>
			</tbody>
			<tbody id="yes" style="display:none;">
				<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="7">조회된 리스트가 없습니다.</td>
				</tr>
				<% }else{ %>
					<% for(Member m : list){ %>
						<%if(m.getStatus().equals("N")) {%>
							<tr>
								<td><%= m.getMemberNo() %></td>
								<td><%= m.getId() %></td>
								<td><%= m.getName() %></td>
								<td>
									<%switch(m.getGrade()){ 
										case "N":%>Normal<%break;
										case "B":%>Bronze<%break;
										case "S":%>Silver<%break;
										case "G":%>Gold<%break;
										case "P":%>Platinum<%break;
										default:%>Non-Grade<%break;
									} %>
								</td>
								<td>
									<%if(m.getGender().equals("M"))	{ %>
										남성
									<%}else{ %>
										여성
									<%} %>
								</td>
								<td><%= m.getSignupDate() %></td>
								<td>가입중</td>
							</tr>
						<%} %>
					<% } %>
				<% } %>
			</tbody>
			
			<tbody id="no" style="display:none;">
				<% if(list.isEmpty()){ %>
				<tr>
					<td colspan="7">조회된 리스트가 없습니다.</td>
				</tr>
				<% }else{ %>
					<% for(Member m : list){ %>
						<%if(m.getStatus().equals("Y")) {%>
							<tr>
								<td><%= m.getMemberNo() %></td>
								<td><%= m.getId() %></td>
								<td><%= m.getName() %></td>
								<td>
									<%switch(m.getGrade()){ 
										case "N":%>Normal<%break;
										case "B":%>Bronze<%break;
										case "S":%>Silver<%break;
										case "G":%>Gold<%break;
										case "P":%>Platinum<%break;
										default:%>Non-Grade<%break;
									} %>
								</td>
								<td>
									<%if(m.getGender().equals("M"))	{ %>
										남성
									<%}else{ %>
										여성
									<%} %>
								</td>
								<td><%= m.getSignupDate() %></td>
								<td>탈퇴함</td>
							</tr>
						<%} %>
					<% } %>
				<% } %>
			</tbody>
			
			
		</table>
		
		<br>
		
		<div class="pagingArea" align="center">
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.me';"> &lt;&lt; </button>
			
			<%if(currentPage == 1){ %>
			<button disabled> &lt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.me?currentPage=<%=currentPage-1%>';"> &lt; </button>
			<%} %>
			
			<%for(int p=startPage; p<=endPage; p++){ %>
				
				<%if(currentPage == p){ %>
				<button disabled> <%=p%> </button>
				<%}else{ %>
				<button onclick="location.href='<%= request.getContextPath()%>/adminList.me?currentPage=<%=p%>';"> <%= p %> </button>
				<%} %>
			
				
			<%} %>
			
			<%if(currentPage == maxPage){ %>
			<button disabled> &gt; </button>
			<%}else{ %>
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.me?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
			<button onclick="location.href='<%= request.getContextPath()%>/adminList.me?currentPage=<%=maxPage%>'"> &gt;&gt; </button>
		</div>
	</div>
	
	<script>
		$(function(){
			$(".listArea>tbody>tr").click(function(){
				
				var memberNo = $(this).children().eq(0).text();
				
				location.href="<%= request.getContextPath()%>/adminDetail.me?memberNo=" + memberNo;
			});
		});
		
		function show(){
			$("#all").css("display","");
			$("#yes").css("display","none");
			$("#no").css("display","none");
		}
		
		function yes(){
			$("#all").css("display","none");
			$("#yes").css("display","");
			$("#no").css("display","none");
		}
		
		function no(){
			$("#all").css("display","none");
			$("#yes").css("display","none");
			$("#no").css("display","");
		}
	</script>
</body>
</html>