# 🛡️ Insurance Management System

A Database Management System (DBMS) project developed using **MySQL and MySQL Workbench** to manage insurance customers, policies, agents, premium payments, and claims.

## 📌 Project Overview

The Insurance Management System is designed to store and manage insurance-related information in a structured relational database. It helps organize customer details, policy assignments, agent information, premium payments, and insurance claims.

This project demonstrates database concepts such as table relationships, primary keys, foreign keys, SQL queries, joins, views, stored procedures, and reporting.

## 🎯 Objectives

- Manage customer information.
- Store insurance policy details.
- Maintain insurance agent records.
- Assign policies to customers through agents.
- Track premium payments.
- Manage insurance claims.
- Generate reports using SQL queries.

## 🛠️ Technologies Used

- **Database:** MySQL
- **Database Tool:** MySQL Workbench
- **Query Language:** SQL
- **Operating System:** Windows

## 🗄️ Database Structure

The project contains six main tables:

| Table Name | Description |
|---|---|
| Customers | Stores customer details |
| Policies | Stores insurance policy information |
| Agents | Stores agent details |
| Customer_Policies | Connects customers, policies, and agents |
| Premium_Payments | Stores premium payment records |
| Claims | Stores insurance claim details |

## 🔗 Entity Relationship Diagram (ER Diagram)

The ER diagram represents the relationships between the six database tables.

**Relationships:**
- Customers → Customer_Policies
- Policies → Customer_Policies
- Agents → Customer_Policies
- Customer_Policies → Premium_Payments
- Customer_Policies → Claims

See the ER diagram file in this repository.

## ⚙️ Features

### 1. SQL Queries
- Basic SQL queries
- Joins
- Aggregate functions
- Subqueries
- Update and Delete operations

### 2. Views
- Customer_Policy_View
- Payment_History
- Active_Policies
- Claim_Details
- Customer_Premium_Summary

### 3. Stored Procedures
- InsertCustomer
- AssignPolicy
- GetCustomerPolicies
- TotalPremiumCollected
- ListClaimsByStatus

### 4. Reports
- Top 5 Premium Policies
- Customers with Highest Payments
- Monthly Premium Collection
- Policy Type Distribution
- Claim Approval/Rejection Analysis

## 🚀 How to Run the Project

1. Install MySQL Server and MySQL Workbench.
2. Open MySQL Workbench.
3. Connect to your local MySQL server.
4. Go to **Server → Data Import**.
5. Select **Import from Self-Contained File**.
6. Choose `Insurance_Management_Backup.sql`.
7. Select or create the target database schema.
8. Click **Start Import**.
9. Refresh the Schemas panel.
10. Open a new SQL query tab and execute:

```sql
USE insurance_management;
SHOW TABLES;
```

The six database tables should now be visible.

## 📊 Project Reports

The project includes five SQL-based reports to analyze insurance operations:

1. Top 5 Premium Policies
2. Customers with Highest Payments
3. Monthly Premium Collection
4. Policy Type Distribution
5. Claim Approval/Rejection Analysis

## 📁 Project Files

The repository contains the following project resources:

- `Insurance_Management_Backup.sql` – Database backup
- `Insurance_Management_System_Project_Report.pdf` – Project documentation
- `Insurance_ER_Diagram.png` – Entity Relationship Diagram
- `Screenshots/` – Project execution and output screenshots

## 🔮 Future Enhancements

- Add a user login and authentication system.
- Develop a web-based user interface.
- Integrate online premium payments.
- Add policy renewal notifications.
- Improve claim tracking and management.

## 👨‍💻 Author

**Your Name**

- Project: Insurance Management System
- Domain: Database Management System (DBMS)
- Technology: MySQL

---

⭐ If you find this project useful, feel free to explore the repository!
