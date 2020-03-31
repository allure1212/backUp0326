<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <style>
        *{margin:0; padding:0;}
        .layout { position: relative; padding:0 15px; width:1200px; margin:0 auto;}
    	ul li{list-style:none;}

        #reserved{ height: 800px; padding-top:20px; border-radius:5px;}
        #reserved>div{ overflow:hidden;}
        #reserved_menu{ margin: 10px 0;}
        #reserved_menu ul li{
            background-color: lightgray;
            color: rgba(70, 60, 60, 0.493);
            border-radius: 5px;
            float: left;    width: 25%;
            text-align: center;
            height: 30px;
            line-height: 30px;
        }
        #reserved_menu ul li.on{
            background-color: rgb(68, 68, 68);
            color: orange;
            text-decoration: bold;
        }
        #reserved_choose{padding:0 10px; box-sizing: border-box;}
        #reserved_choose .threediv{
            float: left;   width:32.66%;
            background-color: lightgray;
            height: 700px;
            margin-left:1%;
            border-radius: 5px;
        }
        #reserved_choose>div:first-child{margin-left:0;}
        .title{
            background-color:gray;
            color:whitesmoke;
            text-align: center;
            height:30px; line-height: 30px;
            width: 100px;
            margin:0 auto 20px;
            }
        #choose_theater{padding:20px; box-sizing:border-box;}
        .inner_theater{position: relative; background:#fff;}
        .depth1 a{position: relative; display:block; background:#eee; width:150px; padding:10px; box-sizing:border-box; text-decoration:none; color:#333; }
        .depth1.active>a {background:#fff;}
        .depth1.active>a:after {content:""; display:block; position:absolute; right:20px; top:13px; width:18px; height:14px; background:url(${contextPath}/pictures/resources/images/check.png)no-repeat;}
        .depth1 a em{font-style:normal; font-size:13px;}
        .depth2{
            display: none;
            position: absolute;
            right:0;
            top:0;
        }
        .depth1.active .depth2{
            display: block;
        }
        .depth2 a{background:#fff;}

        #choose_movie { padding:20px; box-sizing:border-box;}
        #choose_movie select{height:30px; line-height:30px; width:100px;}
        #choose_movie ul{ background:#fff; margin-top:10px; padding:10px;}
        #choose_movie ul li{margin-top:10px;}
        #choose_movie ul li:first-child{margin-top:0px;}
        #choose_movie ul li span{width:26px; height:26px; line-height:26px; margin-right:5px; border-radius:50%; font-weight: 700; display:inline-block; font-size:11px; color:#fff; text-align:center;}
        #choose_movie ul li span.grade_0{background:#5BC77E;}
        #choose_movie ul li span.grade_12{background:#4DD6FF;}
        #choose_movie ul li span.grade_15{background:#FFC134;}
        #choose_movie ul li span.grade_18{background:#ED4C6B;}
        
        #choose_time { padding: 20px; box-sizing:border-box;}
        #choose_time p { font-size: 20px; font-weight: 700; margin-bottom: 10px;}
        #choose_time p input { font-size: 18px; width: 300px; }
        #choose_time ul {background: #fff; margin-top: 20px; padding: 20px; }
        #choose_time ul li { font-size: 20px; margin:10px; margin-right: 0; font-weight: 800; display: inline-block; padding-right: 30px;}
    </style>
</head>
<body>

	<%@ include file="../common/menubar.jsp" %>
	
	
	<div class="layout">

        <div id="reserved">
            <div id="reserved_menu">
                <ul>
                    <li class="on">01. 영화선택</li>
                    <li>02. 인원/좌석</li>
                    <li>03. 결제</li>
                    <li>04. 결제완료</li>
                </ul>
            </div>

            <div id="reserved_choose">
                 <div id="choose_theater" class="threediv">
                    <div class="title">영화관선택</div>
                    <div class="inner_theater">
                        <ul>
                           	<c:forEach items="${sectionList}" var="s" varStatus="vs">
                           		<c:set var="isActive" value="${param.sectionNo eq s.sectionNo or empty param.sectionNo and vs.first}"/>
   								<li 
   									class="depth1 <c:if test="${isActive}">active</c:if>"
								>
									<a href="#changeLocation" onClick="changeLocation('${s.sectionNo}');">${s.name}<em>()</em></a>
									<div class="depth2">
										<ul>
										<c:if test="${isActive}">
											<c:forEach items="${theaterList}" var="t">
										        <li class="">
										        <a href="#selectTheater" onclick="selectTheater('${t.theaterNo}');">${t.name}</a>
										        </li>										
											</c:forEach>
										</c:if>
									    </ul>
									</div>               	
                          		</li>
                           	</c:forEach>
                        </ul>
                    </div>
                </div>
                
                <div id="choose_movie" class="threediv">
                    <div class="title">영화선택</div>
                   	<select name="lineUp" style="width: 100px;" onchange="changeLineUp(this);">
                       <option value="4" ${empty param.lineUp or param.lineUp eq '4' ? 'selected="selected"' : ''}>최신순</option>
                       <option value="2" ${param.lineUp eq '2' ? 'selected="selected"' : ''}>이름순</option>
                       <option value="3" ${param.lineUp eq '3' ? 'selected="selected"' : ''}>나이제한순</option>
                   	</select>
                    <ul>
                    	<c:forEach items="${movieList}" var="m">
                    		<li><a href="#selectMovie" onclick="selectMovie('${m.movieNo}')">
                    		<span class="grade_${m.ageLimit}">${m.ageLimit==0 ? 'All':m.ageLimit}</span>
                    		<strong>${m.title}</strong></a></li>
                    	</c:forEach>

                    </ul>
                </div>
                
                <div id="choose_time" class="threediv">
                    <div class="title">상영시간</div>
					<p>Date: <input type="text" id="datepicker" size="30" value="${screenDate}" onchange="changeDate(this);"></p>
 					<p>선택영화: 
 						<input type="text" id="movieName" value="${currentMovieTitle}" readonly>
 						
 					</p>

                    <ul>
                    	<c:forEach items="${screenList}" var="sc">
					        <li class="">
								<a href="#selectScreen" onclick="selectScreen('${sc.screenNo}');">
									<fmt:formatDate value="${sc.screenDate}" pattern="HH:mm"/>
								</a>
					        </li>										
						</c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    
<form id="form" action="${contextPath}/reservedOne.do" role="form" method="post">
	<input type="hidden" name="sectionNo" value="<c:out value="${param.sectionNo}" default="1"/>"/>
	<input type="hidden" name="theaterNo" value="<c:out value="${param.theaterNo}" />"/>
	<input type="hidden" name="movieNo" value="<c:out value="${param.movieNo}"/>"/>
	<input type="hidden" name="screenDate" value=""/>
	<input type="hidden" name="screenNo" value=""/>
	<input type="hidden" name="lineUp" value="<c:out value="${param.lineUp}"/>"/>
</form>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<script>
$(document).ready(function(){
    var depth1 = $('.depth1'); 
    
    depth1.find('>a').on('click', function(){
        depth1.removeClass('active');
        $(this).parent().addClass('active');
    });
    
	$("#datepicker").datepicker({
		  dateFormat: "yy-mm-dd",
		  minDate: "0"
	});
});

function changeLocation(sectionNo) {
	var form = document.getElementById('form');
	if (!sectionNo) {
		return alert('지역을 선택해 주세요');
	}
	form.sectionNo.value = sectionNo;
	form.action = '${contextPath}/reservedOne.do';
	form.method = 'post';
	form.submit();
}

function selectTheater(theaterNo) {
	var form = document.getElementById('form');
	
	if (!form.sectionNo.value) {
		return alert('지역을 선택해 주세요');
	}
	if (!theaterNo){
		return alert('영화관을 선택해 주세요');
	}
	form.theaterNo.value = theaterNo;
	form.action = '${contextPath}/reservedTwo.do';
	form.method = 'post';
	form.submit();
}

function selectMovie(movieNo){
	var form = document.getElementById('form');
	var datepicker = document.getElementById('datepicker');
	
	if (!form.sectionNo.value) {
		return alert('지역을 선택해 주세요');
	}
	if (!form.theaterNo.value){
		return alert('영화관을 선택해 주세요');
	}
	if (!movieNo){
		return alert('영화를 선택해주세요');
	}
	form.screenDate.value = datepicker.value;
	form.movieNo.value = movieNo;
	form.action = '${contextPath}/reservedThree.do';
	form.method = 'post';
	form.submit();
}

function changeDate(datePicker){
	var form = document.getElementById('form');
	
	if(!form.sectionNo.value){
		return alert('지역을 선택해 주세요');
	}
	if(!form.theaterNo.value){
		return alert('영화관을 선택해 주세요');
	}
	if(!form.movieNo.value){
		return alert('영화를 선택해주세요');
	}
	form.screenDate.value = datePicker.value;
	form.action = '${contextPath}/reservedThree.do';
	form.method = 'post';
	form.submit();
}

function selectScreen(screenNo){
	var form = document.getElementById('form');
	
	if (!form.sectionNo.value) {
		return alert('지역을 선택해 주세요');
	}
	if (!form.theaterNo.value){
		return alert('영화관을 선택해 주세요');
	}
	if (!form.movieNo.value){
		return alert('영화를 선택해주세요');
	}
	if (!screenNo){
		return alert('관람시간을 선택해주세요');
	}
	form.screenNo.value = screenNo;
	form.action = '${contextPath}/reservedFour.do';
	form.method = 'post';
	form.submit();
}
function changeLineUp(lineUp){
	var form = document.getElementById('form');
	if (!form.sectionNo.value) {
		return alert('지역을 선택해 주세요');
	}
	if (!form.theaterNo.value){
		return alert('영화관을 선택해 주세요');
	}
	form.lineUp.value = lineUp.value;
	form.action = '${contextPath}/reservedTwo.do';
	form.method = 'post';
	form.submit();
}

</script>

<%@ include file="/views/common/footer.jsp" %>
</body>
</html>
