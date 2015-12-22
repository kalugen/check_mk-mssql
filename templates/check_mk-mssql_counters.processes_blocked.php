<?php

setlocale(LC_ALL, "POSIX");

$opt[1] = "--vertical-label \"Used %\" -l 0 -u 100 --title \"$servicedesc usage\" ";

$def[1]  = "DEF:used=$RRDFILE[1]:$DS[1]:MAX ";
$def[1] .= "AREA:used#2080ff:\"Usage\:\" ";
$def[1] .= "GPRINT:used:LAST:\"%.2lf%%\" ";
$def[1] .= "LINE1:used#000080:\"\" ";
$def[1] .= "GPRINT:used:MAX:\"(Max\: %.2lf%%,\" ";
$def[1] .= "GPRINT:used:AVERAGE:\"Avg\: %.2lf%%)\" ";
if ($WARN[1] != "") {
    $def[1] .= "HRULE:$WARN[1]#FFFF00:\"Warning\: $WARN[1]%\" ";
    $def[1] .= "HRULE:$CRIT[1]#FF0000:\"Critical\: $CRIT[1]%\" ";
}

?>
