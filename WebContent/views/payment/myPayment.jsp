<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*,
				com.kh.payment.model.dao.PaymentDto,
				com.kh.payment.model.service.PaymentService,
				javax.servlet.http.HttpSession,
				com.kh.member.model.vo.Member,
				com.kh.common.DateUtils" %>

<%
	
	Integer loginNo = ((Member)session.getAttribute("loginUser")).getMemberNo();
	
	List<PaymentDto> pd = new PaymentService().watchedMovie(loginNo);
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <style>
        *{margin:0; padding: 0;}
        .layoutWatched { height: 300px;}
        .watchedTable { overflow: hidden; width:100%}
        .watchedTable img { width:150px; height: 100px; margin: 3px 25px;}
        .watchedTable p {text-align: center; font-size: 12px; font-weight: 800;} 
		.layoutWatched table tr:hover { cursor: pointer;}
		.layoutWatched a {text-decoration: none }
		.watchedTable span.age {width:20px; height:20px; line-height:20px; margin-right:5px; border-radius:50%; font-weight: 700; display:inline-block; font-size:11px; color:#fff; text-align:center;}
        .watchedTable span.grade_0{background:#5BC77E;}
	 	.watchedTable span.grade_12{background:#4DD6FF;}
	 	.watchedTable span.grade_15{background:#FFC134;}
	 	.watchedTable span.grade_18{background:#ED4C6B;}
    </style>

</head>
<body>
<div class="layoutWatched">
      <a href="<%=request.getContextPath() %>/paymentDetail.do">
        <table class="watchedTable">
        	<% if(pd.size() == 0){ %>
        	<tr>
        		<td colspan="2" style="text-align:center; padding-top:50px;">당신의 이야기를 채워주세요</td>
        	</tr>
        	<% } %>
        	<% if(pd.size() == 1){ %>
        	<tr>
                <td>
                    <img src="<%=request.getContextPath() %>/resources/images/<%=pd.get(0).getModifyName()%>">
                    <p><span class="age grade_<%=pd.get(0).getAgeLimit()%>"><%=pd.get(0).getAgeLimit() %></span>
                    	<%=pd.get(0).getTitle()%></p>
                    <p><%= DateUtils.formatDate(pd.get(0).getScreenDate(),"yy/MM/dd HH:mm") %></p>
                </td>
            <tr>
        	<% } %>
        	<% if(pd.size() >=2){ %>	
        	 <tr>
                <td>
                    <img src="<%=request.getContextPath() %>/resources/images/<%=pd.get(0).getModifyName()%>">
                    <p>
                    	<span class="age grade_<%=pd.get(0).getAgeLimit()%>"><%=pd.get(0).getAgeLimit() %></span>
                    	 <%=pd.get(0).getTitle()%></p>
                    <p><%= DateUtils.formatDate(pd.get(0).getScreenDate(),"yy/MM/dd HH:mm") %></p>
                </td>
                <td>
                    <img src="<%=request.getContextPath() %>/resources/images/<%=pd.get(1).getModifyName()%>">
                    <p><span class="age grade_<%=pd.get(1).getAgeLimit()%>"><%=pd.get(1).getAgeLimit() %></span>
                    	<%=pd.get(1).getTitle()%></p>
                    <p><%= DateUtils.formatDate(pd.get(1).getScreenDate(),"yy/MM/dd HH:mm") %></p>
                </td>
            </tr>
        	<% } %>
        	<% if(pd.size()>3){ %>
            <tr>
                <td>
                    <img src="<%=request.getContextPath() %>/resources/images/<%=pd.get(2).getModifyName()%>">
                    <p><span class="age grade_<%=pd.get(2).getAgeLimit()%>"><%=pd.get(2).getAgeLimit() %></span>
                    	<%=pd.get(2).getTitle()%></p>
                    <p><%= DateUtils.formatDate(pd.get(2).getScreenDate(),"yy/MM/dd HH:mm") %></p>
                </td>
                <td>
                    <img src="<%=request.getContextPath() %>/resources/images/<%=pd.get(3).getModifyName()%>">
                    <p><span class="age grade_<%=pd.get(3).getAgeLimit()%>"><%=pd.get(3).getAgeLimit() %></span>
                    	<%=pd.get(3).getTitle()%></p>
                    <p><%= DateUtils.formatDate(pd.get(3).getScreenDate(),"yy/MM/dd HH:mm") %></p>
                </td>
            </tr>
            <% } %>
        </table>
	</a>
    </div>


</body>
</html>