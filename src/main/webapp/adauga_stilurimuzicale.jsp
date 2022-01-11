<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Stiluri Muzicale</title>
    </head>
    <body>

        <div id="add">
            <h1> Adauga stil muzical </h1>
            <form action="StiluriMuzicaleController" method="GET">
                <table>
                    <tr>
                        <td> Nume Stil Muzical: </td>
                        <td><input type="text" name="stilmuzical"></td>
                    </tr>
                    <tr>
                        <td><input type="submit" name="adaugaStilurimuzicale" value="Adauga"></td>

                    </tr>
                </table>
            </form>
        </div>

        <form action="StiluriMuzicaleController" method="POST">
            <input type="submit" name="afiseazaStilurimuzicale" value="Afiseaza"> &nbsp; &nbsp;<br>
        </form>
        <br>
        <a href="index.html"><b>Home</b></a>
    </body>
</html>
