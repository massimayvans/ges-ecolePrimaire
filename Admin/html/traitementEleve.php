<?php
require_once 'connexion.php'; // On inclu la connexion à la bdd

if (isset($_POST['valider'])) {

    $matricule = addslashes(htmlspecialchars($_POST['txtmatricule']));
    $nom = addslashes(htmlspecialchars($_POST['txtnom']));
    $prenom = addslashes(htmlspecialchars($_POST['txtprenom']));
    $sexe = addslashes(htmlspecialchars($_POST['txtsexe']));
    $datenaisse = addslashes(htmlspecialchars($_POST['txtdatenaiss']));
    $lieunaiss = addslashes(htmlspecialchars($_POST['txtlieu']));

    // traitement de l'image de l'eleve
    $image = $_FILES['txtphoto'];
    $image_nom = $image['name'];
    $image_type = $image['type'];
    $image_taille = $image['size'];
    $image_tmp = $image['tmp_name'];

    // Vérification du format de l'image (exemple : vérification pour les formats JPG, PNG)
    $extensions_valides = array('jpg', 'jpeg', 'png');
    $extension_upload = strtolower(pathinfo($image_nom, PATHINFO_EXTENSION));

    if (!in_array($extension_upload, $extensions_valides)) {
        echo " <script type=\"text/javascript\">
                 alert(\"Format d'image non valide. Veuillez utiliser un fichier JPG ou PNG.\");
               </script>";
        echo '<meta http-equiv="refresh" content="1;url=formEleve.php" />';
        exit; // Arrêter le script
    }

    // Vérification de la taille de l'image (exemple : 2 Mo)
    $taille_max = 2 * 1024 * 1024; // 2 Mo
    if ($image_taille > $taille_max) {
        echo "<script type=\"text/javascript\">
                alert(\"La taille de l'image dépasse la limite autorisée (2 Mo).\");
            </script>";
        echo '<meta http-equiv="refresh" content="1;url=formEleve.php" />';
        exit; // Arrêter le script
    }

    $cheminacces = "images/" . $image_nom;
    move_uploaded_file($image_tmp, $cheminacces);

    $adresse = addslashes(htmlspecialchars($_POST['txtadresse']));
    $nomtuteur = addslashes(htmlspecialchars($_POST['txtnomtuteur']));
    $prenomtuteur = addslashes(htmlspecialchars($_POST['txtprenomtuteur']));
    $teltuteur = addslashes(htmlspecialchars($_POST['txttelephonetuteur']));


    $requete_Ajout = "INSERT INTO eleve(MATRICULE, NOM, PRENOM, SEXE, DATE_DE_NAISSANCE, LIEU_DE_NAISSANCE,PHOTO,ADRESSE,NOM_TUTEUR,PRENOM_TUTEUR,TEL_TUTEUR)
        VALUES('$matricule','$nom','$prenom','$sexe','$datenaisse','$lieunaiss','$cheminacces','$adresse','$nomtuteur','$prenomtuteur','$teltuteur')";

    $resultat = mysqli_query($congestschool, $requete_Ajout);


    if ($resultat) {
        echo "<script type=\"text/javascript\">

         alert (\"Enregistrement effectuer avec Succès!\");

    </script> ";
        echo '<meta http-equiv="refresh" content="1;url=formEleve.php" />';
    } else {
        echo "<script type=\"text/javascript\">

            alert (\"Enregistrement non effectuer !\");

            </script> ";
        echo '<meta http-equiv="refresh" content="1;url=formEleve.php" />';
    }
}
