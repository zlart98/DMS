<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Spring Security Example </title>
</head>
<body>
<%--<div c:if="${param.error}">--%>
<%--    Invalid username and password.--%>
<%--</div>--%>
Login Page
<form action="/login" method="post">
    <div><label> User Name : <input type="text" name="username"/> </label></div>
    <div><label> Password: <input type="password" name="password"/> </label></div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <div><input type="submit" value="Sign In"/></div>
</form>
<a href="/registration">Registration</a>
</body>
</html>