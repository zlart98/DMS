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
<div>
    <p class="font-weight-bold">Список пользователей</p>
</div>

<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Имя</th>
        <th scope="col">Роль</th>
        <th></th>
    </tr>
    </thead>
    <tbody>
    <div>
        <div>
            <p><strong>Создание новой учентой записи</strong></p>
        </div>
        <div>
            <form class="form-inline" action="/user/newUser" method="post" accept-charset="utf-8">
                <div class="form-row align-items-center">
                    <div class="col-auto">
                        <p><input type="text" name="username" placeholder="Логин" class="form-control"/></p>
                        <span style="color:red"><p><strong>${inputFormatException}</strong></p></span>
                    </div>
                    <div class="col-auto">
                        <p><input type="password" name="password" placeholder="Пароль" class="form-control"/></p>
                    </div>
                    <div class="col-auto">
                        <select class="dropdown-item" name="Role">
                            <option value="ADMIN">ADMIN</option>
                            <option value="USER">USER</option>
                        </select>
                    </div>
                    <div class="col-auto">
                        <p>
                            <button type="submit" class="btn btn-primary">Создать</button>
                        </p>
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                    </div>
                </div>
            </form>
        </div>
    </div>

    <c:forEach var="users" items="${userList}">
        <tr>
            <td><p>${users.username}<p></td>

            <td><c:forEach items="${users.roles}" var="roles">
                <c:out value="${roles}"/>
            </c:forEach></td>
            <td><p><a href="/user/${users.idUser}">Редактировать</a>
                <p></td>
            <td><p><a href="/user/remove/${users.idUser}">Удалить</a>
                <p></td>
        </tr>
    </c:forEach>
    </tbody>
</table>

</body>
</html>
