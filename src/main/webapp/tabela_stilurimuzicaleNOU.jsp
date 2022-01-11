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
	 <h1 align="center" style="color: #9999ff"> Tabela Stiluri Muzicale:</h1> 
	 <br>
        <table border="1" align="center" style="color: #9999ff">
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
            <p align="center" style="color: #9999ff">
            <br>
                Modifica: <input type="checkbox" id="update"> Sterge: <input type="checkbox" id="delete" onclick="document.getElementById('stilmuzical').disabled = this.checked;"><br><br>
                <select name="idstilmuzical">
                    <c:forEach items="${listastilurimuzicale}" var="stilurimuzicale">
                        <option value="${stilurimuzicale.idstilmuzical}">${stilurimuzicale.idstilmuzical}</option>
                    </c:forEach>
                </select>
                <br><br>
                Modifica Stil Muzical: <input id="stilmuzical" type="text" name="stilmuzical"><br><br>
                <button class="btn btn-secondary" type="submit" id=modificaStilurimuzicale name="modificaStilurimuzicale"> Modifica</button> <br> <br>
                <button class="btn btn-secondary" type="submit" id="stergeStilmuzical" name="stergeStilmuzical"> Sterge </button>
            </p>
        </form>
        
        </body>
        </html>
	