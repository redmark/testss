<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>DBA page</title>
</head>
<body>
Dear <strong>${user}</strong>, Welcome to DBA Page.

<c:url var="logout" value="/logout" />
<form action="${logout}" method="post" >
    <input type="submit" value="logout">
    <input type="hidden" name="${_csrf.parameterName}"   value="${_csrf.token}" />
</form>

</body>
</html>