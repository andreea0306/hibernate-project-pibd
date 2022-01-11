<%@page import="DAOImpl.MuzicieniDaoImpl"%>
<%@page import="DAOImpl.StiluriMuzicaleDaoImpl"%>
<%@page import="pojo.Muzicieni"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pojo.StiluriMuzicale"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Colectii</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#stergeColectie").hide();
                $("#modificaColectie").hide();

                $("#update").click(function () {
                    $("#modificaColectie").show();
                    $("#stergeColectie").hide();
                });
                $("#delete").click(function () {
                    $("#stergeColectie").show();
                    $("#modificaColectie").hide();
                });
            });
        </script>

    </head>
    <body>
        <%
            MuzicieniDaoImpl muzicianDaoImpl = new MuzicieniDaoImpl();
            StiluriMuzicaleDaoImpl stilmuzicalDaoImpl = new StiluriMuzicaleDaoImpl();
            List<Muzicieni> listaMuzicieni = new ArrayList();
            listaMuzicieni = muzicianDaoImpl.afiseazaMuzicieni();
            List<StiluriMuzicale> listaStilurimuzicale = new ArrayList();
            listaStilurimuzicale = stilmuzicalDaoImpl.afiseazaStilurimuzicale();
            request.setAttribute("listaMuzicieni", listaMuzicieni);
            request.setAttribute("listaStilurimuzicale", listaStilurimuzicale);
        %>
        <h1 align="center"> Tabela Colectie:</h1> 
        <table border="1" align="center">
            <tr>
                <td><b>IdColectie:</b></td>
                <td><b>IdMuzician:</b></td>
                <td><b>Nume:</b></td>
                <td><b>Prenume:</b></td>
                <td><b>Data Nasterii:</b></td>
                <td><b>Trupa:</b></td>
                <td><b>IdStilmuzical:</b></td>
                <td><b>Nume Stil Muzical:</b></td>
                <td><b>Nume Colectie:</b></td>
                <td><b>An aparitie:</b></td>
            </tr>
            <c:forEach var="colectii" items="${listaColectie}">
                <tr>
                    <td>${colectii.idcolectie}</td>
                    <td>${colectii.muzicieni.idmuzician}</td>
                    <td>${colectii.muzicieni.nume}</td>
                    <td>${colectii.muzicieni.prenume}</td>
                    <td>${colectii.muzicieni.datanasterii}</td>
                    <td>${colectii.muzicieni.trupa}</td>
                    <td>${colectii.stilurimuzicale.idstilmuzical}</td>
                    <td>${colectii.stilurimuzicale.stilmuzical}</td>
                    <td>${colectii.name}</td>
                    <td>${colectii.anaparitie}</td>
                </tr>
            </c:forEach>
        </table>
        <form action="ColectieController" method="POST">
            <p align="center">
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('idmuzician').disabled = this.checked;
                        document.getElementById('idstilmuzical').disabled = this.checked;
                        document.getElementById('name').disabled = this.checked;
                        document.getElementById('anaparitie').disabled = this.checked;"><br><br>
                idcolectie:
                <select name="idcolectie">
                    <c:forEach items="${listaColectie}" var="colectii">
                        <option value="${colectii.idcolectie}">${colectii.idcolectie}</option>
                    </c:forEach>
                </select>
                <br><br>
                idmuzician:
                <select name="idmuzician">
                    <c:forEach items="${listaMuzicieni}" var="muzicieni">
                        <option value="${muzicieni.idmuzician}">${muzicieni.idmuzician}, ${muzicieni.nume}, ${muzicieni.prenume}, ${muzicieni.datanasterii}, ${muzicieni.trupa }</option>
                    </c:forEach>
                </select>
                <br><br>
                idstilmuzical:
                <select name="idstilmuzical">
                    <c:forEach items="${listaStilurimuzicale}" var="stilurimuzicale">
                        <option value="${stilurimuzicale.idstilmuzical}">${stilurimuzicale.idstilmuzical}, ${stilurimuzicale.stilmuzical}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica Numele Colectiei: <input id="name" type="text" name="name"><br><br>
                Modifica Anul Aparitiei Colectiei: <input id="anaparitie" type="text" name="anaparitie"> <br><br>
                <button type="submit" id="modificaColectie" name="modificaColectie"> Modifica</button> <br> <br>
                <button type="submit" id="stergeColectie" name="stergeColectie"> Sterge </button>
            </p>
        </form>
        <br>
        <p align="center">
            <a href="index.html"><b>Home</b></a>
        </p>
    </body>
</html>
