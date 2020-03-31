<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*,
				com.kh.member.model.vo.Member, 
				com.kh.menubar.controller.SectionDto, 
				com.kh.menubar.controller.TheaterDto, 
				com.kh.section.model.dao.SectionFlatDto, 
				com.kh.section.model.service.SectionService" %>
<% 
	String contextPath = request.getContextPath();
	Member loginUser = (Member)session.getAttribute("loginUser");
	
	// Flat DTO로 조회 
	List<SectionFlatDto> sectionFlat = new SectionService().selectSectionDto();
	
	Map<Integer, SectionDto> sectionMap = new HashMap<>();
	// 데이터 변환
	for(SectionFlatDto flatDto: sectionFlat) {
		SectionDto sectionDto  = null;
		if (sectionMap.get(flatDto.getSectionNo()) == null) {
			// 처음 생성 하는 지역
			sectionDto = new SectionDto(flatDto.getSectionNo(), flatDto.getSectionName());
			sectionMap.put(flatDto.getSectionNo(), sectionDto);
		} else {
			// 이미 생성된 지역
			sectionDto = sectionMap.get(flatDto.getSectionNo());
		}
		TheaterDto theaterDto = new TheaterDto(flatDto.getTheaterNo(), flatDto.getTheaterName());
		sectionDto.addTheaterDto(theaterDto);
	}
	List<SectionDto> sections = new ArrayList<>(sectionMap.values());
	
	
%>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>	

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menubar.jsp</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${contextPath}/resources/css/style.css">
<script src="${contextPath}/resources/js/jquery-1.11.2.min.js"></script>
<script src="${contextPath}/resources/js/common.js"></script>

</head>
<body id="main">
	<div id="wrap">
		<!--헤더 S-->
		<div id="header">
			<h1 class="logo"><a href="${contextPath}">Pictures</a></h1>
			<div class="gnb">
				<ul class="g_menu">
				<% if(loginUser == null){ %>
				<!-- 회원가입/로그인 버튼 -->
					<li><a href="<%=request.getContextPath()%>/enrollForm.me">회원가입</a></li>
					<li><a href="<%=request.getContextPath()%>/loginForm.me">로그인</a></li>
				<%} else{ %>
				<!-- 관리자페이지 버튼 -->
				<% if(loginUser.getId().equals("admin")){ %>
					<li><a href="#">관리자</a></li>
				<%} %>
				<!-- 마이페이지/로그아웃 버튼 -->
					<li><a href="<%=request.getContextPath()%>/mypage.me">마이페이지</a></li>
					<li><a href="<%=request.getContextPath()%>/logout.me">로그아웃</a></li>
				<%} %>
				</ul>
			</div>
			<div id="nav">
				<ul>
					<li>
						<a href="${contextPath}/reservedOne.do">예매</a>
					</li>
					<li>
						<a href="<%=contextPath%>/views/movie/MovieMain.jsp">영화</a>
						
					</li>
					<li>
						<a href="#">영화관</a>
						<ul>
							<% for(SectionDto section : sections){ %>
								<li>
									<a> <%= section.getSectionName() %></a>
									<ul>
										<% for(TheaterDto theater : section.getTheaters()){%>
										<li>
											<a onclick="theaterDetail('<%= theater.getTheaterNo() %>');"><%= theater.getTheaterName() %></a>
										</li>
										<% } %>
									</ul>
								</li>
							<% } %>
						</ul>
					</li>
					<li>
						<a href="<%=contextPath %>/views/notice/noticeMain.jsp">고객센터</a>
						<ul>
							<li>
								<a href="<%=contextPath%>/list.no">공지사항</a>
							</li>
							<li>
								<a href="<%=contextPath%>/faq.fq">FAQ</a>
							</li>
							<li>
								<a href="<%=contextPath%>/qnaList.qa">일대일문의</a>
							</li>
							<li>
								<a href="<%=contextPath%>/bRoom.br">대관문의</a>
							</li>
							<li>
								<a href="<%=contextPath%>/lost.lo">분실물 찾기</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!--헤더 E-->

	</div>
<form id="theaterDetail" action="<%=contextPath%>/detailView.th" method="post">
	<input type="hidden" name="theaterNo"/>
</form>

<script>
	function theaterDetail(no){
		var form = document.getElementById("theaterDetail");
		form.theaterNo.value = no;
		form.method="post";
		form.submit();
	};
</script>
</body>
</html>