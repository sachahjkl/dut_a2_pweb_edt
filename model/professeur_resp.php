<?php

function getCreneauxGestion()
{
	$sql="SELECT C.tDeb, C.tFin,P.label as pLabel, P.couleur, M.label as mLabel, S.label as sLabel, S.type_salle as sType, G.num_grpe
            FROM creneau C, prof P, matiere M, salle S, groupe G
            WHERE C.id_edth = :idEDTH AND C.id_grpe = G.id_grpe AND P.id_prof=:idProf
            AND C.id_mat = M.id_mat AND C.id_prof = P.id_prof AND C.id_salle = S.id_salle
            ORDER BY C.tDeb ASC"
}
