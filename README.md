# CV Web Application

A dynamic, web-based CV Generator built using Java (Jakarta EE 10), Maven, and styled with Tailwind CSS. This application fully utilizes the Model-View-Controller (MVC) design pattern to take user profile data via an input form and render it beautifully in different formats.

---

## 📁 Project Structure

The project code is organized based on standard Maven web app conventions:

* **`src/main/java/`** - Contains the backend logic split cleanly into structural packages:
  * `controller/CVServlet.java` - Handles input requests, demo routing, and forward rendering.
  * `model/CVModel.java` - Holds the data structures for candidate profiles.
  * `model/PDFGenerator.java` - Handles client/server side printable view parameters.
* **`src/main/webapp/`** - Frontend UI views and descriptors:
  * `index.jsp` - The dashboard entry point featuring the dynamic form layout.
  * `viewCV.jsp` - The polymorphic output rendering template.
  * `WEB-INF/web.xml` - Server routing descriptor rules mapping URL end-points.
* **`pom.xml`** - Project dependency configuration file.

---

## 🚀 Key Features

* **Complete MVC Architecture:** Total separation of concerns where raw code strings and view render cycles are systematically decoupled.
* **Polymorphic Template Support:** Switch between custom executive and ATS-friendly design profiles seamlessly.
* **Zero-Library Print Compiler:** Native document output parsing using optimized Tailwind typography frameworks.
* **Quick-Load Mock Previews:** Direct hardcoded parameter mappings for instant evaluation modes.

---

## 🛠️ Setup & Running Instructions

To test or run this project locally on your machine, follow these simple guidelines:

### Prerequisites
* Java Development Kit (JDK 17 or 21 recommended)
* Apache Tomcat 10.1 or higher
* NetBeans, Eclipse, or IntelliJ IDEA IDE

### Local Deployment
1. Import or open this project root directory inside your Java IDE.
2. Ensure dependencies resolve smoothly through automated Maven indexing routines.
3. Bind the local project execution scope onto your Apache Tomcat 10 server context.
4. Run or Clean & Build the project to open `index.jsp` directly within a standard web browser window.
