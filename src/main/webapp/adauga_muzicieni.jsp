<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Muzicieni</title>
    </head>
    <body>

        <div id="add">
            <h1> Adauga muzician </h1>
            <form action="MuzicieniController" method="GET">
                <table>
                    <tr>
                        <td> Nume Muzician: </td>
                        <td><input type="text" name="nume"></td>
                    </tr>
                    <tr>
                        <td> Prenume Muzician: </td>
                        <td><input type="text" name="prenume"></td>
                    </tr>
                    <tr>
                        <td> Data Nasterii Muzician: </td>
                        <td><input type="text" name="datanasterii"></td>
                    </tr>
                    <tr>
                        <td> Trupa: </td>
                        <td><input type="text" name="trupa"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="adaugaMuzicieni" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

        <form action="MuzicieniController" method="POST">
            <input type="submit" name="afiseazaMuzicieni" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
        <a href="index.html"><b>Home</b></a>
    </body>
</html>
