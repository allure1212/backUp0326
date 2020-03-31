<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<style>
        #outer{
            width: 600px;
          	margin-left: 300px;
         
            
        
        }

        .list{width:200px;
            height:50px;
            font-size: 15px;
            font-weight: bold;
            text-align: left;}
            
      


    </style>

<body>

<%@ include file ="../common/adminMenubar.jsp" %>

 <div id="outer">
    <h2>새 영화 등록</h2>
    
    <form action="<%=request.getContextPath()%>/insertMovie.mv"  method="post" enctype="multipart/form-data">
        <table id="frame">
            <tr>
                <td class="list">포스터 등록</td>
                <td><input type="file" id="poster" name="poster" required></td>
            </tr>
            
            <tr>
                <td class="list">영화제목</td>
                <td><input type="text" id="title" name="title" required></td>
            </tr>

            <tr>
                <td class="list">감독</td>
                <td><input type="text" id="director" name="director" required></td>
            </tr>

            <tr>
                <td class="list">출연진</td>
                <td><input type="text" id="actor" name="actor" required></td>
            </tr>

            <tr>
                <td class="list">개봉 예정일</td>
                <td><input type="date" id="ondate" name="ondate" required></td>
            </tr>

            <tr>
                <td class="list">상영시간</td>
                <td><input type="number" id="runtime" name="runtime" required></td>
            </tr>

            <tr>
                <td class="list">관람연령</td>
                <td><select id="agelimit" name="agelimit" required> 
               			<option value="전체이용가">전체이용가</option>
               			<option value="7세이상">7세이상</option>
               			<option value="12세이상">12세이상</option>
               			<option value="15세이상">15세이상</option>
               			<option value="18세이상">18세이상</option>
               			
                
              		 </select></td>
                
            </tr>

            <tr>
                <td class="list">줄거리</td>
                <td><textarea name="synopsis" id="synopsis" cols="60" rows="10" required></textarea></td>
            </tr>
            

            <tr>
                <td class="list">장르</td>
                <td>
                    <div style="border: 1px solid black;">
                    <table>
                        <tr>
                            <td><input type="checkbox" id="sport" name="genre" value="1"><label for="sport">스포츠</label></td>
                            <td><input type="checkbox" id="crime" name="genre" value="2"><label for="crime">범죄</label></td>
                            <td><input type="checkbox" id="drama" name="genre" value="3"><label for="drama">드라마</label></td>
                            <td><input type="checkbox" id="docu" name="genre" value="4"><label for="docu">다큐멘터리</label></td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" id="comedy" name="genre" value="5"><label for="comedy">코미디</label></td>
                            <td><input type="checkbox" id="thriller" name="genre" value="6"><label for="thriller">스릴러</label></td>
                            <td><input type="checkbox" id="war" name="genre" value="7"><label for="war">전쟁</label></td>
                            <td><input type="checkbox" id="anime" name="genre" value="8"><label for="anime">애니메이션</label></td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" id="family" name="genre" value="9"><label for="family">가족</label></td>
                            <td><input type="checkbox" id="fantasy" name="genre" value="10"><label for="fantasy">판타지</label></td>
                            
                            <td><input type="checkbox" id="action" name="genre" value="11"><label for="action">액션</label></td>
                            <td><input type="checkbox" id="sf" name="genre" value="12"><label for="sf">SF</label></td>
                        </tr>

                        <tr>
                            <td><input type="checkbox" id="r/m" name="genre" value="13"><label for="r/m">로맨스/멜로</label></td>
                            <td><input type="checkbox" id="r/c" name="genre" value="14"><label for="r/c">로맨스/코미디</label></td>
                        </tr>
                   
                    </table>
                </div>
                </td>
            </tr>

        </table>
        <br><br>

        <div align="center"><button type="submit" onclick="return checkboxValidate();">등록</button></div>



    </form>

</div>

<script>

function checkboxValidate(){
		
	
	 var genre = $('input[name="genre"]:checked').length;
	 
	 if(genre>0){
		 return true;
	 }else{
		 alert("하나이상의 장르를 선택해주세요.");
		 return false;
	 }
	
}
	
</script>


</body>
</html>