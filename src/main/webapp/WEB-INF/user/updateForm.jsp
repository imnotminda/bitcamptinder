<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BitcampTinder: 회원가입</title>
<!-- <link rel="stylesheet" href="../css/user.css"> -->
<style>
#btnwrap {
	display: flex;
	justify-content: center; /* 가로 가운데 정렬 */
	gap: 20px; /* 버튼 간 간격 */
	margin-top: 20px;
}

/* 버튼 스타일 */
button {
	width: 120px;
	height: 40px;
	background-color: #b81c40; /* 버튼 배경 색상 */
	border: none;
	border-radius: 5px; /* 둥근 모서리 */
	color: white; /* 버튼 텍스트 색상 */
	font-size: 16px; /* 버튼 텍스트 크기 */
	cursor: pointer; /* 마우스를 올렸을 때 커서 변경 */
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); /* 버튼 그림자 */
	transition: background-color 0.3s ease; /* 배경색 전환 효과 */
}

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

input[type="text"], input[type="password"], input[type="mbti"], input[type="reli"],
	input[type="submit"], input[type="reset"] input[type="mbti"] {
	width: calc(100% - 20px); /* 패딩을 고려한 너비 조절 */
	padding: 8px 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type="text"]:hover, input[type="mbti"]:hover, input[type="reli"]:hover,
	input[type="password"]:hover, input[type="submit"]:hover, input[type="reset"]:hover
	{
	border-color: #888;
}

input[type="text"]:focus, input[type="mbti"]:focus, input[type="reli"]:focus,
	input[type="password"]:focus {
	border-color: #5a9;
	outline: none;
	box-shadow: 0 0 5px rgba(90, 153, 90, 0.5);
}

/* id, name, pwdWrap 항목 컨테이너 스타일 */
#idwrap, #namewrap, #pwdwrap, #btnwrap, #resetwrap, #categorywrap,
	#sportwrap, #foodwrap, #hobbywrap, #artwrap, #musicwrap, #smokingwrap,
	#mbtiwrap, #reliwrap, #genderwrap, #agewrap, #moviewrap {
	font-family: Arial, sans-serif;
	font-size: 14px;
	color: #333;
}

#smokingwrap, #genderwrap {
	display: flex;
	align-items: center;
}

#smokingwrap, #genderwrap label {
	margin-right: 10px; /* 라벨과 라디오 버튼 간의 간격 조절 */
}

#buttonWrap {
	display: flex;
	justify-content: space-between; /* 버튼 간의 간격 조정 */
}

#telwrap {
	display: flex;
	flex-direction: column; /* 요소를 수직으로 나열 */
	gap: 3px; /* 각 칸 사이의 간격 */
}

#telInputs {
	display: flex;
	gap: 7px; /* 입력 필드 간의 간격 */
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
</head>
<body>
    <div id="wrap">
        <div id="Formwrap">
            <a href="/BitcampTinder/"><img src="../image/apple.jpg" width="25" alt="Tinder" /></a> 
            BitcampTinder 회원정보 수정
            <form id="updateForm">
                <div id="inputwrap">
                    <!-- 사용자 정보 출력 -->
                    <div id="namewrap">
                        <div>이름 :</div>
                        <input type="text" id="user_name" name="user_name" value="${userDTO.user_name}" />
                        <div id="nameDiv"></div>
                    </div>
               <!--      <div id="genderwrap">
                        <label>성별 :</label>
                        <input type="radio" id="genderMale" name="user_gender" value="male" > 
                        <label for="genderMale">남</label>
                        <input type="radio" id="genderFemale" name="user_gender" value="female" >
                        <label for="genderFemale">여</label>
                        <div id="genderDiv"></div>
                    </div> -->
                    <!-- 수정못하게 readonly걸어둠  -->
                           <div id="agewrap">
                        <div>나이 :</div>
                        <input type="text" id="user_age" name="user_age" value="${userDTO.user_age}" readonly />
                        <div id="ageDiv"></div>
                    </div>
                    <div id="idwrap">
                        <div>아이디 :</div>
                        <input type="text" id="user_username" name="user_username" value="${userDTO.user_username}" readonly />
                        <div id="idDiv"></div>
                    </div>
                    <div id="pwdwrap">
                        <div>비밀번호 :</div>
                        <input type="password" id="user_pwd" name="user_pwd" value="${userDTO.user_pwd}" />
                        <div id="pwdDiv"></div>
                        
                    <div id="mbtiwrap">
                        <div>MBTI :</div>
                        <input type="mbti" id="user_mbti" name="user_mbti"  />
                        <div id="mbtiDiv"></div>
                    </div>
                    <div id="reliwrap">
                        <div>종교 :</div>
                        <input type="reli" id="user_religion" name="user_religion" value="${userDTO.user_religion}" />
                        <div id="reliDiv"></div>
                    </div>
                    <div id="telwrap">
                        <label for="tel1">핸드폰 번호 :</label>
                        <div id="telInputs">
                            <select id="user_tel1" name="user_tel1">
                                <optgroup>
									<option value="010">010</option>
									<option value="011">011</option>
									<option value="019">019</option>
								</optgroup>
                            </select>
                            <input type="text" id="user_tel2" name="user_tel2" size="3" maxlength="4" style="width: 90px;" value="${userDTO.user_tel2}" />
                            <input type="text" id="user_tel3" name="user_tel3" size="3" maxlength="4" style="width: 90px;" value="${userDTO.user_tel3}" />
                        </div>
                        <div id="telDiv"></div>
                    </div>
                    <div id="emailwrap">
                        <label for="email1">이메일 :</label>
                        <div id="emailInputs">
                            <input type="text" name="user_email1" id="user_email1" size="10" placeholder="이메일 앞부분" value="${userDTO.user_email1}" /> @
                            <input type="text" name="user_email2" id="user_email2" size="10" placeholder="도메인" value="${userDTO.user_email2}" />
                            <input type="text" name="user_email3" id="user_email3" list="email3_list" placeholder="직접 입력 또는 선택" />
                            <datalist id="email3_list">
                                <optgroup label="직접 입력"></optgroup>
                                <option value="naver.com">naver.com</option>
                                <option value="google.com">google.com</option>
                                <option value="bitcamp.com">bitcamp.com</option>
                            </datalist>
                        </div>
                    </div>
                    
                    
                 <!-- 선택사항 -->
                 					<!--  10.여행 -->
					<div style="display: inline-block; width: 45%; margin-right: 5%;">
						<div id="categorywrap">
							<label for="travelcategory">여행 카테고리 :</label> 
							<select id="user_travel" name="user_travel">
								<option value="국내여행">국내여행</option>
								<option value="해외여행">해외여행</option>
								<option value="camping">캠핑</option>
								<option value="배낭여행">배낭여행</option>
								<option value="자연탐방">자연탐방</option>
							</select>
							<div id="travelcategoryDiv"></div>
						</div>
					</div>
						<!--  11.스포츠 -->
					<div style="display: inline-block; width: 45%;">
						<div id="sportwrap">
							<label for="sportcategory">스포츠및 운동:</label> 
							<select id="user_sport" name="user_sport">
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
					<!-- 12.음식 -->
					<div style="display: inline-block; width: 45%; margin-right: 5%;">
						<div id="foodwrap">
							<label for="foodcategory">요리:</label> 
							<select id="user_food" name="user_food">
								<option value="요리">요리</option>
								<option value="식사">식사</option>
								<option value="디저트">디저트</option>
								<option value="채식">채식</option>
								<option value="세계">세계 음식 탐방</option>
							</select>
							<div id="foodcategoryDiv"></div>
						</div>
					</div>
					<!-- 13.취미 및 여가  -->

					<div style="display: inline-block; width: 45%;">
						<div id="hobbywrap">
							<label for="hobbycategory">취미 및 여가:</label> 
							<select id="user_hobby" name="user_hobby">
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
					<!--14. 예술 및 문화  -->
					<div style="display: inline-block; width: 45%; margin-right: 5%;">
						<div id="artwrap">
							<label for="artcategory">음악 취향:</label> 
							<select id="user_art" name="user_art">
								<option value="음악">음악</option>
								<option value="미술">미술</option>
								<option value="영화">영화</option>
								<option value="공연예술">공연예술</option>
								<option value="사진">사진</option>

							</select>
							<div id="artcategoryDiv"></div>
						</div>
					</div>
					<!--15. 음악  -->
					<div style="display: inline-block; width: 45%;">
						<div id="musicwrap">
							<label for="musiccategory">취미 및 여가:</label> <select
								id="user_music" name="user_music">
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
			<div style="display: inline-block; width: 100%;">
      <!-- 흡연 -->
    <div id="smokingwrap" style="display: inline-block; width: 45%; vertical-align: top;">
        <label>흡연 :</label>
        <div style="display: inline-block;">
            <input type="radio" id="smokingYes" name="user_smoke" value="yes">
            <label for="smokingYes">유</label>
        </div>
        <div style="display: inline-block;">
            <input type="radio" id="smokingNo" name="user_smoke" value="no">
            <label for="smokingNo">무</label>
        </div>
        <div id="smokingDiv"></div>
    </div>


    <!-- 영화 -->
    <div id="moviewrap" style="display: inline-block; width: 45%; vertical-align: top;">
        <label for="moviecategory">영화 :</label>
        <select id="user_movie" name="user_movie">
            <option value="공포">공포</option>
            <option value="로맨스">로맨스</option>
            <option value="애니메이션">애니메이션</option>
            <option value="액션">액션</option>
        </select>
        <div id="moviecategoryDiv"></div>
    </div>
</div>
                    <div id="btnwrap">
                        <button type="button" id="updateBtn" style="width: 100px; height: 30px;">수정</button>
                        <button type="reset" id="resetBtn" style="width: 100px; height: 30px;">취소</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script type="text/javascript" src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script type="text/javascript" src="../js/update.js"></script>
</body>
</html>
