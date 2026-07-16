# Work with MySQL

A collection of MySQL scripts covering core database concepts — from table creation and constraints to joins, subqueries, views, and indexes. This repo was built while working through lab exercises and assignments for a Database Systems course, and each file is self-contained, runnable, and commented where relevant.

## 📂 Contents

| File | Topic | Description |
|---|---|---|
| `DataBaseBasic.sql` | Basics | Minimal starter script for creating a database/table. |
| `DataBaseEmployee.sql` | Basic DDL/DML | Creates an `employee` database with an `EMPLOYEES` table and sample inserts. |
| `PK_FK_DEFAULT.sql` | Constraints | Demonstrates `PRIMARY KEY`, `FOREIGN KEY`, and `DEFAULT` constraints using `EMPLOYEES` and `university` tables. |
| `Joins.sql` | Joins | Overview and examples of all join types — inner, outer (left/right/full), self, equi, non-equi, natural, and cross joins. |
| `Labno7JOINS.sql` | Joins (Lab) | Lab task using `emp` and `dept` tables to practice join queries. |
| `lab 6.sql` | Joins & Aggregation | `Department` and `Employee` tables used to practice joins and grouped queries. |
| `Subqueries.sql` | Subqueries | Subquery examples using a `student` table (marks, grades, city). |
| `Labno8subqueries.sql` | Subqueries (Lab) | Lab task on subqueries using an `empl` (employee) table with salary and hire date data. |
| `DBSviews.sql` | Views | Creating and querying a view (`student_view`) filtered by city. |
| `Lab9_Views_Indexes.sql` | Views & Indexes | Lab task combining views and indexes on an `Employees` table. |
| `lab10_23sw044.sql` | Users & Privileges | Creating MySQL users and managing access on an `employees` table. |
| `Assignment.sql` | Assignment | Larger assignment script — `DBS_CEP` database with a `Customer` table and related queries. |
| `testDB.sql` | Testing | Quick scratch script for testing basic table creation and inserts. |
| `Diagram.png` | Reference | ER/schema diagram referenced across the exercises. |

## 🧠 Topics Covered

- Database & table creation (`CREATE DATABASE`, `CREATE TABLE`)
- Constraints: `PRIMARY KEY`, `FOREIGN KEY`, `DEFAULT`, `NOT NULL`
- Data manipulation: `INSERT`, `SELECT`, `UPDATE`, `DELETE`
- Joins: inner, left/right/full outer, self, equi, non-equi, natural, cross
- Subqueries (single-row, multi-row, correlated)
- Views: creation and querying
- Indexes: creation and use with views
- User management and privileges (`CREATE USER`, `GRANT`)

## 🚀 Getting Started

1. Install MySQL Server (or use a client like MySQL Workbench / DBeaver).
2. Clone this repository:
   ```bash
   git clone https://github.com/<your-username>/Work-with-MySQL.git
   cd Work-with-MySQL
   ```
3. Run any script against your MySQL server, for example:
   ```bash
   mysql -u root -p < Joins.sql
   ```
   Or open the `.sql` file in your preferred MySQL client and execute it directly.

> ⚠️ Each script creates its own database (e.g. `joins`, `views`, `subquery`), so scripts can be run independently without conflicting with one another.

## 🖼️ Schema Reference

See `Diagram.png` for a visual reference of the table relationships used across the join and subquery exercises.

## 📌 Notes

These scripts were written for learning and practice purposes, so table/column naming and formatting vary slightly from file to file (reflecting different labs and assignments) rather than following a single unified schema.
