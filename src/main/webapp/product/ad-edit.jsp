<%--
  Created by IntelliJ IDEA.
  User: UyLe
  Date: 12/6/2021
  Time: 11:32 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post">
    <label>
        <input type="text" name="name" placeholder="name">
        <input type="number" name="categoryId" placeholder="categoryId">
        <input type="text" name="description" placeholder="description">
        <input type="text" name="image" placeholder="image">
        <input type="number" name="sold" placeholder="sold">
    </label>
    <button  onclick="return confirm('Added')"
               > >Edit</button>
</form>
</body>
</html>
