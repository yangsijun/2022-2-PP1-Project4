<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
          integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>

<h1>Add New Post</h1>
<form action="addmember.jsp" method="post" enctype="multipart/form-data">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name"/></td>
        </tr>
        <tr>
            <td>Member Level:</td>
            <td>
                <input type="radio" id="bronze" name="memberLevel" value="1"/>Bronze
                <input type="radio" id="silver" name="memberLevel" value="2"/>Silver
                <input type="radio" id="gold" name="memberLevel" value="3"/>Gold
                <input type="radio" id="platinum" name="memberLevel" value="4"/>Platinum
            </td>
        </tr>
        <tr>
            <td>ID:</td>
            <td><input type="text" name="id"/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="text" name="password"/></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email"/></td>
        </tr>
        <tr>
            <td>Phone Number:</td>
            <td><input type="text" name="phoneNumber"/></td>
        </tr>
        <tr>
            <td>Image:</td>
            <td><input type="file" name="photo"/></td>
        </tr>
        <tr>
            <td><a href="list.jsp" class="btn btn-warning">View All Records</a></td>
            <td><input type="submit" value="Add Post" class="btn btn-primary"/></td>
        </tr>
    </table>
</form>

</body>
</html>