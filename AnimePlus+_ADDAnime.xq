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
  %rest:path('/AnimePlus+/CreateAnime')
  %rest:form-param("name","{$name}","(no name)")
    %rest:form-param("gid","{$gid}","(no gid)")
      %rest:form-param("type","{$type}","(no type)")
        %rest:form-param("id","{$id}","(no id)")
          %rest:form-param("vintage","{$vintage}","(no vintage)")
updating function page:CreateName(
  $name as xs:string,
   $type as xs:string,
   $id as xs:integer,
   $gid as xs:integer,
   $vintage as xs:date
  
)

{
  for $add in doc("AnimePlus+")//report
  return  insert node 
   <item>
        <id>{$id}</id>
        <gid>{$gid}</gid>
        <type>{$type}</type>
        <name>{$name}</name>
        <precision>{$type}</precision>
        <vintage>{$vintage}</vintage>
    </item>
    as first into $add ,
      update:output(web:redirect('/AnimePlus+'))
};
