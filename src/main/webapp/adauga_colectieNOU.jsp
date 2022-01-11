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
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
	type="text/css">
<link rel="stylesheet" href="style.css" type="text/css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    </head>
    <body>
    <nav class="navbar navbar-expand-lg bg-dark navbar-dark"
		style="box-shadow: 0px 0px 4px black;">
		<div class="container">
			<button class="navbar-toggler navbar-toggler-right border-0 p-0"
				type="button" data-toggle="collapse" data-target="#navbar8" style="">
				<p class="navbar-brand text-primary mb-0">
					<i class="fa d-inline fa-lg fa-stop-circle"></i> BRAND
				</p>
			</button>
			<div class="collapse navbar-collapse" id="navbar8">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="indexNOU.html">Home</a>
					</li>
				</ul>
				<p class="d-none d-md-block lead mb-0  text-white">
					<b>MUZIHUB</b>
				</p>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item mx-1"><a class="nav-link"
						href="https://github.com/andreea0306/jsp-project-pibd"> <i
							class="fa fa-github fa-fw fa-lg"></i>
					</a></li>
					<li class="nav-item mx-1"><a class="nav-link"
						href="https://gitlab.upb.ro/andreea.andrei"> <i
							class="fa fa-gitlab fa-fw fa-lg"></i>
					</a></li>
					<li class="nav-item mx-1"><a class="nav-link" href="#"> <i
							class="fa fa-bitbucket fa-fw fa-lg"></i>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
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
        <div id="add" align="center">
            <h1 style="color: #9999ff"> Adauga o noua colectie </h1>
            <form action="ColectieController" method="GET">
                <table style="color: #9999ff">
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
                    </table>
                   <div align="center">
                   <br>
                       <input class="btn btn-secondary" type="submit" name="adaugaColectie" value="Adauga">
					</div>
                
            </form>
        </div>
        <br>
		<div align="center">
		 <form action="ColectieController" method="POST">
           &nbsp; &nbsp;&nbsp; &nbsp;<input class="btn btn-secondary" type="submit" name="afiseazaColectie" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
		</div>
  
        <br>
    </body>
</html>
