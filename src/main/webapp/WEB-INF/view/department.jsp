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
<jsp:include page="menu.jsp"></jsp:include>

<span style="color:red"><p><strong>${inputFormatException}</strong></p></span>
<sec:authorize access="hasRole('ADMIN')">
<div>

    <p class="font-weight-bold">Create department</p>

    <form class="form-inline" action="/department/saveOrUpdate" method="post" accept-charset="utf-8">
        <div class="form-group mx-sm-0.8 mb-2">
            <p><input type="text" name="name" placeholder="Name" class="form-control"></p>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <p><button type="submit" class="btn btn-primary mb-0.8">Create</button></p>
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
    <p class="font-weight-bold" style="width: 200px;">Department list</p>
</div>
<div>
<table class="table table-striped">
    <thead>
    <tr>
        <th scope="col">Name</th>
        <th scope="col">Number</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="department" items="${departmentList}">
        <tr>
            <td><p><a href="/department/enterTheDepartment/${department.idDepartment}/">${department.departmentName}</a><p></td>
            <td><p><c:out value="${department.idDepartment}"></c:out><p></td>
            <sec:authorize access="hasRole('ADMIN')">
                <td><p><a href="/department/removeDepartment?idDepartment=${department.idDepartment}">Удаление отдела</a><p></td>
                <td><form action="/department/removeDepartment?idDepartment=${department.idDepartment}" method="post" accept-charset="utf-8">
                    <button class="btn btn-primary" type="submit">Remove</button>
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                </form></td>

                <td>
                    <form class="form-inline" action="/department/saveOrUpdate?idDepartment=${department.idDepartment}"
                          method="post" accept-charset="utf-8">
                        <div class="form-row align-items-center">
                            <div class="col-auto">
                                <input type="text" name="name" placeholder="Name" class="form-control"/>
                            </div>
                            <div class="col-auto">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"
                            </div>
                        </div>
                        <div class="col-auto">
                <button type="submit" class="btn btn-primary mb-0.8">Edit</button>
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
