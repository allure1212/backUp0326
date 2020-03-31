<%@page import="javax.naming.ldap.Rdn"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,
				com.kh.theater.model.vo.Theater,
				com.kh.theater.model.dao.MovieDto,
				com.kh.theater.model.dao.RoomDto,
				com.kh.common.DateUtils" %>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%
	String screenDate = (String)request.getAttribute("screenDate");
	Theater t = (Theater)request.getAttribute("selectTheater");
	List<MovieDto> movies = (List)request.getAttribute("movies");
	String theaterNo = (String)request.getAttribute("theaterNo");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

    * {margin:0; padding:0}
    .layout{ width: 1000px; margin: 0 auto; padding:50px;}
    .title {
        width: 300px; font-size: 50px; line-height: 50px;
        text-align: center; font-weight: 800;
        margin-bottom: 50px;
        }
    .theaterInfo { height:250px; width: 50%; float: left; box-sizing: border-box;}
    .theaterInfo p{
        padding: 10px;
        padding-left: 50px;
        font-size: 20px;
        font-weight: 700;
    }
    .theaterInfo span{
        padding: 10px;
        padding-left: 30px;
        font-size: 25px;
        font-weight: 700;
    }
    .theaterInfo span img{
        height: 30px; width: 30px;
        padding: 10px; padding-right: 15px;
        vertical-align: middle;
        }
    .theaterInfo span a{
        font-size: 20px; padding: 10px; cursor: pointer;
    }
    .theaterInfo span a:nth-child(3){}
    .theaterMap{
        height: 250px;
        width: 400px;
        background-color: plum;
    }
    .map{ margin-top: -100px;}
    .map span {font-size:20px;}
    #form { margin-top: 320px; border: 1px solid black;}
    .timeTable { padding: 20px; font-size: 18px; font-weight: 800;}
    #datePicker { padding: 20px; font-size: 18px;}
    .timeTable p { margin-bottom: 20px;}
    .timeTable ul li { list-style: none; display:inline-block; margin-bottom: 10px;}
    .timeTable ul li:nth-child(1) {display:block; padding-left: 25px;}

    .timeTable ul li span{width:26px; height:26px; line-height:26px; margin-right:5px; border-radius:50%; font-weight: 700; display:inline-block; font-size:11px; color:#fff; text-align:center; margin: 20px;}
    .timeTable ul li span.grade_0{background:#5BC77E;}
    .timeTable ul li span.grade_12{background:#4DD6FF;}
    .timeTable ul li span.grade_15{background:#FFC134;}
    .timeTable ul li span.grade_18{background:#ED4C6B;}
    
    .timeList li {padding:20px; float: left;}

     /* the Modal */
	.modalTransport { display: none;}
	.modalParking { display: none;}
	.modal {
	    position: fixed;
	    z-index: 1;
	    left : 0;
	    top : 0;
	    width: 100%;
	    height: 100%;
	    overflow: auto;
	    background-color: rgba(0,0,0,0.7);  /* balck w/ opacity*/	
	}
	.modal-content {
	    background-color: #fefefe;
	    margin: 15% auto; /* 15% from the top and centered */
	    padding: 20px;
	    border: 1px solid #888;
	    width: 30%; /* Could be more or less, depending on screen size */
	    height: 30%;
	    border-radius: 15px;                         
	}
	.modal-content p { font-size: 18px; font-weight: 800; padding: 30px; }
	.modal-content button { float:right; width: 100px; height: 35px; display: block; border-radius:5px; background: gray; color:white;}
</style>
</head>
<body>
	<%@ include file="/views/common/menubar.jsp" %>

<div class="layout">
    <div class="title">
        <p> <%= t.getName() %></p>
    </div>
    <div class="theaterInfo">
        <p>영화관 소개</p>
        <p> 주   소 : <%= t.getAddress() %></p>
        <p>전화번호: <%= t.getPhone() %></p>
        <span><a id="transport"><img src="<%=contextPath%>/resources/images/transport.png" alt="" />#교통안내</a></span>
        <span><a id="parking"><img src="<%=contextPath%>/resources/images/location_car_40.png" alt="" />#주차안내</a></span>
    </div>
    <div class="theaterInfo map">
        <span><img src="<%=contextPath%>/resources/images/location_map_40.png" alt="" />영화관 위치</span>
        <div class="theaterMap" id="map"></div> <!-- 카카오맵 이용 -->
    </div>

    <form id="form" action="<%=contextPath%>/detailView.th" method="post">
        <div>
            <input type="hidden" name="theaterNo" value="<%=theaterNo%>"/>
        </div>
        <div class="timeTable">
            <p>Date: <input type="text" id="datepicker" name="screenDate" size="20" value="<%= screenDate %>" style="font-weight: 800;"/></p>
            <!-- 영화별 영화시간 나열 -->
            <% for(MovieDto md : movies) { %>
            <ul>
            	<li>
            		<span class="grade_<%= md.getAgeLimit() %>"><%= md.getAgeLimit() %></span>
            		<strong><%= md.getTitle() %></strong>
            	</li>
            
				<% for(RoomDto rd : md.getRooms()){ %>
	            <li>
	            	<ul>
	                	<li><a href="#" onClick="selectMovie(this);">[<%= rd.getRoomName() %>관] <%= DateUtils.formatDate(rd.getScreenDate(),"HH:mm") %></a>
	                		<input type="hidden" name="roomNo" value="<%= rd.getRoomNo() %>"/>
	                		<input type="hidden" name="screenTime" value="<%= DateUtils.formatDate(rd.getScreenDate(),"yyyy-MM-dd HH:mm") %>"/>
	                		<input type="hidden" name="sectionNo" value="<%= t.getSectionNo() %>"/>
            				<input type="hidden" name="movieNo" value="<%= md.getMovieNo()%>"/>
	                	</li>
	            	</ul>
	            </li>
	            <% } %>
	         </ul>
	         </form>
            <% } %>
        </div>
        </div>
    </form>
</div>  

<form id="reserveInfo" action="<%=contextPath%>/detailView.th" method="post">
	<input type="hidden" name="theaterNo" value="<%= theaterNo %>"/>
	<input type="hidden" name="roomNo" value=""/>
	<input type="hidden" name="screenTime" value=""/>
	<input type="hidden" name="sectionNo" value=""/>
	<input type="hidden" name="movieNo" value=""/>
</form>


<!-- The Modal -->
<div class="modal modalTransport">
	<div class="modal-content">
		<p># <%=t.getName() %> 오시는 길 안내 #</p>
		<p style="color:gray;"><%=t.getTransport() %></p>
		<p><button type="button" class="closeBtn">확인</button></p>
	</div>
</div>

<div class="modal modalParking">
	<div class="modal-content">
		<p># <%=t.getName() %> 주차 안내 #</p>
		<p><%=t.getParking() %></p>
		<p><button type="button" class="closeBtn">확인</button></p>
	</div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1cbeedfb6c9e9d06b3519f044674dbd"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a1cbeedfb6c9e9d06b3519f044674dbd&libraries=drawing"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>

$(function(){
	$("#datepicker").datepicker({
		  dateFormat: "yy-mm-dd",
		  minDate: "0"
	});
});

$('#datepicker').change(function(){
	var form = document.getElementById('form');
	form.action = '${contextPath}/detailView.th';
	form.method = 'post';
	form.submit(); //theaterNo, screenDate,
});

function selectMovie(movie){
	var form = document.getElementById('reserveInfo');
	var roomNo = $(movie).siblings('input[name="roomNo"]').val();
	var screenTime = $(movie).siblings('input[name="screenTime"]').val();
	var sectionNo = $(movie).siblings('input[name="sectionNo"]').val();
	var movieNo = $(movie).siblings('input[name="movieNo"]').val();
	console.log(roomNo);
	console.log(screenTime);
	console.log(sectionNo);
	console.log(movieNo);
	
	form.roomNo.value = roomNo;
	form.screenTime.value = screenTime;
	form.sectionNo.value = sectionNo;
	form.movieNo.value = movieNo;
	
	form.action = '${contextPath}/reservedFour.do';
	form.method = 'post';
	form.submit(); //roomNo, screenDate, screenTime 
}

$('#transport').click(function(){
	$('.modalTransport').css('display','block');
});

$('#parking').click(function(){
	$('.modalParking').css('display','block');
});

$('.closeBtn').click(function(){
	$('.modalTransport').css('display','none');
	$('.modalParking').css('display','none');
});
 
var container = document.getElementById('map');
var lat = <%=t.getLatitude() %>;	//위도
var lng = <%=t.getLongitude() %>;	//경도
var options = { // MAP 기본 옵션
		center : new kakao.maps.LatLng(lat,lng),	// 지도중심좌표
		level : 3									// 지도 레벨(확대/축소)
}

var map = new kakao.maps.Map(container,options);	// 지도생성

var markerPosition = new kakao.maps.LatLng(lat,lng);	// 마커표시할 위치
var marker = new kakao.maps.Marker({
	position: markerPosition
});

marker.setMap(map);


</script>

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>