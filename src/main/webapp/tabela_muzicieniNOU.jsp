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
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#stergeMuzicieni").hide();
		$("#modificaMuzicieni").hide();

		$("#update").click(function() {
			$("#modificaMuzicieni").show();
			$("#stergeMuzicieni").hide();
		});
		$("#delete").click(function() {
			$("#stergeMuzicieni").show();
			$("#modificaMuzicieni").hide();
		});
	});
</script>
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
	
	<h1 align="center" style="color: #9999ff"> Tabela muzicieni:</h1> 
        <table class="styled-table" border="1" align="center">
        	<thead>
            <tr style="color: #9999ff">
                <th><b >IDmuzician:</b></th>
                <th><b>Nume:</b></th>
                <th><b>Prenume:</b></th>
                <th><b>Data Nasterii:</b></th>
                <th><b>Trupa:</b></th>
            </tr>
            <c:forEach var="muzicieni" items="${listaMuzicieni}">
                <tr style="color: #9999ff">
                    <td>${muzicieni.idmuzician}</td>
                    <td>${muzicieni.nume}</td>
                    <td>${muzicieni.prenume}</td>
                    <td>${muzicieni.datanasterii}</td>
                    <td>${muzicieni.trupa}</td>

                </tr>
            </c:forEach>
             </thead>
        </table>
        <form action="MuzicieniController" method="POST">
            <p align="center" style="color:#9999ff">
            <br>
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
                <b style="color: #9999ff">Modifica Nume: <input id="nume" type="text" name="nume"></b><br><br>
                <b style="color: #9999ff">Modifica Prenume: <input id="prenume" type="text" name="prenume"></b> <br><br>
                <b style="color: #9999ff">Modifica Data Nasterii: <input id="datanasterii" type="text" name="datanasterii"></b> <br><br>
                <b style="color: #9999ff">Modifica Trupa: <input id="trupa" type="text" name="trupa"> </b><br><br>
                <button class="btn btn-secondary" type="submit" id="modificaMuzicieni" name="modificaMuzicieni"> Modifica</button> <br> <br>
                <button class = "btn btn-secondary" type="submit" id="stergeMuzicieni" name="stergeMuzicieni"> Sterge </button>
            </p>
        </form>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>