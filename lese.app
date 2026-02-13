<!DOCTYPE html>
<html lang="de">
<head>
<meta charset="UTF-8">
<title>Lese-App Prototyp</title>
<style>
  body { font-family: Arial; font-size: 24px; padding: 50px; text-align: center; }
  #text { margin: 20px; font-weight: bold; }
  #feedback { margin-top: 30px; font-size: 28px; color: green; }
  button { font-size: 24px; padding: 10px 20px; }
</style>
</head>
<body>
<h1>Lese-App Prototyp</h1>
<div id="text">Ich trinke Tee.</div>
<button id="startBtn">🎤 Vorlesen</button>
<div id="feedback"></div>

<script>
const textToRead = "Ich trinke Tee.";
const feedbackDiv = document.getElementById("feedback");
const startBtn = document.getElementById("startBtn");

startBtn.onclick = () => {
  const recognition = new (window.SpeechRecognition || window.webkitSpeechRecognition)();
  recognition.lang = 'de-DE';
  recognition.start();

  recognition.onresult = (event) => {
    const spokenText = event.results[0][0].transcript;
    console.log("Erkannt:", spokenText);
    
    // einfache Auswertung
    if (spokenText.toLowerCase().includes("tee") && spokenText.toLowerCase().includes("ich") && spokenText.toLowerCase().includes("trinke")) {
      feedbackDiv.textContent = "👍 Gut gelesen!";
    } else {
      feedbackDiv.textContent = "🔁 Noch einmal lesen?";
    }
  };

  recognition.onerror = (event) => {
    feedbackDiv.textContent = "Fehler bei der Erkennung, bitte Mikrofon prüfen.";
  };
};
</script>
</body>
</html>
