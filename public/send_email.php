<?php
// Vervang 'YOUR_API_KEY' door jouw MailerSend API-sleutel
$apiKey = 'mlsn.8778af7fde3652c2e348b7db2be651c298206f7b9c89098dff4671bb8b8f568b';

// Stel de e-mailinformatie in

          //  'email' => $_POST['email'], // Gebruik de e-mail die is ingevoerd in de form
           // 'name' => $_POST['name'],   // Gebruik de naam die is ingevoerd in de form


// Stel de headers in
$headers = [
    'Authorization: Bearer ' . $apiKey,
    'Content-Type: application/json',
];

$headers  = "From: Udayamar04@gmail.com\r\n";
$headers .= "MIME-Version: 1.0\r\n";
$headers .= "Content-Type: text/html; charset=UTF-8\r\n";

// define the subject
$subject = 'Bedankt voor het abonneren';

// define the html content
$html = 'hoi tester,<br>' . "\n\r";
$html .= 'Dit is de HTML-inhoud van de e-mail<br>' . "\n\r";
$html .= 'En hier staat een link: <a href="https://www.w3schools.com/php/func_mail_mail.asp">Mail voorbeeld</a><br>' . "\n\r";
$html .= 'groetjes,<br>' . "\n\r";
$html .= 'De test mail server';

// send the mail using php mail 
$mailTo = $_POST['email'];
$response = mail($mailTo, $subject, $html, $headers);


// Voer het cURL-verzoek uit
var_dump($response);
// Controleer of het verzenden is gelukt
if ($response === false) {
    echo 'Fout bij het verzenden van de e-mail: ' . curl_error($ch);
} else {
    echo 'E-mail is succesvol verzonden.';
}

