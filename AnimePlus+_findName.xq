(:~
 : This module contains some basic examples for RESTXQ annotations.
 : @author BaseX Team
 :)
module namespace page = 'http://pruebas.com';

(:~
 : Generates a welcome page.
 : @return HTML page
 :)
declare
  %rest:POST
  %rest:path(
  '/AnimePlus+/AnimeName'
)
  %rest:form-param(
  "name","{
    $name
  }","(
    no name
  )"
)
  %output:method(
  'html'
)
  %output:doctype-system(
  'about:legacy-compat'
)
function page:FindName(
  $name as xs:string
) as element(
  html
) {
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
</head>
<body>
<div>
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
  for $b in doc(
      "AnimePlus+"
    )//item
   where $b/name/text() = $name and $b/type/text() = "TV" 
  order by $b/vintage
  return
   <tr>
  <td>{
      $b/name/text()
    }</td> 
 <td>{
      $b/type/text()
    }</td>
  <td>{
      $b/vintage/text()
    }</td>
  </tr>

}
</tbody>
</table>
</div>
</body>
</html>
};