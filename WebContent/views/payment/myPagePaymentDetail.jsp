<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List, java.util.Date,
					com.kh.reserved.model.service.ReserveService,
					com.kh.reserved.model.dao.ListOfReserved,
					com.kh.reserved.model.dao.ListOfMemTypeDto,
					com.kh.member.model.vo.Member,
					com.kh.reserved.model.vo.PageInfo,
					com.kh.common.DateUtils" %>    
<%
	List<ListOfReserved> lop = (List<ListOfReserved>)request.getAttribute("lop");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	String countPerPage = request.getParameter("countPerPage");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>

        * {margin: 0; padding:0;}
        .layout { position: relative; padding:0 15px; max-width: 1000px; margin:0 auto; min-height:550px;}
        .listPayment table {font-size: 13px; margin: 0 auto; margin-top:30px;}
        .listPayment table tr td {color: black; text-align: center;
                     padding: 10px 30px; border:1px solid #333; font-size: 15px; font-weight: 900;}
        #paymentTable img {width: 200px; height: 300px;}
   		.pageBtns {margin-top: 15px;}

        .modal ul li {list-style: none; margin-bottom: 7px;}
        .modal .modal-content { width: 500px; overflow: hidden; font-size: 13px;}
        .modal .modal-content p { font-size: 20px; font-weight: 700; margin: 10px;}
        .modal .modal-content .reserved_movie { width: 55%; float: left;}
        .modal .modal-content .reserved_movie .reserved_movie_title { margin: 10px auto; font-weight: 800; font-size: 16px;}
        .modal .modal-content .reserved_movie .movie_poster { width: 150px; height: 180px; border:1px solid black;}
        .modal .modal-content .reserved_movie .movie_poster img {width: 150px; height: 180px; background: lightsteelblue;}
        .modal .modal-content .script_payment { width: 45%; float: left; }
        .modal .modal-content .script_payment .ticket_cost { margin-top: 40px; margin-bottom: 100px;}
        .modal .modal-content .script_payment .btn {margin:10px;}
        
        span.age {width:26px; height:26px; line-height:26px; margin-right:5px; border-radius:50%; font-weight: 700; display:inline-block; font-size:11px; color:#fff; text-align:center;}
        span.grade_0{background:#5BC77E;}
	 	span.grade_12{background:#4DD6FF;}
	 	span.grade_15{background:#FFC134;}
	 	span.grade_18{background:#ED4C6B;}
   
   
	
        /* the Modal */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            left : 0;
            top : 0;
            width: 100%;
            height: 100%;
            overflow: auto;
            background-color: rgba(0,0,0,0.7);  /* balck w/ opacity*/
            border: 1px solid black;
            border-radius: 5px;

        }
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 50%; /* Could be more or less, depending on screen size */                          
        }
        /* The Close Button */
        .btn {
            color: #aaa;
            float: right;
            font-size: 18px;
            font-weight: bold;
        }
        .btn:hover, .btn:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
	   
   
    </style>
</head>
<body>
	<%@ include file="../common/myPagebar.jsp"%>

    <div class="layout">
    	  	
        <div class="listPayment">
            <table id="paymentTable">
                    <tr> <!-- 첫번째 줄 -->
                    	<% if(lop.size()>=3){ %>
                    		<% for(int i=0; i<3; i++){ %>
                    		<td>
	                            <img src="<%=request.getContextPath()%>/resources/images/<%=lop.get(i).getModifyName()%>"/>
	                            <p><%=lop.get(i).getTitle()%></p>
	                            <p><%=lop.get(i).getTheaterName()%></p>
	                            <p><%=DateUtils.formatDate(lop.get(i).getScreenDate(),"yy-MM-dd HH:mm")%></p>
                        	</td>
                    		<% } %>
                    	<% }else{ %>
                    		<% for(int i=0; i<lop.size(); i++){ %>
	                        <td>
	                           	<img src="<%=request.getContextPath()%>/resources/images/<%=lop.get(i).getModifyName()%>"/>
	                            <p><%=lop.get(i).getTitle()%></p>
	                            <p><%=lop.get(i).getTheaterName()%></p>
	                            <p><%=DateUtils.formatDate(lop.get(i).getScreenDate(),"yy-MM-dd HH:mm")%></p>
	                        </td>
	                        <% } %>
	                        <% for(int i=0; i<3-lop.size(); i++){ %>
	                        <td>
	                        	<img src="<%=request.getContextPath()%>/resources/images/heart1.png"
	                        		style="width:100px; height:100px;"/>
	                            <p style="margin:10px;">즐거운 기억</p>
	                            <p style="margin:10px;">행복한 순간</p>
	                            <p style="margin:10px;">영원한 추억</p>
	                            <p style="margin:10px;">당신의 시간을 만드세요</p>
	                        </td>
	                        <% } %>
                        <% } %>
                    </tr>

                    <tr> <!-- 두번째 줄 -->
                        <% if(lop.size()>3){ %>
                    		<% for(int i=0; i<lop.size(); i++){ %>
	                        <td>
	                           	<img src="<%=request.getContextPath()%>/resources/images/<%=lop.get(i).getModifyName()%>"/>
	                            <p><%=lop.get(i).getTitle()%></p>
	                            <p><%=lop.get(i).getTheaterName()%></p>
	                            <p><%=DateUtils.formatDate(lop.get(i).getScreenDate(),"yy-MM-dd HH:mm")%></p>
	                        </td>
	                        <% } %>
	                        <% for(int i=0; i<3-lop.size(); i++){ %>
	                        <td>
	                            <p style="margin:10px;">즐거운 기억</p>
	                            <p style="margin:10px;">행복한 순간</p>
	                            <p style="margin:10px;">영원한 추억</p>
	                            <p style="margin:10px;">당신의 시간을 만드세요</p>
	                        </td>
	                        <% } %>
                        <% } %>
                    </tr>
                    
                
            </table>
            <div class="pageBtns" align="center">
            	<!-- 맨처음으로 -->
            	<!-- 이전 페이지 -->
	            <% if(pageInfo.getCurrentPage() != 1){ %>
            		<a href="<%=request.getContextPath()%>/reserveDetail.do?currentPage=1">&lt;&lt;</a>
            		<a href="<%=request.getContextPath()%>/reserveDetail.do?currentPage=<%= pageInfo.getCurrentPage()-1%>&countPerPage=<%=countPerPage%>"> &lt;</a>
            	<% } %>
            	
            	<!-- 페이지 목록 -->
            	<% for(int p = pageInfo.getStartPage(); p <= pageInfo.getEndPage(); p++){ %>
            		<% if(pageInfo.getCurrentPage() == p){ %>
            			<a href="#" style="text-decoration:none;"><%= p %></a>
            		<% }else{ %>
            			<a href="<%=request.getContextPath()%>/reserveDetail.do?currentPage=<%=p%>&countPerPage=<%=countPerPage%>"><%=p %></a>
            		<% } %>
            	<% } %>
            	
            	<!-- 다음페이지-->
            	<% if(pageInfo.getCurrentPage() != pageInfo.getMaxPage()){ %>
            		<a href="<%=request.getContextPath()%>/reserveDetail.do?currentPage=<%=pageInfo.getCurrentPage()+1%>&countPerPage=<%=countPerPage%>">&gt;</a>
            		<a href="<%=request.getContextPath()%>/reserveDetail.do?currentPage=<%=pageInfo.getMaxPage()%>">&gt;&gt;</a>
            	<% } %>
            	<!-- 맨마지막 페이지 -->
            </div>
        </div>
    
    
        <!-- The Modal -->
        <div id="reserveInfo" class="modal">
            <!-- Modal Content -->
            <div class="modal-content">
                <div class="reserved_movie">
                    <p>예매내역 확인</p>
				
                    <div class="movie_poster">
                        <img src=""/>
                    </div>
                    <div class="reserved_movie_title">
                        <span class="age"></span>
                        <strong>영화제목</strong>
                    </div>
                    <ul>
                        <li><span>예매번호 :</span><span class="info"></span></li>
                        <li><span>상영일시 :</span> <span class="info"></span></li>
                        <li><span>영화관 :</span> <span class="info"></span></li>
                        <li><span>인원:</span> <span class="info"></span></li>
                        <li><span>좌석:</span> <span class="info"></span></li>
                        
                    </ul>
                </div>
                <div class="script_payment">
                    <p>결제내역 확인<p>

                    <div class="ticket_cost">
                        <ul>
                            <li><span>결제번호 :</span><span class="info"></span></li>
                            <li><span>결제일시 :</span><span class="info"></span></li>
                            <li><span>결제방식 :</span><span class="info"></span></li>
                            <li><span>결제금액 :</span><span class="info"></span></li>
                        </ul>
    
                    </div>
                    <div class="btns">
                        <div class="move_step">
                            <button type="button" class="btn" id="cancelBtn">예매취소</button>
                            <button type="button" class="btn" id="checkBtn">예매확인</button>

                        </div> 
                    </div>
    
                </div>
            </div>
        </div>
    
    </div>

<%@ include file="/views/common/footer.jsp" %>


<script>

</script>


</body>
</html>