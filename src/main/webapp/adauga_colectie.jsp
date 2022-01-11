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
        <title>Colectie</title>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <div id="add">
            <h1> Adauga o noua colectie </h1>
            <form action="ColectieController" method="GET">
                <table>
                    <tr>
                        <td> Muzician: </td>
                        <td>
                            <select name="idmuzician">
                                <c:forEach items="${listaMuzicieni}" var="muzicieni">
                                    <option value="${muzicieni.idmuzician}">${muzicieni.idmuzician}, ${muzicieni.nume}, ${muzicieni.prenume}, ${muzicieni.datanasterii}, ${muzicieni.trupa} </option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Stil Muzical: </td>
                        <td>
                            <select name="idstilmuzical">
                                <c:forEach items="${listaStilurimuzicale}" var="stilurimuzicale">
                                    <option value="${stilurimuzicale.idstilmuzical}">${stilurimuzicale.idstilmuzical}, ${stilurimuzicale.stilmuzical}</option>
                                </c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td> Nume Colectie: </td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td> An Aparitie Colectie: </td>
                        <td><input type="text" name="anaparitie"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="adaugaColectie" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

        <form action="ColectieController" method="POST">
            <input type="submit" name="afiseazaColectie" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
        <a href="index.html"><b>Home</b></a>
    </body>
</html>
