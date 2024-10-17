<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Matching Users</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <h2>Matched Users</h2>
    
    <table class="table table-bordered table-striped">
        <thead>
            <tr>
                <th>Username</th>
                <th>Name</th>
                <th>Age</th>
                <th>Gender</th>
                <th>Match Score</th>
                <th>Profile Picture</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:if test="${not empty matchingUsers}">
                <c:forEach var="user" items="${matchingUsers}">
                    <tr>
                        <td>${user.user_username}</td>
                        <td>${user.user_name}</td>
                        <td>${user.user_age}</td>
                        <td>${user.user_gender}</td>
                        <td>${user.matchScore}</td>
                        <td>
                            <c:choose>
                                <c:when test="${not empty user.profile_pic}">
                                    <img src="${user.profile_pic}" alt="Profile Pic" style="width:50px; height:50px;" class="rounded-circle">
                                </c:when>
                                <c:otherwise>
                                    <img src="default-profile.png" alt="Default Profile Pic" style="width:50px; height:50px;" class="rounded-circle">
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <a href="viewProfile?username=${user.user_username}" class="btn btn-info btn-sm">View Profile</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>
            <c:if test="${empty matchingUsers}">
                <tr>
                    <td colspan="7" class="text-center">No matching users found.</td>
                </tr>
            </c:if>
        </tbody>
    </table>
    
    <a href="/BitcampTinder/" class="btn btn-primary">Back to Home</a>
</div>
</body>
</html>
