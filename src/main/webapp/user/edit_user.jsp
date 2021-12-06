<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/5/2021
  Time: 2:56 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>User Management Application</title>
</head>
<body>
<center>
    <h1>User Management</h1>
    <h2>
        <a href="/users">List All Users</a>
    </h2>
</center>
<div align="center">
    <form method="post">
        <table border="1" cellpadding="5">
            <caption>
                <h2>
                    Edit User
                </h2>
            </caption>
            <c:if test="${user != null}">
                <input type="hidden" name="id" value="<c:out value='${user.id}' />"/>
            </c:if>
            <tr>
                <th>User Name:</th>
                <td>
                    <input type="text" name="name" size="45"
                           value="<c:out value='${user.name}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>User Email:</th>
                <td>
                    <input type="text" name="email" size="45"
                           value="<c:out value='${user.email}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Password:</th>
                <td>
                    <input type="password" name="password" size="15"
                           value="<c:out value='${user.password}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Role:</th>
                <td>
                    <input type="text" name="role" size="15"
                           value="<c:out value='${user.role}' />"
                    />
                </td>
            </tr>
            <tr>
                <th>Avatar:</th>
                <td>
                    <input type="text" name="image" size="15"
                           value="<c:out value='${user.image}' />"
                    />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" value="Save"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
</body>
</html>
