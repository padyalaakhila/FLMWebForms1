# FLM Web Forms Application (Learning Management System)

## Project Overview
FLMWebForms1 is a web-based Learning Management System developed using ASP.NET Web Forms and C#.  
The application manages Student and Faculty records with structured database connectivity using ADO.NET and SQL Server.

This project follows a Layered Architecture approach using Model and DAO (Data Access Object) patterns.

---

## Architecture Design

The project is structured into three main layers:

### 1️⃣ Presentation Layer
- ASP.NET Web Forms (.aspx pages)
- Code-behind files (.aspx.cs)
- Master Page (Lms.Master) for consistent layout

### 2️⃣ Data Access Layer (DAO)
- Contains SQL queries
- Uses ADO.NET classes (SqlConnection, SqlCommand, SqlDataReader)
- Handles CRUD operations
- Located inside the `Data` folder

### 3️⃣ Model Layer
- Contains entity classes (Student, Faculty, etc.)
- Represents database tables using C# properties
- Used to transfer data between layers

---

## Technologies Used
- ASP.NET Web Forms (.NET Framework)
- C#
- ADO.NET
- SQL Server
- HTML
- CSS
- JavaScript
- Bootstrap

---

## Modules Implemented

### Student Module
- Add Student
- View Student Details
- Update Student Information
- Delete Student Records

### Faculty Module
- Add Faculty
- View Faculty Details
- Update Faculty Information
- Delete Faculty Records

---

## Database Integration
- SQL Server used as backend database
- ADO.NET used for connectivity
- CRUD operations implemented using parameterized SQL queries
- Connection string configured in Web.config

---

## Project Structure
- Student/ → Student-related pages
- Faculty/ → Faculty-related pages
- Data/ → DAO and Model classes
- Content/ → CSS files
- Scripts/ → JavaScript files
- Lms.Master → Master page layout
- Web.config → Configuration settings
- Global.asax → Application-level events

---

## How to Run the Project
1. Clone the repository
2. Open `FLMWebForms1.sln` in Visual Studio
3. Configure SQL Server connection string in Web.config
4. Run using IIS Express

---

## Author
**Padyala Akhila**
