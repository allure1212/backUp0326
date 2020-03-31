<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
      
        #reserved_choose2 {background:#eee; padding:10px; overflow: hidden; width:1100px; margin-right: auto; margin-left: auto; border-radius: 3px;]}
        #reserved_choose2 #choose_mem {position: relative; background:#333; height:120px; padding-left:100px;}
        #reserved_choose2 #choose_mem .title{position:absolute; left:0; top:0; background:#5E5E5E; color:#fff; padding:10px; }
        .poster_area { width:80px; height:100px; margin-top:10px; background:pink; float:left;}
        .poster_area img { width:100%; height:100%;}
        .select_area { float:left; margin:30px 0 0 75px;}
        .select_area select{ height:40px; line-height:40px; width:150px; margin-right:10px; border-radius:5px;}

        #choose_seat {background:#333; position: relative; margin-top:10px; padding:40px 10px; }
        #choose_seat .title{position:absolute; left:0; top:0; background:#5E5E5E; color:#fff; padding:10px; }
        #choose_seat .screen_bar{margin-top:10px; background:#ccc; color:#fff; text-align: center; width:100%; height:35px; line-height:35px;}

        #choose_seat table{ border-collapse: collapse; width:300px; margin:30px auto 0; }
        #choose_seat table td{ color:#000; width:40px; height:35px; line-height:35px; text-align:center; padding:10px; }
        #choose_seat table td:first-child { color:#fff;}
        #choose_seat table td span{ display:block; background:#fff; border-radius:5px;}

        #choose_seat table td input[type=checkbox]{ display: none;}
        #choose_seat table td input[type=checkbox]+label{ display:inline-block; background:#fff; cursor: pointer; position: relative; width:40px; height:40px; border-radius: 11px;}
        #choose_seat table td input[type=checkbox]:checked +label { display:inline-block; width:40px; height:40px; border-radius: 11px; margin-right:10px; background: red;}
        #choose_seat table td input[type=checkbox]:disabled +label { display:inline-block; width:40px; height:40px; border-radius: 11px; margin-right:10px; background: gray;}
       
        .ticket_cost{ font-size: 20px; text-align: center; color:#fff; font-weight: 700; margin: 40px; margin-top:40px; line-height:30px;}
        .ticket_cost ul li:nth-child(1) {padding-bottom: 10px;}
        .btns {overflow: hidden; margin-top: 30px;}
        .btns .seat_able{float: left;}
        .btns .seat_able ul li{display: inline-block; border-radius: 5px; width:100px; text-align: center; height: 35px; line-height: 35px;}
        .btns .seat_able ul li:nth-child(1){background:#eee;}
        .btns .seat_able ul li:nth-child(2){background: #aaa;}
        .btns .seat_able ul li:nth-child(3){background:rgb(192, 24, 24); color:white}
        .btns .move_step{float: right;}
        .btns .move_step button{ width: 100px; height: 35px; line-height: 35px; text-align: center; border-radius: 5px; border:0; font-size: 15px;}
    </style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>


    <div class="layout">

        <div id="reserved">
            <div id="reserved_menu">
                <ul>
                    <li>01. 영화선택</li>
                    <li class="on">02. 인원/좌석</li>
                    <li>03. 결제</li>
                    <li>04. 결제완료</li>
                </ul>
            </div>

            <div id="reserved_choose2">
                <div id="choose_mem">
                    <div class="title">인원선택</div>
                    <div class="poster_area">
                        <img src="${contextPath}/resources/images/${mainPoster}" alt="" />
                    </div>
                    <div class="select_area">
                        <select name="adult" class="countNum" onchange="changeNum(this)">
                            <option value=0>성인관객 수</option>
                            <option value=1>1</option>
                            <option value=2>2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                        <c:if test="${ageLimit ne '18'}">
	                        <select name="youth" class="countNum" onchange="changeNum(this)">
	                            <option value="0">청소년관객 수</option>
	                            <option value="1">1</option>
	                            <option value="2">2</option>
	                            <option value="3">3</option>
	                            <option value="4">4</option>
	                            <option value="5">5</option>
	                        </select>
                        </c:if>
                        
                        <select name="senior" class="countNum" onchange="changeNum(this)">
                            <option value="0">시니어관객 수</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                        <select name="disabled" class="countNum" onchange="changeNum(this)">
                            <option value="0">장애인관객 수</option>
                            <option value="1">1</option>
                            <option value="2">2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </div>
                </div>
                <div id="choose_seat">
                    <div class="title">좌석선택</div>
                    <div class="screen_bar">SCREEN</div>
                    <table>
                        <tr>
                            <td>A</td>
                            <td><input type="checkbox" id="seat01" value="1" name="seat"><label for="seat01">1</label></td>
                            <td><input type="checkbox" id="seat02" value="2" name="seat"><label for="seat02">2</label></td>
                            <td><input type="checkbox" id="seat03" value="3" name="seat"><label for="seat03">3</label></td>
                            <td><input type="checkbox" id="seat04" value="4" name="seat"><label for="seat04">4</label></td>
                        </tr>
                        <tr>
                            <td>B</td>
                            <td><input type="checkbox" id="seat05" value="5" name="seat"><label for="seat05">1</label></td>
                            <td><input type="checkbox" id="seat06" value="6" name="seat"><label for="seat06">2</label></td>
                            <td><input type="checkbox" id="seat07" value="7" name="seat"><label for="seat07">3</label></td>
                            <td><input type="checkbox" id="seat08" value="8" name="seat"><label for="seat08">4</label></td>
                        </tr>
                        <tr>
                            <td>C</td>
                            <td><input type="checkbox" id="seat09" value="9" name="seat"><label for="seat09">1</label></td>
                            <td><input type="checkbox" id="seat10" value="10" name="seat"><label for="seat10">2</label></td>
                            <td><input type="checkbox" id="seat11" value="11" name="seat"><label for="seat11">3</label></td>
                            <td><input type="checkbox" id="seat12" value="12" name="seat"><label for="seat12">4</label></td>
                        </tr>
                        <tr>
                            <td>D</td>
                            <td><input type="checkbox" id="seat13" value="13" name="seat"><label for="seat13">1</label></td>
                            <td><input type="checkbox" id="seat14" value="14" name="seat"><label for="seat14">2</label></td>
                            <td><input type="checkbox" id="seat15" value="15" name="seat"><label for="seat15">3</label></td>
                            <td><input type="checkbox" id="seat16" value="16" name="seat"><label for="seat16">4</label></td>
                        </tr>
                    </table>
                    	<input type="hidden" name="sectionNo" value="${param.sectionNo}"/>
						<input type="hidden" name="theaterNo" value="${param.theaterNo}"/>
						<input type="hidden" name="movieNo" value="${movieNo}"/>
						<input type="hidden" name="screenNo" value="${param.screenNo}"/>
						<input type="hidden" name="adultCost" value="${adultCost}"/>
						<input type="hidden" name="youthCost" value="${youthCost}"/>
						<input type="hidden" name="seniorCost" value="${seniorCost}"/>
						<input type="hidden" name="disabledCost" value="${disabledCost}"/>
					
                    <div class="ticket_cost">
                    	<ul>
                    		<li>* 회원 등급 : ${loginMg.gradeCondition} (할인율 ${loginMg.gradeBenefit}%) *</li>
                    		<li>관람인원: <a id="countNum">0</a> 명 / 선택된 좌석수: <a id="clickBox">0</a> 개</li>
                    		<li>총 금액 : <a id="cost">0</a> 원</li>
                    	</ul>
                    </div>
                    <div class="btns">
                        <div class="seat_able">
                            <ul>
                                <li>선택가능</li>
                                <li>선택불가능</li>
                                <li>선택좌석</li>
                            </ul>
                        </div>
                        <div class="move_step">
                            <button type="button" onclick="prev()">&lt; prev</button>
                            <button type="button" onclick="next()">next &gt;</button>
                        </div> 
                    </div>
                </div>
			
            </div>

        </div>
    </div>
   
<form id="form" action="${contextPath}/reservedOne.do" role="form" method="post">
	<input type="hidden" name="screenNo" value="${screenNo}"/>
	<input type="hidden" name="totalCost" value=""/>
</form>
    
<script>
	var adult = document.querySelector(".select_area > select[name=adult]");
	var youth = document.querySelector(".select_area > select[name=youth]");
	var senior = document.querySelector(".select_area > select[name=senior]");
	var disabled = document.querySelector(".select_area > select[name=disabled]");
	var seats = document.querySelectorAll('#choose_seat > table input[type=checkbox]');
	var $seats = $(seats);
	
	var TYPE_COSTS = {
		'ADULT': ${adultCost},
		'YOUTH': ${youthCost},
		'SENIOR': ${seniorCost},
		'DISABLED': ${disabledCost}
	};
	
	$(function() {
		$seats.on('change', function() {
			var checkedSeat = $seats.filter(':checked').length;
			
			if(checkedSeat > getTotalCount(adult, youth, senior, disabled)){
				$(this).prop('checked', false);
				return alert('선택인원을 초과하였습니다');
			}
			$('#clickBox').text(checkedSeat);
		});
		var reservedSeats = ${seats};
		var filteredSeats = Array.from(seats).filter(function(data){
			return reservedSeats.includes(parseInt(data.value));
		});
	
		console.log(filteredSeats);
		$(filteredSeats).attr('disabled', 'disabled');
		
	});
	
	function getParsedNumber(element) {
		try {
			if(element.value) {
				return parseInt(element.value);
			}
		} catch (e) {
			throw Error('올바른 값이 아닙니다.');
		}
	}
	
	function getTotalCount(adult, youth, senior, disabled) {
		return getParsedNumber(adult) + getParsedNumber(youth) + getParsedNumber(senior) + getParsedNumber(disabled);
	}
	
	function getCost(element) {
		var name = element.name;
		var cost = TYPE_COSTS[name.toUpperCase()];
		return getParsedNumber(element) * cost;
	}
	
	function getTotalCost(adult, youth, senior, disabled) {
		var totalCost = getCost(adult) + getCost(youth) + getCost(senior) + getCost(disabled);
		var discount = ${loginMg.gradeBenefit};
		return totalCost*(100-discount)/100;
	}
	
	function changeNum(element){
		var sumNum = getTotalCount(adult, youth, senior, disabled);
		if(sumNum > 8){
			sumNum -= getParsedNumber(element);
			element.value = '0';
			$('#countNum').text(sumNum);
			$('#cost').text(getTotalCost(adult, youth, senior, disabled));
			return alert("허용 인원을 초과 했습니다.");
		}
		// input, textarea, select -> val
		$('#countNum').text(sumNum);
		$('#cost').text(getTotalCost(adult, youth, senior, disabled));
	}
	
	function prev(){
		location.href= "${contextPath}/reservedOne.do";
	}
	
	function next(){
		var sumNum = getTotalCount(adult, youth, senior, disabled);
		var totalCost = getTotalCost(adult, youth, senior, disabled);
		var $chekcedSeats = $seats.filter(':checked');
		var checkedSeatCount = $seats.filter(':checked').length;
		var form = document.getElementById('form');
		
		if(sumNum != checkedSeatCount || checkedSeatCount ==0){
			return alert('좌석 수를 확인해주십시오');
		}
		
		if (!form.screenNo.value){
			return alert('관람할 영화 정보를 선택해주세요');
		}
		
		var fragment = document.createDocumentFragment();
		
		$chekcedSeats.each(function() {
			var input = document.createElement('input');
			input.name = 'seatNo'
			input.value = $(this).val();
			fragment.appendChild(input);
			
		});
		
		var $select = $('.select_area > .countNum');
		$select.each(function() {
			var input = document.createElement('input');
			input.name = this.name;
			input.value = this.value;
			fragment.appendChild(input);
		});
		
		form.appendChild(fragment);
		form.totalCost.value = totalCost;
		form.action = '${contextPath}/reservedFive.do';
		form.method = 'post';
		form.submit();
	};

	
	
</script>

<%@ include file="/views/common/footer.jsp" %>
</body>


</html>