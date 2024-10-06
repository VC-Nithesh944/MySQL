# MySQL Queries Repository

Welcome to the **MySQL Queries Repository**! This repository contains a collection of MySQL scripts to perform various database management tasks, such as creating, modifying, and managing tables, as well as querying data from MySQL databases.

---

## 🚀 Features

- **SQL Queries for Basic to Advanced Operations**:
  - Table creation, alteration, and deletion.
  - Insertion, updating, and deletion of data.
  - Primary and foreign key management.
  - Joins (INNER, OUTER, LEFT, RIGHT).
  - Indexing and optimization queries.

- **Modular Scripts**: Each SQL file is organized by functionality for ease of use and understanding.

---

## 📝 Example Query
### 1. Creating Tables
The `Employee.sql` file contains scripts for creating tables with different constraints and attributes.

**Example**
```sql
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName);
```

## 🚀 How to Run the Programs


1. **Clone the repository**:
    ```bash
    git clone https://github.com/your-username/MySQL.git
    cd MySQL
    ```
    
**Using MySQL CLI**
```bash
mysql -u username -p database_name < path_to_file.sql
```
    
## 💡 Contributing

Feel free to contribute to the repository by adding new sql queries or improving existing ones. Fork the repository, make your changes, and create a pull request. I appreciate your contributions!

---

Thank you for checking out my repository! 😊 Happy coding!
