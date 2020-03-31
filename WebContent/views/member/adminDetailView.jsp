<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.kh.member.model.vo.Member" %>
<%
	Member m = (Member)request.getAttribute("m");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	th, td{
		height:50px;
		font-family: Georgia, serif;
		font-size: 18px;
	}
</style>
</head>
<body>
	<%@ include file="../common/adminMenubar.jsp" %>
	<div class="outer">
		<table>
			<tr>
				<th><img src="<%=request.getContextPath() %>/resources/images/p_logo.png" width="300px"></th>
				<td><h1><%=m.getName() %></h1></td>
			</tr>
			<tr>
				<th>회원번호</th>
				<td><%=m.getMemberNo() %></td>
			</tr>
			<tr>
				<th>아이디</th>
				<td><%=m.getId() %></td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td><%=m.getBirth() %></td>
			</tr>
			<tr>
				<th>성별</th>
				<td>
					<%if(m.getGender().equals("M"))	{ %>
						남성
					<%}else{ %>
						여성
					<%} %>
				</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><%=m.getEmail() %></td>
			</tr>
			<tr>
				<th>전화번호1</th>
				<td>0<%=m.getPhone() %></td>
			</tr>
			<tr>
				<th>전화번호2</th>
				<td>
					<%if(m.getTel()==null){ %>
						번호없음
					<%}else{ %>
						<%=m.getTel() %>
					<%} %>
				</td>
			</tr>
			<tr>
				<th>등급</th>
				<td>
					<%switch(m.getGrade()){ 
						case "N":%>Normal<%break;
						case "B":%>Bronze<%break;
						case "S":%>Silver<%break;
						case "G":%>Gold<%break;
						case "P":%>Platinum<%break;
						default:%>Non-Grade<%break;
					} %>
					<button onclick="change();" type="button">등급변경</button>
					<div id="change" style="display:none;">
					<!-- form 액션값주기 -->
						<form>
							<select name="grade">
									<option value="N">Normal</option>
									<option value="B">Bronze</option>
									<option value="S">Silver</option>
									<option value="G">Gold</option>
									<option value="P">Platinum</option>
							</select>
							<button type="submit" id="hide">완료</button>
						</form>
					</div>
				</td>
			</tr>
			<tr>
				<th>가입일</th>
				<td><%=m.getSignupDate() %></td>
			</tr>
			<tr>
				<th>탈퇴여부</th>
				<td>
					<%if(m.getStatus().equals("N")) {%>
						가입중
					<%} else{ %>
						탈퇴함
					<%} %>
				</td>
			</tr>
			<tr>
				<th>블랙리스트여부</th>
				<td>
					<%if(m.getBlackStatus().equals("Y")){ %>
						O 
						<button type="button" onclick="cause();">사유보기</button>
						<div id="cause" style="display:none;">
							사유 : <%=m.getBlackCause() %> <button type="button" onclick="causeHide();">확인</button>
						</div>
					<%}else{ %>
						X
					<%} %>
				</td>
			</tr>
		</table>
	</div>
	
	<script>
		function change(){
			$("#change").css("display","");
		}
		function hide(){
			$("#change").css("display","none")
		}
		function cause(){
			$("#cause").css("display","");
		}
		function causeHide(){
			$("#cause").css("display","none")
		}
	</script>
</body>
</html>