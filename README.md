<p align="center">
  <img src="https://github.com/gisolfi02/TrenNutrition/assets/114088374/1c3129de-5c3f-45db-9346-ec007004e4ed" alt="TrenNutrition Logo" style="width:300px">
</p>

# **TrenNutrition**  
Repository contenente il progetto realizzato durante il corso di **Tecnologie Software per il WEB** tenuto dal **Prof. Gennaro Costagliola** presso l'Università degli Studi di Salerno.

---

## 👥 **Chi siamo**
- [@astappetto02](https://github.com/astappetto02)  
- [@gisolfi02](https://github.com/gisolfi02)  

---

## 🛒 **Cos'è TrenNutrition?**
**TrenNutrition** è un e-commerce specializzato nella vendita di integratori per appassionati di fitness, culturismo e sportivi professionisti.  
Offre:  
- Un'ampia gamma di prodotti di alta qualità.  
- Un'esperienza utente intuitiva per esplorare e acquistare integratori.  
- Collaborazione con marchi affidabili nel settore, garantendo la massima qualità e efficacia.  

L'obiettivo principale di TrenNutrition è essere il punto di riferimento per chi desidera migliorare le proprie performance fisiche e raggiungere i propri obiettivi di allenamento.  

---

## 📋 **Contenuto dell'applicazione**
TrenNutrition fornisce funzionalità per:  
### **Utenti Registrati:**  
- **Ricerca prodotti** tramite categorie o nome.  
- **Aggiunta prodotti al carrello.**  
- **Acquisto prodotti** presenti nel carrello.  
- **Visualizzazione storico ordini,** con dettagli su ogni ordine effettuato.  

### **Amministratori:**  
- **Aggiunta di nuovi prodotti.**  
- **Rimozione di prodotti esistenti.**  
- **Gestione utenti registrati:**  
  - Visualizzazione della lista utenti.  
  - Modifica dei dati degli utenti.  

---

## 🚀 **Come iniziare**
### **Requisiti**
Per utilizzare TrenNutrition, è necessario installare i seguenti strumenti:  
- [IntelliJ IDEA Ultimate Edition](https://www.jetbrains.com/idea/) (o un IDE equivalente).  
- MySQL Workbench.  
- MySQL Server.  
- Apache Tomcat.  

### **Configurazione**
1. **Clona la repository** sul tuo IDE:  
   ```bash
   git clone https://github.com/gisolfi02/TrenNutrition.git
   ```
2. **Configura il database**:
    - Apri il file ConPool.java nel percorso
    ```bash
    src/main/java/model/ConPool.java
    ```
    - Inserisci la tua password MySQL nel campo della password.
    ```bash
    // Configurazione esempio in ConPool.java
    private static final String PASSWORD = "laTuaPasswordSQL";
    ```

3. **Crea il database**:
    - Apri MySQL Workbench e connettiti al tuo server MySQL.
    - Importa ed esegui il file Database.sql presente nella repository per creare le tabelle necessarie.

4. **Esegui l'applicazione**:
    - Configura Apache Tomcat nel tuo IDE.
    - Avvia il server Tomcat e lancia il progetto dal tuo IDE per eseguire TrenNutrition.

## 🔗 Link utili
- [Guida completa all'installazione di MySQL Workbench](https://www.simplilearn.com/tutorials/mysql-tutorial/mysql-workbench-installation)
- [Guida all'installazione di Apache Tomcat su Windows](https://phoenixnap.com/kb/install-tomcat-windows)
