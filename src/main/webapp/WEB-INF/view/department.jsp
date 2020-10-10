<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags"%>

<html>
<head>
    <link href="<c:url value="/css/style.css" />" rel="stylesheet">
    <title>Department</title>
</head>

<body>
<jsp:include page="menuIsLogin.jsp"></jsp:include>

<span style="color:red"><p><strong>${inputFormatException}</strong></p></span>
<sec:authorize access="hasRole('ADMIN')">
<div>

    <p class="font-weight-bold">Создание раздела «Департамент»</p>

    <form class="form-inline" action="/department/saveOrUpdate" method="post" accept-charset="utf-8">
        <div class="form-group mx-sm-0.8 mb-2">
            <p><input type="text" name="departmentName" placeholder="Название" class="form-control"></p>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <p><button type="submit" class="btn btn-primary mb-0.8">Создать</button></p>
        </div>
    </form>

<%--    <form action="/department/saveOrUpdate" method="post" accept-charset="utf-8">--%>
<%--        <input type="text" name="name" placeholder="Название отдела" />--%>
<%--        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />--%>
<%--        <button type="submit">Создать</button>--%>
<%--    </form>--%>
</div>
</sec:authorize>
<div>
    <p class="font-weight-bold" style="width: 200px;">Департаменты</p>
</div>
<div>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Название</th>
        <th scope="col">Номер</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="department" items="${departmentList}">
        <tr>
            <td><p><a href="/department/enterTheDepartment/${department.idDepartment}/department.jsp">${department.departmentName}</a><p></td>
            <td><p><c:out value="${department.idDepartment}"></c:out><p></td>
            <sec:authorize access="hasRole('ADMIN')">
<%--                <td><p><a href="/department/removeDepartment?idDepartment=${department.idDepartment}">Удаление отдела</a><p></td>--%>
                <td><form action="/department/removeDepartment?idDepartment=${department.idDepartment}" method="post" accept-charset="utf-8">
                    <button class="btn btn-primary" type="submit">Удалить</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form></td>

                <td>
                    <form class="form-inline" action="/department/editDepartment/${department.idDepartment}"
                          method="get" accept-charset="utf-8">
                        <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-0.8">Редактировать</button>
                        </div>
                </form></td>
            </sec:authorize>
        </tr>
    </c:forEach>
    </tbody>
</table>
</div>
</body>
</html>
