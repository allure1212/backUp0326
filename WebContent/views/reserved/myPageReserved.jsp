<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,
				com.kh.reserved.model.service.ReserveService,
				com.kh.reserved.model.dao.ListOfReserved,
				com.kh.member.model.vo.Member,
				com.kh.common.DateUtils,
				javax.servlet.http.HttpSession"%>
<!DOCTYPE html>
<%
	Integer userNo = null;
	if((Member)session.getAttribute("loginUser")==null) {
		userNo = 1;
	}else {
		userNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
	}
	
	List<ListOfReserved> movies = new ReserveService().findServedInfoByUserNo(userNo);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        *{margin: 0; padding:0;}
        .layoutTable{ height: 300px; max-width: 500px; padding: 20px; margin-left: 30px;}
        .tableReserved table tr:hover { cursor: pointer; }
        .tableReserved table tr td p {padding: 3px; font-weight: 800; text-align: left; margin-left: 10px; }
		.tableReserved a {text-decoration: none }
    </style>
</head>
<body>
    <div class="layoutTable">
        <div class="tableReserved">
            <a href="<%=request.getContextPath() %>/reserveDetail.do">
            <table>
            	<% if(movies.size()>=2){%>
	            	<% for(int i=0; i<2; i++){ %>
	                <tr>
	                    <td><img src="<%= request.getContextPath() %>/resources/images/<%= movies.get(i).getModifyName() == null ? "noImageMain.jpg" : movies.get(i).getModifyName() %>" width="90px;" height="120px;"/></td>
	                    <td>
	                    	<p>예매번호 : <%= movies.get(i).getReservedNo() %>
	                        <p>영화제목 : <%= movies.get(i).getTitle() %></p>
	                        <p>영화관 : <%= movies.get(i).getTheaterName() %> </p>
	                        <p>상영날짜 : <%= DateUtils.formatDate(movies.get(i).getScreenDate(),"yy/MM/dd HH:mm") %></p>
	                    </td>
	                </tr>
	                <% } %>
                <% } else { %>
                	<tr>
                	<% for(int i=0; i<movies.size(); i++){ %>
	                    <td><img src="<%= request.getContextPath() %>/resources/images/<%= movies.get(i).getModifyName() == null ? "noImageMain.jpg" : movies.get(i).getModifyName() %>" width="90px;" height="120px;"/></td>
						<td>
							<p>예매번호 : <%= movies.get(i).getReservedNo() %>
							<p>영화제목 : <%= movies.get(i).getTitle() %></p>
							<p>영화관 : <%= movies.get(i).getTheaterName() %> </p>
							<p>상영날짜 : <%= DateUtils.formatDate(movies.get(i).getScreenDate(),"yy/MM/dd HH:mm") %></p>
						</td>
                	</tr>
                	<% } %>
                	<tr>
                		<td colspan="2" style="padding-top:20px;">예매정보가 더이상 없습니다.</td>
                	</tr>
                <% } %>
            </table>
            </a>
        </div>


    </div>





</body>
</html>