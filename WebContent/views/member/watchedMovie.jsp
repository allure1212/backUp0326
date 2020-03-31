<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.wrap {
    width: 1000px;
    margin-top:50px;
	margin-left:auto;
	margin-right:auto;
}
.btnWrap {
    margin-top: 20px;
    text-align: center;
}
.block {
	display: block;
}
.button {
	border: 1px solid #254069;
	display: inline-block;
	vertical-align: middle;
	min-width: 90px;
	height: 40px;
	margin: 0 3px;
	padding: 0 20px;
	border-radius: 3px;
	color: #254069;
	font-size: 13px;
	text-align: center;
	line-height: 38px;
	cursor: pointer;
}

.button-color01 {
	border-color: #db6a29e7;
	color: #fff;
	background-color: #db6a29e7;
}

.button-color02 {
	border-color: #c7bcb6e7;
	color: #fff;
	background-color: #c7bcb6e7;
}

:first-child.button {
	margin-left: 0px;
}
.title2 {
    padding-bottom: 5%;
}
.title2 h1{
    font-size: 50px;
    font-weight: bolder;
    padding-bottom: 10px;
}
.sort {
    padding-bottom: 5px;
}

.movieinfo {
    width: 90%;
    height: 400px;
    margin: 10px auto;
}

.mv_first, .mv_second, .mv_third {
  height: 300px;
  border: 1px solid #bcbcbc;
  margin-bottom:20px;
  margin-top:30px;
}
.mv_first {
    float: left;
    width:30%;
    box-sizing: border-box;
}
.mv_second{
    float: left;
    margin-left: 5%;
    width:30%;
    box-sizing: border-box;
}
.mv_third{
    float: right;
    width:30%;
    box-sizing: border-box;
}
</style>

</head>
<body>
	
    <%@ include file="../common/myPagebar.jsp"%>
	
	<div class="wrap">
 		<div class="title1">
    		<div class="title2">
        		<h1>My 영화</h1>
    		</div>
    		<div class="sort">
        		<button class="button button-color02 block" id="mypick" type="button" onclick="location.href='pickMovie.do'">내가 '찜'한 영화</button>
        		<button class="button button-color02 block" id="mywatched" type="button" onclick="location.href='watchedMovie.do'">내가 본 영화</button>
    		</div>
    	</div>
    <hr style="border:1px solid#878787; height: 2px !important; display: block !important; width: 100% !important;"/>
    <div class="movieinfo">
    	<div class="mv_first">
          <%-- <img src="<%=request.getContextPath()%>/?/?/<%= %>"> --%>
        </div>
        <div class="mv_second">
          <%-- <img src="<%=request.getContextPath()%>/?/?/<%= %>"> --%>
        </div>   
        <div class="mv_third">
          <%-- <img src="<%=request.getContextPath()%>/?/?/<%= %>"> --%>
        </div>      
       
           <!-- <h3>※</h3><br>
           <p>영화 관람 내역이 존재하지 않습니다.</p> -->      
    </div>
    <hr style="border:1px solid#878787; height: 2px !important; display: block !important; width: 100% !important;"/>
    <div class="btnWrap">
        <button class="button button-color01 block" id="idback" type="button">이전화면</button>
        <button class="button button-color01 block" id="idnext" type="submit">영화 찜하러 가기</button>
    </div>

</div>



</body>
</html>