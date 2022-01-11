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
	
	<div id="add" align="center">
	<br><br>
		<h1 style="color: #9999ff">Adauga muzician</h1>
		<form action="MuzicieniController" method="GET">
			<table>
				<tr style="color: #9999ff">
					<td>Nume Muzician:</td>
					<td><input type="text" name="nume"></td>
				</tr>
				<tr style="color: #9999ff">
					<td>Prenume Muzician:</td>
					<td><input type="text" name="prenume"></td>
				</tr>
				<tr style="color: #9999ff">
					<td>Data Nasterii Muzician:</td>
					<td><input type="text" name="datanasterii"></td>
				</tr>
				<tr style="color: #9999ff">
					<td>Trupa:</td>
					<td><input type="text" name="trupa"></td>
				</tr>
			</table> <br>
			<div align="center">
				<input class="btn btn-secondary" type="submit" name="adaugaMuzicieni" value="Adauga">
			</div>
		</form>
		<br>
	</div>
	<div align="center">

		<form action="MuzicieniController" method="POST">
			&nbsp; &nbsp; &nbsp;<input class="btn btn-secondary" type="submit" name="afiseazaMuzicieni"
				value="Afiseaza"> &nbsp; &nbsp;<br>
		</form>
	</div>
	<br>

</body>
</html>
