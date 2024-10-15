<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BitcampTinder: 회원가입</title>
<link rel="stylesheet" href="../css/user.css">
<style>
#Formwrap {
    width: 300px;
    margin: 50px auto;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    background-color: #f9f9f9;
}

div {
    margin-bottom: 15px;
}

div label {
    display: block;
    font-weight: bold;
    margin-bottom: 5px;
}

input[type="text"], input[type="password"],input[type="mbti"],input[type="reli"], input[type="submit"], input[type="reset"] input[type="mbti"]{
    
    width: calc(100% - 20px); /* 패딩을 고려한 너비 조절 */
    padding: 8px 10px;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type="text"]:hover, input[type="mbti"]:hover, input[type="reli"]:hover,input[type="password"]:hover, input[type="submit"]:hover, input[type="reset"]:hover {
    
    border-color: #888;
}

input[type="text"]:focus, input[type="mbti"]:focus, input[type="reli"]:focus,input[type="password"]:focus {
    border-color: #5a9;
    outline: none;
    box-shadow: 0 0 5px rgba(90, 153, 90, 0.5);
}

/* id, name, pwdWrap 항목 컨테이너 스타일 */
#idwrap, #namewrap, #pwdwrap, #btnwrap,#resetwrap,#categorywrap,#sportwrap, #foodwrap,
#hobbywrap, #artwrap, #musicwrap, #smokingwrap , #mbtiwrap, #reliwrap{
    font-family: Arial, sans-serif;
    font-size: 14px;
    color: #333;
}

#smokingwrap {
    display: flex;
    align-items: center;
}
#smokingwrap label {
    margin-right: 10px; /* 라벨과 라디오 버튼 간의 간격 조절 */
}
#buttonWrap {
    display: flex;
    justify-content: space-between; /* 버튼 간의 간격 조정 */
}
</style>
</head>
<body>
<div id="wrap">
    <div id="Formwrap">
        <a href="/BitcampTinder/"><img src="../image/apple.jpg" width="30" alt="Tinder" /></a> 회원가입
        <form id="writeForm">
            <div id="inputwrap">
                <div id="namewrap">
                    <div>이름 : </div>
                    <input type="text" id="name" name="name"/>
                    <div id="nameDiv"></div>
                </div>
                <div id="idwrap">
                    <div>아이디 : </div>
                    <input type="text" id="id" name="id"/>
                    <div id="idDiv"></div>
                </div>
                <div id="pwdwrap">
                    <div>비밀번호 : </div>
                    <input type="password" id="pwd" name="pwd"/>
                    <div id="pwdDiv"></div>
                </div>
                <div id="mbtiwrap">
                    <div>MBTI : </div>
                    <input type="mbti" id="mbti" name="mbti"/>
                    <div id="mbtiDiv"></div>
                </div>
                
                <div id="reliwrap">
                    <div>종교 : </div>
                    <input type="reli" id="reli" name="reli"/>
                    <div id="reliDiv"></div>
                </div>
                <!-- 추가 -->
<style>
#telwrap {
	display: flex;
	flex-direction: column; /* 요소를 수직으로 나열 */
	gap: 5px; /* 각 칸 사이의 간격 */
}
#telInputs {
	display: flex;
	gap: 5px; /* 입력 필드 간의 간격 */
	align-items: center; /* 입력 필드의 세로 정렬 */
}
#telwrap label {
	font-size: 14px;
	
}
#telwrap select, #telwrap input {
	padding: 5px;
	font-size: 16px;
}
</style>
<div id="telwrap">
    <label for="tel1">핸드폰 번호 :</label> <!-- 핸드폰 번호 제목 -->
    <div id="telInputs">
        <!-- 첫 번째 번호 선택 -->
        <select id="tel1" name="tel1">
            <optgroup>
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="019">019</option>
            </optgroup>
        </select>
        
        <!-- 두 번째 번호 입력 -->
        <input type="text" id="tel2" name="tel2" size="4" maxlength="3" />
        <!-- 세 번째 번호 입력 -->
        <input type="text" id="tel3" name="tel3" size="4" maxlength="3" />
    </div>
    
    <div id="telDiv"></div>
</div>
<div style="display: inline-block; width: 45%; margin-right: 5%;">
   <div id="categorywrap">
                    <label for="travelcategory">여행 카테고리 :</label>
                    <select id="travelcategory" name="travelcategory">
                        <option value="domestic">국내여행</option>
                        <option value="overseas">해외여행</option>
                        <option value="camping">캠핑</option>
                        <option value="backpacking">배낭여행</option>
                        <option value="nature_exploration">자연탐방</option>
                    </select>
                   <div id="travelcategoryDiv"></div>
             </div> 
             </div> 
<div style="display: inline-block; width: 45%;">
  <div id="sportwrap">
                    <label for="sportcategory">스포츠및 운동:</label>
                    <select id="sportcategory" name="sportcategory">
                        <option value="축구">축구</option>
                        <option value="여행">여행</option>
                        <option value="야구">야구</option>
                        <option value="테니스">테니스</option>
                        <option value="수영">수영</option>
                        <option value="요가">요가</option>
                        <option value="사이클링">사이클링</option>
                        <option value="헬스/피트니스">헬스/피트니스</option>
                    </select>
                   <div id="sportcategoryDiv"></div>
                </div>
                </div>
    <!-- 음식 -->
    <div style="display: inline-block; width: 45%; margin-right: 5%;">
<div id="foodwrap">
                    <label for="foodcategory">요리:</label>
                    <select id="foodcategory" name="foodcategory">
                        <option value="요리">요리</option>
                        <option value="식사">식사</option>
                        <option value="디저트">디저트</option>
                        <option value="채식">채식</option>
                        <option value="세계">세계 음식 탐방</option>
                    </select>
                   <div id="foodcategoryDiv"></div>
                </div>
                 </div>
<!-- 취미 및 여가  -->

<div style="display: inline-block; width: 45%;">
<div id="hobbywrap">
                    <label for="hobbycategory">취미 및 여가:</label>
                    <select id="hobbycategory" name="hobbycategory">
                      <option value="독서">독서</option>
                        <option value="게임">게임</option>
                        <option value="DIY">DIY</option>
                        <option value="자전거 타기">자전거 타기</option>
                        <option value="사진 촬영">사진 촬영</option>
                        <option value="정원가꾸기">정원가꾸기</option>
                    </select>
                   <div id="hobbycategoryDiv"></div>
                </div>
                 </div>
<!-- 예술 및 문화  -->
<div style="display: inline-block; width: 45%; margin-right: 5%;">
<div id="artwrap">
                    <label for="artcategory">음악 취향:</label>
                    <select id="artcategory" name="artcategory">
                          <option value="음악">음악</option>
                        <option value="미술">미술</option>
                        <option value="영화">영화</option>
                        <option value="공연예술">공연예술</option>
                        <option value="사진">사진</option>
               
                    </select>
                   <div id="artcategoryDiv"></div>
                </div>
                </div>  
 <!-- 음악  -->
 <div style="display: inline-block; width: 45%;">
<div id="musicwrap">
                    <label for="musiccategory">취미 및 여가:</label>
                    <select id="musiccategory" name="musiccategory">
                        <option value="클래식">클래식</option>
                        <option value="팝">팝</option>
                        <option value="록">록</option>
                        <option value="힙합">힙합</option>
                        <option value="재즈">재즈</option>
                        <option value="EDB">EDM</option>
               
                    </select>
                   <div id="musiccategoryDiv"></div>
                </div>
                  </div>
    <!-- 흡연 -->
    
  <div id="smokingwrap">
                    <label>흡연 유무:</label>
                    <input type="radio" id="smokingYes" name="smoking" value="yes">
                    <label for="smokingYes">유</label>
                    <input type="radio" id="smokingNo" name="smoking" value="no">
                    <label for="smokingNo">무</label>
                    <div id="smokingDiv"></div>
                </div>                     
          <!-- 수정 x -->
                <div id="btnwrap">
                    <button type="button" id="writeBtn" style="width: 100px; height: 30px;">회원가입</button>
              <!--   </div>
                <div id="resetwrap"> -->
                    <button type="reset" id="resetBtn"style="width: 100px; height: 30px;">취소</button>
                </div>
            </div>
        </form>
    </div>
</div>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript" src="../js/write.js"></script>
</body>
</html>