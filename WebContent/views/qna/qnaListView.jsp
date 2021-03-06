<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.kh.qna.model.vo.*" %>
<%
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	
	PageInfo pi = (PageInfo)request.getAttribute("pi");

	int listCount = pi.getListCount();
	int currentPage = pi.getCurrentPage();
	int maxPage = pi.getMaxPage();
	int endPage = pi.getEndPage();
	int startPage = pi.getStartPage();
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
        *{margin:0; padding:0;}
        .layout{ position: relative; margin:0 auto; width: 1200px; }
        ul li{list-style: none;}
        #noticeMenu {position:absolute; width:250px; left:0; top:40px; }
        #noticeMenu h2{width:100%; height:100px; background:#9C0E0E; color:#fff; text-align: center; line-height:100px;}
        #noticeMenu ul {border-left:1px solid #ddd; border-right:1px solid #ddd;}
        #noticeMenu ul li{border-bottom:1px solid #ddd; padding:15px; box-sizing: border-box;}
        #noticeMenu ul li a{display:block; text-decoration:none; color:#616060; }
        #noticeMenu ul li a img{display:inline-block; vertical-align: middle; margin-right:15px;}
        #noticeMenu ul li a span{display:inline-block; vertical-align: middle;}


        #noticeContent { padding-left:270px; padding-top:40px; height:800px;}
        #noticeContent>p { font-size: 30px; font-weight: 800;}
        #noticeContent table{ text-align: center; font-weight: 800; margin-bottom: 50px; margin:15px auto;}
        #noticeContent table tr td {width: 400px; height: 35px;}
        #noticeContent table tr td>input:nth-child(1) {text-align: center;}
        #noticeContent table tr td>input:nth-child(2){ width:300px; height: 50px; box-sizing: border-box;}
        #noticeContent table tr td #searchBtn {width: 50px; height: 50px; background:#9C0E0E; border:0; cursor:pointer; display: inline-block; vertical-align: bottom;}
        #noticeContent table tr td #requestBtn {width: 100px; height: 30px;}
    
    .layout{
    	color:black;
    }
    #noticeContent p, #noticeContent h1{
    color:black;}
 
	#requestBtn{
		border:none;
		outline:none;
		background:beige;
		border-radius:5px;
	}
	
	.listArea tbody tr td, .listArea thead tr th{
		color:black;
	}
	.listArea tbody td{ border-bottom:2px solid lightgray; padding:5px;}
	.listArea{margin-top:50px;}
	.listArea thead tr th{background-color:lightred; height:30px; border-radius:40px; box-shadow:3px 3px 3px 3px lightgray;}
    .qnaList tr:hover{
    	cursor:pointer;
    	box-shadow:3px 3px 3px 3px gray;
    }
    .listArea thead tr{width:500px;}
	
	/* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */   
            text-align:center;                       
        }
        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }
        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
        #detailView{
        	background:lightcoral;
        	border-radius:5px;
        	width:60px;
        	height:30px;
        }
        .btns{
        	width:100px;
        	height:30px;
        	margin-top:30px;
        }
        .btns button{
        	width:80px;
        	height:30px;
        	border-radius:5px;
        	box-shadow:3px 3px 3px 3px lightgray;
        	outline:0;
        	border:0;
        }.pagingArea button{
        	border-radius:10px;
        	background:lightred;
        	outline:0;
        	border:0;
        	width:25px;
        	height:25px;
        	padding:5px;
        	color:black;
      
        }
        .pagingArea button:hover{
        cursor:pointer;
        background:lightgray;
        }
        .pagingArea{
        	width:200px;
        	margin-left:350px;
        	margin-top:30px;
        	height:100px;
        }
    
        
	
    </style>
    
    
    
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<br><br>


<div class="layout">

    <div class="container">
        <div id="noticeMenu">
            <h2>고객센터</h2>
            <ul>
                <li><a href="<%=contextPath%>/qnaList.qa"><img src="resources/images/req1.png" alt=""><span>1:1문의</span></a></li>
                <li><a href="<%=contextPath%>/faq.fq"><img src="resources/images/req2.png" alt="">FAQ</a></li>
                <li><a href="<%=contextPath%>/list.no"><img src="resources/images/req3.png" alt="">공지사항</a></li>
                <li><a href="<%=contextPath%>/lost.lo"><img src="resources/images/req4.png" alt="">분실물찾기</a></li>
                <li><a href="<%=contextPath%>/bRoom.br"><img src="resources/images/req5.png" alt="">대관문의</a></li>
            </ul>
        </div>
        
        <div id="noticeContent">
        <p>1:1문의.</p>
        <br><br><br>
        	<table class="listArea" align="center">
			<thead>
				<tr>	
					<th>번호</th>
					<th>분류</th>
					<th>종류</th>
					<th width="50%">제목</th>
					<th>등록일</th>
					<th>비밀글</th>
					<th>답변</th>
				</tr>
			</thead>
		
		<%if(list.isEmpty()){ %>
			<%}else{ %>
				<tbody class="qnaList" id="openTable">
				<%for(Qna q:list){ %>
					<tr>
						<td><div><%=q.getQnaNo() %></div></td>
						<td><%=q.getType() %></td>
						<td><%=q.getKind() %></td>
						<td><%=q.getTitle() %></td>
						<td><%=q.getRegDate() %></td>
						<td><%=q.getSecretStatus() %></td>
						<td><%=q.getReplyStatus() %></td>
						<input type="hidden" value="<%=q.getSecretPwd() %>">
					</tr>
				<%} %>
				</tbody>
			</table>
			<%} %>
			
				<div class="btns">
		 	<%-- <%if(loginUser.getId() != null){ %> --%>
		 		<button onclick="insertQna();">작성하기</button>
		 		
		 		<%-- <%} %> --%>
		 	</div>
			
			<!-- The Modal -->
	    <div id="myModal" class="modal">
	 
		      <!-- Modal content -->
		      <div class="modal-content">
		        <span class="close">&times;</span>                                                               
		        <h6>비밀번호를 입력해주세요.</h6>
		        <input id="qnaNewPwd" type="password" width="60px">
		        <button type="button" id="detailView">입력</button>
		      </div>
		 
	    </div>
 	
 	<div class="pagingArea" align="center">
			
			<button onclick="location.href='<%=contextPath%>/qnaList.qa';"> &lt;&lt;</button>	
			
			
			<% if(currentPage == 1){ %>
				<button disabled> &lt;</button>
			<%} else { %>
			<button onclick="location.href='<%=contextPath%>/qnaList.qa?currentPage=<%=currentPage-1%>';"> &lt; </button>	
			<% } %>
			
			
		
			 <%for(int p=startPage; p<=endPage; p++){ %>
			 	<%if(currentPage == p){ %>
			 		<button disabled><%=p%></button>
			 	<%}else{ %>
			 		<button onclick="location.href='<%=contextPath%>/qnaList.qa?currentPage=<%=p%>';"><%=p%></button>
			 	<%} %>
			 <%} %>
			
			
			
			<%if(currentPage == maxPage){ %>
				<button disabled> &gt;</button>
			<%} else { %>
				<button onclick="location.href='<%=contextPath%>/qnaList.qa?currentPage=<%=currentPage+1%>';"> &gt; </button>
			<%} %>
			
		
			<button onclick="location.href='<%=contextPath%>/qnaList.qa?currentPage=<%=maxPage%>';"> &gt;&gt;</button>
		</div>
		
		
		 
	 
	    
	
	</div>
   </div>
</div>

<script>

	var modal = document.getElementById('myModal');
    var pwdNo;     
    var qnaNo;
	
	$(".qnaList tr").click(function() {
	    modal.style.display = "block";
	    pwdNo = $(this).children().eq(7).val();
	    qnaNo = $(this).children().eq(0).text();
	});
	
	$("#myModal span").click(function() {
	    modal.style.display = "none";
	});
	
	
	
	function insertQna(){
		location.href="<%=contextPath%>/views/qna/insertQna.jsp";
	}
	
	$(function(){
		 $("#detailView").click(function(){
			 
		/* 	 console.log(pwdNo);
			 console.log($("#qnaNewPwd").val()); */
			
			if(pwdNo == $("#qnaNewPwd").val()){
				location.href="<%=contextPath%>/qnaDetail.qa?qnaNo=" + qnaNo;
				
			}else{
				alert("비밀번호가 일치하지 않습니다.");
				location.href="<%=contextPath%>/qnaList.qa";
			}
			
		
		});
	});
</script>



</body>
</html>