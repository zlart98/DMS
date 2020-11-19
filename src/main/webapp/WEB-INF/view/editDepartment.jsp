
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags"%>
<html>
<head>
    <link href="<c:url value="/css/style.css" />" rel="stylesheet">
    <title>department</title>
</head>
<body>
<jsp:include page="menuIsLogin.jsp"></jsp:include>

<div>
    <p><strong>Список работников в департаменте</strong></p> <div>
    <input type="hidden" name="myhiddenvalue" value="<%= request.getParameter("idDepartment") %>" />
    <table class="table table-striped">
        <thead>
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Должность</th>
            <th scope="col">Рабочее место</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="worker" items="${workersFromDepartment}">
            <tr>
                <td>${worker.name}</td>
                <td>${worker.position}</td>
                <td>${worker.workposition}</td>
                <sec:authorize access="hasRole('ADMIN')">
<%--                    <td><p><a href="removeWorkerFromDepartment?idWorker=${worker.idWorker}">Удалить работника</a><p></td>--%>
                    <td><form action="/department/enterTheDepartment/${department.idDepartment}/removeWorkerFromDepartment?idWorker=${worker.idWorker}" method="post" accept-charset="utf-8">
                        <button class="btn btn-primary" type="submit">Удалить</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form></td>
                </sec:authorize>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
    <table class="table table-striped">
        <p><strong>Рабочие без департамента</strong></p>
        <tr>
            <th scope="col">Имя</th>
            <th scope="col">Должность</th>
            <th scope="col">Рабочее место</th>
        </tr>
        <c:forEach var="worker" items="${workersWithoutDepartment}">
            <tr>
                <td>${worker.name}</td>
                <td>${worker.position}</td>
                <td>${worker.workposition}</td>
                <sec:authorize access="hasRole('ADMIN')">
<%--                <td><p><a href="addWorkerInDepartment?idWorker=${worker.idWorker}">Добавить</a><p></td>--%>
                    <td><form action="/department/enterTheDepartment/${department.idDepartment}/addWorkerInDepartment?idWorker=${worker.idWorker}" method="post" accept-charset="utf-8">
                        <button class="btn btn-primary" type="submit">Добавить</button>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                    </form></td>
                </sec:authorize>
            </tr>
        </c:forEach>
    </table>
    </fieldset>
</div>
</body>
</html>
