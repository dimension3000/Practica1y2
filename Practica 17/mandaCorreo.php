<?
$nombre=$_POST['nombre'];
$correo=$_POST['correo'];
$asunto=$_POST['asunto'];
$mensaje=$_POST['mensaje'];
$cuerpo= '
<html>
<head>
<style type="text/css">

#encabezado { 
background-color:#FFFFFF;
border:1px solid #999999;
margin:10px;
text-align:center;
}
#cuerpo {
background-color: #F4F4F4;
border:1px dotted #999999;
font: Arial, Helvetica, sans-serif;
color:#666666;
font-size:10pt;
width:600px;
}

</style>
</head>

<body>
<div id="encabezado">

<a href="http://www.proyectoWeb.com" target="_blank"></a><br />
</div>
<div id="cuerpo">
Correo de: $nombre<br/>
email: $correo<br/><br/>
mensaje: $mensaje<br/><br/>
El correo te ha llegado con exito.
</div>
</body>
</html>
';
$headers = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=iso-8859-1\r\n";
$headers .= "From: Mi sitio <erickofFUCHI@msn.com>\r\n";


if(mail('erickof_dp@msn.com',$asunto,$cuerpo,$headers))
 echo "Se mando";
else
 echo "No se mando";
?>
