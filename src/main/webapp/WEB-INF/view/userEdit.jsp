<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>

<html>
<head>
    <link href="<c:url value="/css/style.css" />" rel="stylesheet">
    <title>UserList</title>
</head>

<body>
<jsp:include page="menuIsLogin.jsp"></jsp:include>


<p class="font-weight-bold">Редактирование записи ${userEdit.username}
    <div>
        <form class="form-inline" action="/user" method="post" accept-charset="utf-8">
            <div class="form-row align-items-center">
            <br>
<p><input type="text" value="${userEdit.username}" name="username">
<div class="col-auto">
    <select class="dropdown-item" name="Role">
        <option value="ADMIN">ADMIN</option>
        <option value="USER">USER</option>
    </select>
</div>
<input type="hidden" value="${userEdit.idUser}" name="userId">
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
<br>
<p>
    <button type="submit" class="btn btn-primary mb-0.8">Сохранить</button>

    </form>
    <span style="color:red"><p><strong>${inputFormatException}</strong></p></span>
<div>
    </div>
</body>
</html>
