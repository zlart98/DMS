<html xmlns="http://www.w3.org/1999/xhtml" xmlns:th="http://www.thymeleaf.org">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<head>
    <title>Spring Security Example </title>
</head>
<body>
<div c:if="${param.error}">
    Invalid username and password.
</div>
Add new User
<span style="color:red"><p><strong>${message}</strong></p></span>

<form action="/registration" method="post">
    <div><label> Имя : <input type="text" name="username"/> </label></div>
    <div><label> Пароль: <input type="password" name="password"/> </label></div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    <div><input type="submit" value="Войти"/></div>
</form>
</body>
</html>