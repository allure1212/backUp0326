<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>


<style>
	*{margin:0;padding:0;}
	html, body {
		height:100%;
		background-color: #d4d4d4;	
	}
    div{
        box-sizing: border-box;
        
        }

    #wrap{
        width: 1200px;
        height: 800px;
    }
    #top{
        width: 100%;
        height: 100px;
        background:rgb(44,44,44);
      
    }
    #mode{
        float: right;
        font-size: 20px;
    }

    #body{
        width: 100%;
        height: 88%;
		
    }
    #navbar{
        width: 200px;
        height: 100%;
        float: left;
        line-height: 80px;
        background:rgb(44,44,44);
        font-size: large;
    	font-weight: bold;
    }

    .listBtn{
        width: 200px;
        height: 40px;
        cursor: pointer;
		background:rgb(44,44,44);
		color:rgb(243, 243, 243);
		font-size: large;
   	 	font-weight: bold;
    }
    .listBtn:hover{
        background-color: gray;
    }
    .menu{
        text-align: center;
        line-height: 50px;
        display: none;
        border-bottom: 1px solid gray;
        border-right: 1px solid gray;
        border-bottom-right-radius: 10px;
        color:rgb(243, 243, 243);
		font-size: large;
   	 	font-weight: bold;
    }

    .menu label{
        cursor: pointer;
    }
   
	#logoHome:hover { cursor: pointer; }

	#follow { position:absolute; top:180px; right:50%; margin-right:-670px; }

</style>
<body>
  
       

    <div id="top">
         <div>
         	<img id="logoHome" src="<%=request.getContextPath() %>/resources/images/p_logo.png" width=200px;">
         		<div id="mode">관리자 모드</div>
         </div>
         
    </div>

 
            <script>
            	$('#logoHome').on('click',function(){
            		location.href = "<%= request.getContextPath() %>"	
            	})
            	
            	function goInsertMovie(){
            			location.href = "<%= request.getContextPath()%>/insertMovieForm.mv"
            			
            			}
            		
            	function goOnMovie(){
            			location.href = "<%=request.getContextPath()%>/listOnMovie.mv"
            			}
            	
            	function goComingMovie(){
            			location.href = "<%=request.getContextPath()%>/listComingMovie.mv"
            			}
            	
            	function goOffMovie(){
            			location.href = "<%=request.getContextPath()%>/listOffMovie.mv"
            			
            			}
            	
            	function goListTheater(){
            			location.href = "<%=request.getContextPath()%>/listTheater.ta"
            		
            	}
            	
            	function goInsertTheater(){
            			location.href = "<%=request.getContextPath()%>/InsertTheaterForm.ta"
            		
            	}
            	
            	function goScreen(){
            			location.href = "<%=request.getContextPath()%>/listScreen.sc"
            	}
            	
            	/* sujin List of Reserved*/
            	function listReserved(){
            		location.href="<%=request.getContextPath()%>/listAllReserved.do"
            	}
            	
            	/* 관리자 회원 관리 */
            	function goAdminList(){
            		location.href = "<%=request.getContextPath()%>/adminList.me";
            	}
            	
            	/* 관리자 1:1문의 */
            	function goQna(){
                	location.href = "<%=request.getContextPath()%>/adminList.qa";
                }
                
            	/* 관리자 FAQ */
                function goFaq(){
        			location.href = "<%=request.getContextPath()%>/adminList.fq";
        		}
                
            	/* 관리자 공지사항 */
                function goNotice(){
        			location.href = "<%=request.getContextPath()%>/adminList.no";
        		}
                
                function goReview(){
        			location.href = "<%=request.getContextPath()%>/adminList.re";
        		}
                
                /* 관리자 대관문의 */
                function goBorrowRoom(){
        			location.href = "<%=request.getContextPath()%>/adminList.br";
        		}
                
                /* 관리자 분실물관리 */
                function goLostarticle(){
        			location.href = "<%=request.getContextPath()%>/adminList.lo";
        		}
                
            
            </script>
            

        <div id="navbar" id="follw">
            <button class="listBtn">영화관리</button>
            <div class="menu">
                <label onclick="goInsertMovie();">새영화등록</label><br>
                <label onclick="goOnMovie();">현재상영작</label><br>
                <label onclick="goComingMovie();">상영예정작</label><br>
                <label onclick="goOffMovie();">지난상영작</label>
            </div>
            
            <button class="listBtn">영화관 관리</button>
            <div class="menu">
                <label onclick="goListTheater();">영화관 목록</label><br>
                <label onclick="goInsertTheater();">영화관 등록</label><br>
                <label onclick="goScreen();">전체 상영 정보</label> 
            </div>
            
            <button class="listBtn">회원관리</button>
            <div class="menu">
                <label onclick="goAdminList();">회원 리스트</label><br>
                <label>블랙 리스트</label><br>
                
            </div>
            
              <button class="listBtn">예매관리</button>
            <div class="menu">
                <label onclick="listReserved();">예매내역확인</label><br>
               
            </div>
            <button class="listBtn">게시물관리</button>
            <div class="menu">
                <label class="detail" onclick="goQna();">1:1 문의</label><br>
                <label class="detail" onclick="goFaq();">FAQ</label><br>
                <label class="detail" onclick="goNotice();">공지사항</label><br>
                <label class="detail" onclick="goReview();">리뷰</label><br>
                <label class="detail" onclick="goBorrowRoom();">대관문의</label><br>
                <label class="detail" onclick="goLostarticle();">분실물관리</label><br>
            </div>
            <button class="listBtn">통계관리</button>
            <div class="menu">
                <label>방문자 통게</label><br>
                <label>장르별 영화예매 통계</label><br>
                <label>성별 영화 예매 통계</label><br>
                <label>나이별 영화 예매 통계</label><br>
                <label>매출 통계</label>
            </div>
            

        </div>

        <script>
 
        
            $(document).ready(function(){
                
                $(".listBtn").on("click",function(){
                    var m = $(this).next();


                    if(m.css("display")=="none"){
                        $(this).siblings(".menu").slideUp();
                        m.slideDown();

                    }else{
                        m.slideUp();
                    }


                });

                $("label").on("click",function(){
                    $(this).css("backgroundColor","gray").css("color","white");
                    $(this).siblings().css("backgroundColor","white").css("color","black");
                    

                });

            });
            
            $(window).scroll(function(){
            	var scrollTop = $(document).scrollTop();
            	if (scrollTop < 180) {
            	 scrollTop = 180;
            	}
            	$("#follow").stop();
            	$("#follow").animate( { "top" : scrollTop });
            });


        </script>


      

        
     
   




   









    
</body>
</html>