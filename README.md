<p align="center">
  <img src="https://github.com/gisolfi02/TrenNutrition/assets/114088374/1c3129de-5c3f-45db-9346-ec007004e4ed" style="width:300px">
</p>

# TrenNutrition
Repository contenente il progetto realizzato durante il corso di "Tecnologie Software per il WEB" tenuto dal Prof. Gennaro Costagliola presso l'Università degli studi di Salerno.
## Chi siamo
- [@astappetto02](https://github.com/Astappetto02)
- [@gisolfi02](https://github.com/gisolfi02)

# Cos'è TrenNutrition
Tren Nutrition è un ecommerce specializzato nella vendita di integratori per la palestra. Offre una vasta gamma di prodotti mirati a soddisfare le esigenze degli appassionati di fitness, culturismo e sportivi professionisti. La piattaforma offre un'esperienza di shopping online intuitiva e user-friendly, consentendo ai clienti di esplorare facilmente il catalogo di integratori e trovare i prodotti più adatti alle loro esigenze specifiche. Tren Nutrition si impegna a garantire la qualità e l'efficacia dei suoi prodotti, collaborando con marchi affidabili e rispettati nel settore degli integratori per la palestra. Nel complesso, Tren Nutrition si propone di essere il punto di riferimento per gli appassionati di fitness e sportivi che cercano integratori di alta qualità per raggiungere i propri obiettivi di allenamento e migliorare le proprie performance fisiche.

## Contenuto dell'applicazione
Oltre alla classiche funzionalià di accesso e registrazione da parte di un utente, TrenNutrition offre:
- La ricerca dei prodotti tramite categoria o nome
- La possibilità di aggiungere al carrello un prodotto
- Effettuare l'acquisto dei prodotti nel carrello
- La possibilità di visualizzare lo storico degli ordini, inclusa la possibilià di visualizzare i prodotti di ogni ordine

Inoltre, TrenNutrition prevede anche la figura dell'amministratore, il quale può:
- Aggiungere un prodotto
- Rimuovere un prodotto
- Visualizzare la lista di utenti iscritti alla piattaforma
- Modificare eventualmente i dati degli utenti

# Come Iniziare
## Requisiti
I requisiti necessari all'avvio dell'applicazione sono:
- IDE (consigliamo [Intellij IDEA Ultimate Edition](https://www.jetbrains.com/idea/))
- MySQL Workbench
- MySQL
- Tomcat

## Configuarzione
Per poter utilizzare l'applicazione MediCare, il primo passo da eseguire è quello di clonare la repository sul proprio IDE, con il comando:
```bash
git clone https://github.com/gisolfi02/TrenNutrition.git
```
Una volta clonata la repository, modificare nella classe "ConPool" il collegamento al database, inserendo come password la propria password di SQL. Il percorso per arrivare alla classe specficata è:
```bash
src/main/java/model/ConPool.java
```
Successivamente, aprire SQLWorkbench e creare il database copiando il file "Database.sql" presente nella repository. Una volta eseguiti tutti i passi sopra riportati lanciare l'applicazione.
## Link Utili
Di seguito riportiamo il link per l'installazione e la configurazione di MySQL e MySQL Workbench e per Apache Tomcat: 
- [Ultimate MySQL Workbench Installation Guide ](https://www.simplilearn.com/tutorials/mysql-tutorial/mysql-workbench-installation)
- [How to Install Apache Tomcat on Windows](https://phoenixnap.com/kb/install-tomcat-windows)
