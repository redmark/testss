<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>HelloWorld page</title>
</head>
<body>
Dear <strong>${user}</strong>, Welcome to Home Page.
<c:url var="logout" value="/logout" />
<form action="${logout}" method="post" >
    <input type="submit" value="logout">
    <input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
</form>

<br/>
<br/>
<div>
    <label>View all information| This part is visible to Everyone</label>
</div>

<br/>
<div>
    <sec:authorize access="hasRole('ADMIN')">
        <label><a href="#">Edit this page</a> | This part is visible only to ADMIN</label>
    </sec:authorize>
</div>

<br/>
<div>
    <sec:authorize access="hasRole('ADMIN') and hasRole('DBA')">
        <label><a href="#">Start backup</a> | This part is visible only to one who is both ADMIN & DBA</label>
    </sec:authorize>
</div>
</html>