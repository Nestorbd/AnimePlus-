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
  %rest:POST
  %rest:path('/AnimePlus+/UpdateAnime')
  %rest:form-param("name","{$name}","(no name)")
  %output:method('html')
  %output:doctype-system('about:legacy-compat')
function page:FindName(
  $name as xs:string
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
<div>
<h1>Actualizar: </h1>
<br/>
<form action="/AnimePlus+/UpdateAnime2" method="POST">
NOMBRE:<input type="text" name="name" value='{$name}'/>
ID:<input type="number" name="id"/>
<br/>
<br/>
TIPO:<input type="text" name="type"/>
FECHA:<input type="date" name="vintage"/>
<br/>
<br/>
<button type="submit" class="btn btn-success">Actualizar</button>
</form>
<br/>
<br/>
<br/>
<table class="table">
<thead>
<tr>
<th>Nombre</th>
<th>Tipo</th>
<th>Fecha</th>
<th>ID</th>
</tr>
</thead>
<tbody>
{
  for $b in doc("AnimePlus+")//item
  where $b/name/text() = $name
  order by $b/vintage
  return
   <tr>
  <td>{$b/name/text()}</td> 
 <td>{$b/type/text()}</td>
  <td>{$b/vintage/text()}</td>
  <td>{$b/id/text()}</td>
  </tr>

}
</tbody>
</table>
</div>
</body>
</html>
};


(:~
 : Generates a welcome page.
 : @return HTML page
 :)
declare
  %rest:POST
  %rest:path('/AnimePlus+/UpdateAnime2')
  %rest:form-param("name","{$name}","(no name)")
      %rest:form-param("type","{$type}","(no type)")
        %rest:form-param("id","{$id}","(no id)")
          %rest:form-param("vintage","{$vintage}","(no vintage)")
updating function page:UpdateName(
  $name as xs:string,
   $type as xs:string,
   $id as xs:integer,
   $vintage as xs:date
  
)

{
  for $update in doc("AnimePlus+")//item
  where $update/id = $id and $update/name = $name
  return  replace node $update with
    <item>
        <id>{$id}</id>
        <type>{$type}</type>
        <name>{$name}</name>
        <precision>{$type}</precision>
        <vintage>{$vintage}</vintage>
    </item> ,
      update:output(web:redirect('/AnimePlus+'))
};