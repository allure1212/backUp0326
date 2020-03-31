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
	
	List<ListOfReserved> lor = (List<ListOfReserved>)request.getAttribute("lor");	
	String msg = (String)session.getAttribute("msg");
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	String countPerPage = request.getParameter("countPerPage");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		*{margin:0; padding:0;}
        .layout { position: relative; padding:0 15px; width: 1000px; margin:0 auto; min-height:550px;}
        .listReserved table {font-size: 13px; margin-top:30px;}
        .listReserved table tr { height: 30px;}
        .listReserved table tbody tr:hover { cursor: pointer; background: lightpink;}
        .listReserved table thead tr:nth-child(1) { height: 35px; background: none;}
        .listReserved table tr th {border-bottom: 1px double darkred;}
        .listReserved table tr td {text-align: center;  border-bottom: 1px solid black;}
        .listReserved table tr td:nth-child(7){text-align:left;}
        .listReserved table tr td span {margin-left:10px;}
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
		
		.align-right {text-align: right;}
		.align-center {text-align: center;}
		.align-left {text-align: left;}

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
	
	<script>
		var msg = "<%=msg%>";
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("msg");%>
		}
	
	</script>
	
	
    <div class="layout">
    	<div class="boardSearch align-right">
    		<form id="searchForm">
    			<label>보여질 예매 갯수: </label>
	    		<select name="countPerPage" onchange="document.getElementById('searchForm').submit();" style="width:70px; margin-top:20px;">
	    			<option <%if("5".equals(countPerPage)) {%> selected="selected" <%}%>>5</option>
	    			<option <%if("7".equals(countPerPage)) {%>selected="selected"<%}%>>7</option>
	    			<option <%if("10".equals(countPerPage) || countPerPage == null) {%>selected="selected"<%}%>>10</option>
	    			<option <%if("12".equals(countPerPage)) {%>selected="selected"<%}%>>12</option>
	    		</select>
    		</form>
    	</div>
    	
        <div class="listReserved">
            <table id="reservedTable">
            	<thead>
	            	<tr>
	            		<th width="150px;">회원NO</th>
	            		<th width="200px;">회원ID</th>
	                    <th width="200px;">예매번호</th>
	                    <th width="300px;">예매일자</th>
	                    <th width="200px;">영화관</th>
	                    <th width="150px;">상영관</th>
	                    <th width="450px;">영화</th>
	                    <th width="300px">상영일시</th>
	                    <th width="250px;">인원</th>
	                    <th width="300px;">결제금액</th>
	                </tr>
            	</thead>
                <tbody>
                        <!-- Trigger/Open the Modal-->
	                <% for(ListOfReserved lr : lor){ %>
		                <tr data-id="<%=lr.getReservedNo()%>">
		                    <td><%=lr.getMemberNo() %></td>
		                    <td><%=lr.getMemberId() %></td>
		                    <td><%=lr.getReservedNo() %></td>
		                    <td><%=DateUtils.formatDate(lr.getPaymentDate(),"yy-MM-dd HH:mm") %></td>
		                    <td><%=lr.getTheaterName() %></td>
		                    <td><%=lr.getRoomName() %>관</td>
		                    <td>
		                    	<span class="age grade_<%=lr.getAgeLimit()%>"><%=lr.getAgeLimit() %></span>
		                     	<%=lr.getTitle() %>
		                     </td>
		                    <td><%=DateUtils.formatDate(lr.getScreenDate(),"yy-MM-dd HH:mm") %></td>
		                    <td>
			                    <% for(ListOfMemTypeDto lotd : lr.getRsvMemType() ){
			                    	if(lotd.getReservedCount() != 0){%>
			                    	<%=lotd.getMemType()%> <%=lotd.getReservedCount()%>명
			                    	<% } %>
			                    <% } %>
		                    </td>
		                    
		                    <td><%=lr.getAmount() %>원</td>
		                </tr>
	                <% } %>
	                <% if (lor.isEmpty()) { %>
	                	<tr><td colspan="8">예매내역이 없습니다.</td></tr>
	                <%} %>
                </tbody>
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

        </div >

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
    
    
    <form id="cancelForm" action="${contextPath}/cancelReserved.do" role="form" method="POST">
        <input type="hidden" name="reservedNo" value=""/>

    </form>


    <script>
        var $modal = $('#reserveInfo');
        var table = document.getElementById('reservedTable');
        var rows = table.getElementsByTagName("tr");
        var $checkBtn = $('#checkBtn');
        var cancelBtn = document.getElementById('cancelBtn');
        var cancelForm = document.getElementById('cancelForm');
		var $tbody = $('#reservedTable > tbody');
		
		var $poster = $('.movie_poster > img');
		var $ageLimit = $('.reserved_movie_title > span');
		var $title = $('.reserved_movie_title > strong');
		var $reserveInfo = $('.reserved_movie > ul > li');
		var $paymentInfo = $('.ticket_cost > ul > li');
		
		var $reservedNo = $($reserveInfo[0]).find('.info');
		var $screenDate = $($reserveInfo[1]).find('.info');
		var $theaterName = $($reserveInfo[2]).find('.info');
		var $memCount = $($reserveInfo[3]).find('.info');
		var $seats = $($reserveInfo[4]).find('.info');
		
		var $paymentNo = $($paymentInfo[0]).find('.info');
		var $paymentDate = $($paymentInfo[1]).find('.info');
		var $paymentType = $($paymentInfo[2]).find('.info');
		var $payAmount = $($paymentInfo[3]).find('.info');
		
		
		$tbody.on('click', function(e) {
			var current = e.target;
			var $tr = $(current).closest('tr');
			var id = $tr.attr('data-id');
			console.log(id);
			if (!id) {
				return alert('잘못된 요청입니다.');
			}
			// 비동기로 데이터 가져오기
			$.ajax('<%=request.getContextPath()%>/reservedInfo.do?reservedInfoId=' + id)
				.done(function(res) {
					console.dir(res);
					
					cancelForm.reservedNo.value = res.reservedNo;
					console.log(cancelForm.reservedNo.value);
					
					$poster.attr("src",'<%=request.getContextPath()%>/resources/images/' + res.modifyName);
					$ageLimit.addClass("grade_"+res.ageLimit);
					$ageLimit.text(res.ageLimit);
					$title.text(res.title);
					$reservedNo.text(res.reservedNo);
					$screenDate.text(new Date(res.screenDate).toLocaleString());
					$theaterName.text(res.theaterName);
					
					
					// 배열
					var rsvMemTypes = res.rsvMemType;
					var length = rsvMemTypes.length;
					
					var str = "";
					for (var i = 0; i < length; i++) {
						var rsvMemType = rsvMemTypes[i];
						str += rsvMemType.memType; // ADULT
						str	+= ": " + rsvMemType.reservedCount + "명 "; // 2
						
					}
					$memCount.text(str);
					
					$paymentNo.text(res.paymentNo);
					$paymentDate.text(new Date(res.paymentDate).toLocaleString());
					$paymentType.text(res.paymentType);
					$payAmount.text(res.amount);
					console.log(convertSeatString(res.seatNo));
					$seats.text(convertSeatString(res.seatNo));
					
					$modal.show();
					
				})
				.fail(function(err) {
					console.error(err);
				});
		});
		
        $checkBtn.on('click', function() {
        	$modal.hide();
        });
	

         // When the user clicks on <checkBtn>, close the modal
        cancelBtn.onclick = function(){
            
            if(!confirm("예매취소하시겠습니까? 실행 후엔 되돌릴 수 없습니다.")){
                return;
            }
            cancelForm.action="<%=request.getContextPath()%>/MyCancelPayment.do";
            cancelForm.methd="get";
            cancelForm.submit();
            
        } 
 		
 		
        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function(event) {
            if (event.target == $modal[0]) {
                $modal.hide();
            }
        }
 		
		function convertSeatString(seats) {
			var length = seats.length;
			if (!seats || length === 0) {
				return "";
			}
			var returnValue = "";
			for (var idx = 0; idx < length; idx++) {
				var s = seats[idx];
				var seatName = "";
				switch(Math.floor((s-1)/4)){
					case 0: seatName += "A"; break;
					case 1: seatName += "B"; break;
					case 2: seatName += "C"; break;
					case 3: seatName += "D"; break;
				} 
				
				switch(s%4){
					case 1: seatName += "1"; break;
					case 2: seatName += "2"; break;
					case 3: seatName += "3"; break;
					case 0: seatName += "4"; break;
				}
				if (idx != 0) {
					returnValue += ", ";
				}
				returnValue += seatName;
			}
			return returnValue;
		}
    </script>
    
	
	
	<%@ include file="/views/common/footer.jsp" %>
</body>
</html>