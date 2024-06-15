<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isELIgnored="false" %>

<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title><c:out value="${page }" /></title> <!-- Corrected the usage of c:out tag -->

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-3">
    <h1 class="text-center">Welcome to ToDO Manager</h1>
    <c:if test="${not empty msg}">
        <div class="alert alert-success">
            <b><c:out value="${msg}" /></b>
        </div>
    </c:if>

    <div class="row mt-5">
        <div class="col-md-2">
            <div class="list-group">
                <button type="button" class="list-group-item list-group-item-action active" aria-current="true">
                    Menu
                </button>
                <a href='<c:url value="/add" />' class="list-group-item list-group-item-action">Add ToDo</a>
                <a href='<c:url value="/home" />' class="list-group-item list-group-item-action">View ToDo</a>
            </div>
        </div>
        <div class="col-md-10">
            <c:if test="${page eq 'home'}">
                <h1>All TODOS</h1>
                <c:forEach items="${todos}" var="t">
                    <div class="card">
                        <div class="card-body">
                            <h3><c:out value="${t.todoTitle}" /></h3>
                            <p><c:out value="${t.todoContent}" /></p>
                        </div>
                    </div>
                </c:forEach>
            </c:if>

            <c:if test="${page eq 'add'}">
                <h1 class="text-center">Add TODO</h1>
                <br>
                <form:form action="saveTodo" method="post" modelAttribute="todo">
                    <div class="form-group">
                        <form:input path="todoTitle" cssClass="form-control" placeholder="Enter your todo" />
                    </div>
                    <div class="form-group">
                        <form:textarea path="todoContent" cssClass="form-control" placeholder="Enter your todo content" cssStyle="height:300px;" />
                    </div>
                    <div class="container text-center">
                        <button class="btn btn-outline-success">Add ToDo</button>
                    </div>
                </form:form>
            </c:if>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>
