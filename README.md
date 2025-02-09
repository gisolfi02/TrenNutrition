# **TrenNutrition** 
<p align="center">
  <img src="https://github.com/gisolfi02/TrenNutrition/assets/114088374/1c3129de-5c3f-45db-9346-ec007004e4ed" alt="TrenNutrition Logo" style="width:300px">
</p>

 
Repository containing the project developed during the **Web Software Technologies** course taught by **Prof. Gennaro Costagliola** at the University of Salerno.

---

## 👥 **Who We Are**
- [@astappetto02](https://github.com/astappetto02)  
- [@gisolfi02](https://github.com/gisolfi02)  

---

## 🛒 **What is TrenNutrition?**
**TrenNutrition** is an e-commerce platform specialized in selling supplements for fitness enthusiasts, bodybuilders, and professional athletes.  
It offers:  
- A wide range of high-quality products.  
- An intuitive user experience to explore and purchase supplements.  
- Collaboration with reliable brands in the industry, ensuring maximum quality and effectiveness.  

TrenNutrition's main goal is to be the reference point for those looking to improve their physical performance and achieve their training goals.  

---

## 🗉 **Application Features**
TrenNutrition provides functionalities for:  
### **Registered Users:**  
- **Search for products** by category or name.  
- **Add products to the cart.**  
- **Purchase products** in the cart.  
- **View order history,** with details on each order placed.  

### **Administrators:**  
- **Add new products.**  
- **Remove existing products.**  
- **Manage registered users:**  
  - View the user list.  
  - Edit user data.  

---

## 🚀 **Getting Started**
### **Requirements**
To use TrenNutrition, you need to install the following tools:  
- [IntelliJ IDEA Ultimate Edition](https://www.jetbrains.com/idea/) (or an equivalent IDE).  
- MySQL Workbench.  
- MySQL Server.  
- Apache Tomcat.  

### **Setup**
1. **Clone the repository** into your IDE:  
   ```bash
   git clone https://github.com/gisolfi02/TrenNutrition.git
   ```
2. **Configure the database**:
    - Open the `ConPool.java` file located at:
    ```bash
    src/main/java/model/ConPool.java
    ```
    - Enter your MySQL password in the password field.
    ```bash
    // Example configuration in ConPool.java
    private static final String PASSWORD = "yourSQLPassword";
    ```

3. **Create the database**:
    - Open MySQL Workbench and connect to your MySQL server.
    - Import and execute the `Database.sql` file from the repository to create the necessary tables.

4. **Run the application**:
    - Configure Apache Tomcat in your IDE.
    - Start the Tomcat server and run the project from your IDE to launch TrenNutrition.

## 🔗 Useful Links
- [Complete Guide to Installing MySQL Workbench](https://www.simplilearn.com/tutorials/mysql-tutorial/mysql-workbench-installation)  
- [Guide to Installing Apache Tomcat on Windows](https://phoenixnap.com/kb/install-tomcat-windows)
