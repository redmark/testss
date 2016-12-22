<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>Login page</title>
</head>

<body>

<c:if test="${param.error != null}">
    Invalid username and password.
</c:if>
<c:if test="${param.logout != null}">
    You have been logged out successfully.
</c:if>

<c:url var="loginUrl" value="/login"/>
<form action="${loginUrl}" method="post">
    <table>
        <tr>
            <td><label for="username">username</label></td>
            <td><input type="text" id="username" name="username" placeholder="Enter Username" required>
            </td>
        </tr>
        <tr>
            <td><label for="password">password</label></td>
            <td><input type="password" id="password" name="password" placeholder="Enter Password" required></td>
        </tr>
        <tr>
            <td>rememberme</td>
            <td><input type="checkbox" id="rememberme" name="remember-me"></td>
        </tr>
        <tr>
            <td>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
            </td>
            <td>
                <input type="submit" value="Log in">
            </td>
        </tr>
    </table>


</form>
</body>
</html>
