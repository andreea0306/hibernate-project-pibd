<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muzicieni</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeMuzicieni").hide();
                $("#modificaMuzicieni").hide();

                $("#update").click(function () {
                    $("#modificaMuzicieni").show();
                    $("#stergeMuzicieni").hide();
                });
                $("#delete").click(function () {
                    $("#stergeMuzicieni").show();
                    $("#modificaMuzicieni").hide();
                });
            });
        </script>

    </head>
    <body>
        <h1 align="center"> Tabela muzicieni:</h1> 
        <table border="1" align="center">
            <tr>
                <td><b>IDmuzician:</b></td>
                <td><b>Nume:</b></td>
                <td><b>Prenume:</b></td>
                <td><b>Data Nasterii:</b></td>
                <td><b>Trupa:</b></td>
            </tr>
            <c:forEach var="muzicieni" items="${listaMuzicieni}">
                <tr>
                    <td>${muzicieni.idmuzician}</td>
                    <td>${muzicieni.nume}</td>
                    <td>${muzicieni.prenume}</td>
                    <td>${muzicieni.datanasterii}</td>
                    <td>${muzicieni.trupa}</td>

                </tr>
            </c:forEach>
        </table>
        <form action="MuzicieniController" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('nume').disabled = this.checked;
                        document.getElementById('prenume').disabled = this.checked;
                        document.getElementById('datanasterii').disabled = this.checked;
                        document.getElementById('trupa').disabled = this.checked;"><br><br>
                <select name="idmuzician">
                    <c:forEach items="${listaMuzicieni}" var="muzicieni">
                        <option value="${muzicieni.idmuzician}">${muzicieni.idmuzician}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica Nume: <input id="nume" type="text" name="nume"><br><br>
                Modifica Prenume: <input id="prenume" type="text" name="prenume"> <br><br>
                Modifica Data Nasterii: <input id="datanasterii" type="text" name="datanasterii"> <br><br>
                Modifica Trupa: <input id="trupa" type="text" name="trupa"> <br><br>
                <button type="submit" id="modificaMuzicieni" name="modificaMuzicieni"> Modifica</button> <br> <br>
                <button type="submit" id="stergeMuzicieni" name="stergeMuzicieni"> Sterge </button>
            </p>
        </form>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
