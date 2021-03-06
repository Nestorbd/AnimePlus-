(:~
 : This module contains some basic examples for RESTXQ annotations.
 : @author BaseX Team
 :)
module namespace page = 'http://AnimePlus+.com';

(:~
 : Generates a welcome page.
 : @return HTML page
 :)
declare
  %rest:GET
  %rest:path('/AnimePlus+')
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:start(
) as element(html) {
  <html>
<head>
<title>AnimePlus+</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="icon" href="https://animeplus-f540c.firebaseapp.com/IMG/LOGO2.png" type="image/x-icon"/>
        <link rel="stylesheet" href="https://animeplus-f540c.firebaseapp.com/CSS/style.css"/>
</head>
<body>
 <div class="jumbotron jumbotron-fluid">
            <div class="container">
                <h1>
                    <img src="https://animeplus-f540c.firebaseapp.com/IMG/LOGO.png" class="rounded" alt="LOGO"/>
                </h1>
            </div>
        </div>
<div class="container">
<h1>Buscar:</h1>
<form action="/AnimePlus+/AnimeName" method="POST">
NOMBRE:<input type="text" name="name"/>
<button type="submit" class="btn btn-primary" >Buscar</button>
</form>
<br/>
<br/>
<br/>
</div>
<div class="container">
<h1>Añadir:</h1>
<form action="/AnimePlus+/CreateAnime" method="POST">
NOMBRE:<input type="text" name="name"/>
ID:<input type="number" name="id"/>
GID:<input type="number" name="gid"/>
<br/>
<br/>
TIPO:<input type="text" name="type"/>
FECHA:<input type="date" name="vintage"/>
<br/>
<br/>
<button type="submit" class="btn btn-warning">Añadir</button>
</form>
<br/>
<br/>
<br/>
</div>
<div class="container">
<h1>Actualizar:</h1>
<form action="/AnimePlus+/UpdateAnime" method="POST">
NOMBRE:<input type="text" name="name"/>
<button type="submit" class="btn btn-primary">Buscar</button>
</form>
<br/>
<br/>
<br/>
</div>
<div class="container">
<h1>Eliminar:</h1>
<form action="/AnimePlus+/DeleteAnime" method="POST">
NOMBRE:<input type="text" name="name"/>
<button type="submit" class="btn btn-primary">Buscar</button>
</form>
<br/>
<br/>
<br/>
</div>
<div class="container">
<table class="table">
<thead>
<tr>
<th>Nombre</th>
<th>Tipo</th>
<th>Fecha</th>
</tr>
</thead>
<tbody>
{
  for $b in doc("AnimePlus+")//item
  order by $b/name
  return <tr>
  <td>{$b/name/text()}</td> 
 <td>{$b/type/text()}</td>
  <td>{$b/vintage/text()}</td>
  </tr>

}
</tbody>
</table>
</div>
</body>
</html>
};