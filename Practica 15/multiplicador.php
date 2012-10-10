<?php
//Multiplicador
$cant = $_GET["cuantas"];
$mult = $_GET["hasta"];
for($i=1;$i<=$cant;$i++)
{
	// Encabezado
	echo "<table border=1 cellspacing=0 width=200>";
	echo "<tr><th colspan=5> Tabla del $i </th></tr>";
	for($j=1;$j<=$mult;$j++)
		echo "<tr><td align=center>$i</td>
                <td align=center>x</td>
                <td align=center>$j</td>
                <td align=center>=</td>
                <td align=center> ", ($i*$j) ,"</td>
                </tr>";
	echo "</table> <br/>";
}
?>
