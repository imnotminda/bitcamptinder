<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700,900&display=swap" rel="stylesheet">
<title>My페이지 - 프로필</title>
<style>

  .innerOuter {
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }
          .menu {
            list-style-type: none;
            margin-right: 10px;
            margin-left: 0px;
            padding-left: 0px;
            width: 15%;
            height: 100%;
            overflow: auto;
	    }
	
        .menu li a {
            display: block;
            color: #000;
            padding: 8px 16px;
            text-decoration: none;
        }
	
        .menu li a.active {
            background-color: #5271FF;
            color: white;
        }
	
        .menu li a:hover:not(.active) {
            background-color: #5271FF;
            color: white;
        }
        
           ul {
            list-style:none;
        }     
        
body {
    font-family: 'Roboto', sans-serif;
    background: #fbfbfb;
}
.profile-widget {
    width: 400px;
    margin: 0 auto;
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 4px;
    text-align: center;
    color: #848484;
}
.cover-img {
    max-height: 200px;
    overflow: hidden;
    width: 100%;
}
.user-details{
    padding: 0px 20px 30px;
}
.profile-widget h3 {
    color: #6E9DDC;
    margin: 20px 0px 10px;
}
.profile-widget img {
    width: 100%;
    max-width: 100%;
    height: auto;
    display: block;
}
.user-img {
    width: 100px;
    height: 100px;
    border-radius: 100%;
    overflow: hidden;
    box-shadow: 0px 0px 4px 0px #6E9DDC;
    border: 4px solid #fff;
    margin: 0 auto;
    margin-top: -60px;
    position: relative;
    z-index: 999;
}
.followers h3 {
    width: 49%;
    float: left;
    padding: 6px 0px;
    border: 1px dashed #838383;
    border-radius: 144px;
    font-size: 18px;
}
.followers h3:last-child{
    float: right;
}
.followers h3 span {
    font-weight: normal;
    font-size: 16px;
}
button.follow-btn {
    font-size: 19px;
    background: #6E9DDC;
    border: none;
    color: #fff;
    padding: 10px 15px;
    margin: 20px 0px 0px;
    width: 100%;
    cursor: pointer;
}
button.follow-btn:hover{
    opacity: 0.8;
}
h2.widget-heading {
    font-size: 25px;
    font-weight: normal;
    margin: 20px 0px 10px;
    padding: 0px 0px 10px;
}
@media (max-width: 767px){
.profile-widget {
    width: 90%;
}
</style>
</head>
<body>


        <div class="innerOuter">
            <h2>마이페이지</h2>
            <br>
            <hr>
            <br>
            <div style="display: flex;">
					
                <ul class="menu" style="padding-left:0px; width : 230px;">
                    <br>
                    <li><a href="myPage.se">마이페이지</a>
                        <ul style="width : 210px;">
                        	<li><a href="pwdChange.me">- 회원 정보수정 </a></li>
                        	<li><a href="delete.me">- 회원 탈퇴</a></li>
                        </ul>
                    </li>
                    <hr>
		            <li><a href="written.io">참여한 프로젝트</a></li>
		            <li><a href="#">찜한 프로젝트</a></li>
		            <li><a href="likedJob.me">찜한 채용공고</a></li>
		            <hr>
		            <li><a href="written.ro">작성한 게시글</a></li>
		          </ul>
                
                
				<div class="profile-widget">
				    <h2 class="widget-heading">프로필</h2>
				    <div class="cover-img">
				       <label for="chooseFileBg"><img src="resources/image/background/<fmt:formatNumber value='${sessionScope.UserDTO.propicfic}' pattern='00000000' />.jpg" onerror="this.src='resources/image/company/signup-bg.jpg'" onclick="" id="uploadFilesBg">
				       </label>
				    </div>     
				    <div class="user-details">
				        <div class="user-img">
				        	<form method="post" enctype="multipart/form-data">
		                        <label for="chooseFile">
		                            <div id="canvas">
		                                <c:choose>
		                                    <c:when test="${sessionScope.loginMember.memberPhotoExtend eq jpg}">
		                                        <img src="resources/image/company/signup-bg.jpg" id="uploadFiles">
		                                    </c:when>
		                                    <c:otherwise>
		                                        <img src="resources/image/profile/<fmt:formatNumber value='${sessionScope.loginMember.memberNo}' pattern ='00000000' />.${sessionScope.loginMember.memberPhotoExtend}" alt="User photo2" id="uploadFiles">
		                                    </c:otherwise>
		                                </c:choose>
		                            </div>
		                        </label>
		                        <input type="file" id="chooseFile" name="chooseFile" accept="image/*" onchange="loadFile(this);" style="visibility: hidden;">
								<input type="file" id="chooseFileBg" name="chooseFileBg" accept="image/*" onchange="loadFileBg(this);" style="visibility: hidden;">
                    		</form>
				        </div>
				         <div id="fileName"></div>
				        <h3>${sessionScope.loginMember.memberName}</h3>
				        <h3>${userDTO.user_username}</h3>
				        <p>자신이 보유하고 있는 기술 태그들 쓰기</p>
				        <div class="followers">
				            <h3>아이디<br><span>${sessionScope.loginMember.memberId}</span></h3>
				            <h3>내가 작성한 게시글 개수<br><span>${sessionScope.countSum}</span></h3>
				        </div>
				        <button class="follow-btn" onclick="location.href='myPage.me'">수정하기</button> <br>
				        <button class="follow-btn" onclick="location.href='projecting.bo'">참여중인 프로젝트</button>
				    </div>
						Image by <a href="https://www.freepik.com/free-photo/empty-room-with-chairs-desks_15501155.htm#query=office&position=4&from_view=search&track=sph&uuid=bc5b64e6-870d-4c59-a1d8-d8ba1d700a20">Freepik</a>
		            <c:choose>
		                <c:when test="${sessionScope.loginMember.memberPhotoExtend}">
		                    <a href="https://www.freepik.com/free-vector/illustration-uploading-icon_2609994.htm#page=3&query=upload%20file&position=34&from_view=search&track=ais&uuid=9266a4ed-f875-4e8e-a066-016287752433">Image by rawpixel.com</a> on Freepik
		                </c:when>	
		            </c:choose>
		        </div>
			</div>
		
		</div>
		<script>
		function loadFile(input) {
			var files = input.files;
			$("#uploadFiles").attr("src", URL.createObjectURL(files[0]));

			var formData = new FormData();
			formData.append("uploadFiles", files[0])

			$.ajax({
				type : "POST",
				url : "member.co",
				processData: false,
				contentType: false,
				data : formData,
				success : function(result) { alert(result); },
				error : function(xhr, status, error) { alert(error); }
			});
		};
		function loadFileBg(input) {
			var files = input.files;
			$("#uploadFilesBg").attr("src", URL.createObjectURL(files[0]));

			var formData = new FormData();
			formData.append("uploadFiles", files[0])

			$.ajax({
				type : "POST",
				url : "member.mo",
				processData: false,
				contentType: false,
				data : formData,
				success : function(result) { alert(result); },
				error : function(xhr, status, error) { alert(error); }
			});
		};

		</script>
	
</body>
</html>

