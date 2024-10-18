<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Matching Users</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <style>
.card {
	width: 100%;
	border: 1px solid #ddd;
	border-radius: 10px;
	overflow: hidden;
	margin-bottom: 30px;
}

.card-img-top {
	width: 100%;
	height: 348px;
	object-fit: cover;
}

.card-title {
	color: black;
}

.card-text {
	color: black;
}
</style>
</head>
<body>
<c:import url="/WEB-INF/header/header.jsp"></c:import>
<div class="container mt-5">
    <h2 class="mb-5"></h2>
    
     <div class="row">
        <c:if test="${not empty matchingUsers}">
            <c:forEach var="user" items="${matchingUsers}">
                  <div class="col-4 mb-4">
                    <div class="card h-100">
                        <c:choose>
                            <c:when test="${not empty user.profile_pic}">
                                <img src="${user.profile_pic}" class="card-img-top" alt="Profile Pic">
                            </c:when>
                            <c:otherwise>
                                <img src="../image/tlogo.png" class="card-img-top" alt="Default Profile Pic">
                            </c:otherwise>
                        </c:choose>
                        <div class="card-body">
                            <h5 class="card-title">${user.user_name}</h5>
                            <p class="card-text">매치 점수: ${user.matchScore}</p>
                        </div>
                        <div class="card-footer">
                            <small class="text-muted">성별: ${user.user_gender}</small><br>
                            <small class="text-muted">나이: ${user.user_age}</small>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div> <!-- End of the row -->
    
    <div>
        <a href="/BitcampTinder/" class="btn btn-primary">돌아가기</a>
    </div>
</div>
</body>
</html>
