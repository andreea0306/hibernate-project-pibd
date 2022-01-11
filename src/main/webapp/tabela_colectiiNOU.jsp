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
        <h1 align="center" style="color: #9999ff"> Tabela Colectie:</h1> 
        <table class="styled-table" border="1" align="center" style="color: #9999ff">
            <thead>
            <tr>
                <th><b>IdColectie:</b></th>
                <th><b>IdMuzician:</b></th>
                <th><b>Nume:</b></th>
                <th><b>Prenume:</b></th>
                <th><b>Data Nasterii:</b></th>
                <th><b>Trupa:</b></th>
                <th><b>IdStilmuzical:</b></th>
                <th><b>Nume Stil Muzical:</b></th>
                <th><b>Nume Colectie:</b></th>
                <th><b>An aparitie:</b></th>
            </tr>
            </thead>
            <tbody>
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
           </tbody>
        </table>
        <form action="ColectieController" method="POST">
        <br>
            <p align="center" style="color: #9999ff">
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
                Muzician:
                <select name="idmuzician">
                    <c:forEach items="${listaMuzicieni}" var="muzicieni">
                        <option value="${muzicieni.idmuzician}">${muzicieni.idmuzician}, ${muzicieni.nume}, ${muzicieni.prenume}, ${muzicieni.datanasterii}, ${muzicieni.trupa }</option>
                    </c:forEach>
                </select>
                <br><br>
                Stil Muzical:
                <select name="idstilmuzical">
                    <c:forEach items="${listaStilurimuzicale}" var="stilurimuzicale">
                        <option value="${stilurimuzicale.idstilmuzical}">${stilurimuzicale.idstilmuzical}, ${stilurimuzicale.stilmuzical}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica Numele Colectiei: <input id="name" type="text" name="name"><br><br>
                Modifica Anul Aparitiei Colectiei: <input id="anaparitie" type="text" name="anaparitie"> <br><br>
                <button class="btn btn-secondary" type="submit" id="modificaColectie" name="modificaColectie"> Modifica</button> <br> 
                <button class="btn btn-secondary" type="submit" id="stergeColectie" name="stergeColectie"> Sterge </button>
            </p>
        </form>
        <br>
  
    </body>
</html>
    