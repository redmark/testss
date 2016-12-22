<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Admin page</title>
</head>
<body>
Dear <strong>${user}</strong>, Welcome to Admin Page.

<sec:authorize access="isFullyAuthenticated()" >
    <label><a href="#">Create New User</a> | <a href="#">View existing Users</a></label>
</sec:authorize>
<sec:authorize access="isRememberMe()">
    <label><a href="#">View existing Users</a></label>
</sec:authorize>

<c:url var="logout" value="/logout" />
<form action="${logout}" method="post" >
    <input type="submit" value="logout">
    <input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
</form>

</body>
</html>