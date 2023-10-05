<?php
date_default_timezone_set('Europe/Amsterdam');

ini_set('display_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    // Controleer of het verzoek een POST-verzoek is

    if (empty($_POST['name']) || empty($_POST['email']) || empty($_POST['nieuwsbrief'])) {
        echo "Niet alle vereiste velden zijn ingevuld";
    } else {
        $inputName = $_POST['name'];
        $inputEmail = $_POST['email'];
        $selectedNieuwsbrief = $_POST['nieuwsbrief']; // Geselecteerde nieuwsbrief

        // Bepaal het nieuwsbrief-ID op basis van de geselecteerde nieuwsbrief
        $newsId = ($selectedNieuwsbrief === 'nieuwsbrief1') ? 1 : 2;

        // Maak een databaseverbinding
        $con = new mysqli('mariadb', 'exampleuser', 'examplepass', 'nieuwsbrief', 3306);
        if ($con->connect_error) {
            die("Connectie mislukt: " . $con->connect_error);
        }

        // SQL-query om gegevens in te voegen in de 'users'-tabel
        $insertUserSQL = "INSERT INTO users (name, email, date, active) VALUES (?, ?, NOW(), 1)";
        $stmtUser = $con->prepare($insertUserSQL);
        $stmtUser->bind_param("ss", $inputName, $inputEmail);

        if ($stmtUser->execute()) {
            // Gegevens zijn succesvol ingevoegd in de 'users'-tabel
            $userId = $stmtUser->insert_id; // Haal de ID van de nieuw ingevoegde gebruiker op

            // SQL-query om koppeling naar nieuwsbrief in 'user_newsletter'-tabel in te voegen
            $insertNewsletterSQL = "INSERT INTO user_newsletter (user_id, news_id) VALUES (?, ?)";
            $stmtNewsletter = $con->prepare($insertNewsletterSQL);

            $stmtNewsletter->bind_param("ii", $userId, $newsId);

            if ($stmtNewsletter->execute()) {
                // Koppeling naar nieuwsbrief succesvol ingevoegd
                $insertedDate = date("Y-m-d H:i:s");
                echo "Gegevens zijn succesvol opgeslagen in de database. Datum van invoeging: $insertedDate";

                // Voeg hier de code toe om de e-mail te verzenden
                require('send_email.php');

            } else {
                // Er is een fout opgetreden bij het invoegen van de koppeling naar nieuwsbrief
                echo "Fout bij het invoegen van de koppeling naar nieuwsbrief: " . $stmtNewsletter->error;
            }

            $stmtNewsletter->close();
        } else {
            // Er is een fout opgetreden bij het invoegen van de gebruikersgegevens
            echo "Fout bij het invoegen van de gebruikersgegevens in de database: " . $stmtUser->error;
        }

        $stmtUser->close();

        // Sluit de databaseverbinding
        $con->close();
    }
} else {
    echo "Dit script moet worden aangeroepen via een POST-verzoek.";
}
?>
