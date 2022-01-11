<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stiluri Muzicale</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeStilmuzical").hide();
                $("#modificaStilurimuzicale").hide();

                $("#update").click(function () {
                    $("#modificaStilurimuzicale").show();
                    $("#stergeStilmuzical").hide();
                });
                $("#delete").click(function () {
                    $("#stergeStilmuzical").show();
                    $("#modificaStilurimuzicale").hide();
                });
            });
        </script>

    </head>
    <body>
        <h1 align="center"> Tabela Stiluri Muzicale:</h1> 
        <table border="1" align="center">
            <tr>
                <td><b>IdStilMuzical:</b></td>
                <td><b>StilMuzical:</b></td>
            </tr>
            <c:forEach var="stilurimuzicale" items="${listastilurimuzicale}">
                <tr>
                    <td>${stilurimuzicale.idstilmuzical}</td>
                    <td>${stilurimuzicale.stilmuzical}</td>
                </tr>
            </c:forEach>
        </table>
        <form action="StiluriMuzicaleController" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('stilmuzical').disabled = this.checked;"><br><br>
                <select name="idstilmuzical">
                    <c:forEach items="${listastilurimuzicale}" var="stilurimuzicale">
                        <option value="${stilurimuzicale.idstilmuzical}">${stilurimuzicale.idstilmuzical}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica Stil Muzical: <input id="stilmuzical" type="text" name="stilmuzical"><br><br>
                <button type="submit" id=modificaStilurimuzicale name="modificaStilurimuzicale"> Modifica</button> <br> <br>
                <button type="submit" id="stergeStilmuzical" name="stergeStilmuzical"> Sterge </button>
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
