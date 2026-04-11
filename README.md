<div align="center">
  <h1>💻 LaptopShop E-Commerce</h1>
  <p><i>A robust, full-stack Spring Boot e-commerce application designed for selling laptops and tech accessories.</i></p>

  <!-- Badges -->
  <p>
    <img src="https://img.shields.io/badge/Java-21-orange.svg" alt="Java 21" />
    <img src="https://img.shields.io/badge/Spring%20Boot-3.4.3-brightgreen.svg" alt="Spring Boot 3.4.3" />
    <img src="https://img.shields.io/badge/Spring%20Security-Enabled-blue.svg" alt="Spring Security" />
    <img src="https://img.shields.io/badge/MySQL-9.6.0-blue.svg" alt="MySQL" />
    <img src="https://img.shields.io/badge/JSP-Jakarta-yellow.svg" alt="JSP" />
  </p>
</div>

<hr />

## 📖 Overview

**LaptopShop** is a modern MVC web application built with Java and the Spring Boot framework. It provides a complete end-to-end shopping experience, featuring a client-facing storefront with a "glassmorphism" modern dark theme, and a secure administrative dashboard for managing users and products. 

## ✨ Key Features

### 👤 Client-side (Public Features)
* **Modern UI:** Responsive, aesthetically pleasing dark-themed glassmorphism design.
* **Product Browsing:** Display of laptops in an interactive grid layout.
* **Detailed Views:** Direct navigation to product details by clicking on product images or titles.

### 🛡️ Admin Dashboard (Secure Access)
* **Product Management:** Complete CRUD (Create, Read, Update, Delete) functionality for the products inventory. Handle product details, inventory counts, and image uploads.
* **User Management:** Robust administration for user accounts including creation, role assignment, modification, and deletion.
* **Input Validation:** Integrated server-side validation using Spring Validation to ensure data consistency and integrity.
* **Security:** Powered by Spring Security for robust authentication and role-based access control.

## 🛠️ Technology Stack

**Backend System:**
* [Java 21](https://www.oracle.com/java/) - Core programming language
* [Spring Boot 3.4.3](https://spring.io/projects/spring-boot) - Application framework
* [Spring MVC](https://docs.spring.io/spring-framework/reference/web/webmvc.html) - For handling web requests and routing
* [Spring Data JPA](https://spring.io/projects/spring-data-jpa) & Hibernate - Object-Relational Mapping (ORM)
* [Spring Security](https://spring.io/projects/spring-security) - Authentication and Authorization
* [Spring Validation](https://spring.io/guides/gs/validating-form-input/) - Backend form and entity validation

**Frontend Technologies:**
* [JSP (JavaServer Pages)](https://javaee.github.io/tutorial/jsps.html) & JSTL - Server-side page templating
* Vanilla CSS / JavaScript - For interactive elements and styling
* HTML5 / CSS3 - Semantic markup and modern design constraints

**Database:**
* [MySQL (Connector 9.6.0)](https://www.mysql.com/) - Relational database management 

## 🚀 Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

You will need the following installed on your system:
* **Java Development Kit (JDK) 21** or higher.
* **Maven** (optional, you can use the included `mvnw` wrapper).
* **MySQL Server** (Running locally on port 3306).

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/YourUsername/java-laptop-shop.git
   cd java-laptop-shop
   ```

2. **Database Setup**
   Create a new blank MySQL database named `laptopshop`:
   ```sql
   CREATE DATABASE laptopshop;
   ```

3. **Configure Application Properties**
   The application leverages `application.properties` for configuration. Navigate to `src/main/resources/application.properties` and verify your database credentials:
   ```properties
   spring.datasource.url=jdbc:mysql://localhost:3306/laptopshop
   spring.datasource.username=root
   spring.datasource.password=123456
   ```
   *(Note: For security reasons, do not use weak passwords in production environments).*

4. **Build and Run**
   Using the maven wrapper, clean and run the spring boot application:
   ```bash
   # On Windows
   mvnw.cmd spring-boot:run
   
   # On macOS/Linux
   ./mvnw spring-boot:run
   ```

5. **Access the Application**
   Once the console output indicates Tomcat has started, browse to: 
   `http://localhost:8080`

## 📁 Project Structure

```text
📦 laptopshop/
 ┣ 📂 src/main/java/com/example/helloworld          # Core Java source packages
 ┃ ┣ 📂 controller                                  # Handling HTTP Requests (Admin & User)
 ┃ ┣ 📂 model/entity                                # JPA Entities mapping to DB tables
 ┃ ┣ 📂 repository                                  # Spring Data JPA Interfaces
 ┃ ┣ 📂 service                                     # Business Logic Layer
 ┃ ┗ ...
 ┣ 📂 src/main/resources/                           
 ┃ ┗ 📜 application.properties                      # Main Configuration file
 ┣ 📂 src/main/webapp/
 ┃ ┣ 📂 resources/                                  # Static Content (CSS, JS, Images)
 ┃ ┗ 📂 WEB-INF/view/                               # JSP Template Views
 ┣ 📜 pom.xml                                       # Maven Dependencies & Build settings
 ┗ 📜 README.md                                     # Project Documentation
```

## 🤝 Contributing

This project is a personal portfolio piece. However, feedback and ideas are welcome. If you find a bug, feel free to open an issue or submit a pull request!

## 📄 License

This project is open-source and available under the [MIT License](LICENSE).
