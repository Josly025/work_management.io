DROP DATABASE IF EXISTS employees;
CREATE DATABASE employees;

USE employees;

CREATE TABLE department (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) UNIQUE NOT NULL
);

CREATE TABLE role (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(30) UNIQUE NOT NULL,
  salary DECIMAL UNSIGNED NOT NULL,
  department_id INT UNSIGNED NOT NULL,
  INDEX dep_ind (department_id),
  CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES department(id) ON DELETE CASCADE
);
-- Foreign key links tabls together -- used for joins
CREATE TABLE employee (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL,
  role_id INT UNSIGNED NOT NULL,
  INDEX role_ind (role_id),
  CONSTRAINT fk_role FOREIGN KEY (role_id) REFERENCES role(id) ON DELETE CASCADE,
  manager_id INT UNSIGNED,
  INDEX man_ind (manager_id),
  CONSTRAINT fk_manager FOREIGN KEY (manager_id) REFERENCES employee(id) ON DELETE SET NULL
);

SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name AS department, role.salary, CONCAT(manager.first_name, ' ', manager.last_name) AS manager FROM employee LEFT JOIN role on employee.role_id = role.id LEFT JOIN department on role.department_id = department.id LEFT JOIN employee manager on manager.id = employee.manager_id;
SELECT role.id, role.title, department.name AS department, role.salary FROM role LEFT JOIN department on role.department_id = department.id


-- JOINS for employees Database 

SELECT department.id, department.name, 
SUM(role.salary) 
AS utilized_budget
 FROM employee 
 LEFT JOIN role on employee.role_id = role.id 
 LEFT JOIN department on role.department_id = department.id 
 GROUP BY department.id, department.name


SELECT employee.id, employee.first_name, employee.last_name, role.title 
FROM employee
 LEFT JOIN role on employee.role_id = role.id 
 LEFT JOIN department department on role.department_id = department.id 
 WHERE department.id = ?

SELECT employee.id, employee.first_name, employee.last_name, department.name 
AS department, role.title 
FROM employee 
LEFT JOIN role on role.id = employee.role_id 
LEFT JOIN department ON department.id = role.department_id 
WHERE manager_id = ?


-- SELECT e.id, e.first_name, e.last_name, department.name 
-- AS department, role.title 
-- FROM e = employee 
-- LEFT JOIN role on role.id = employee.role_id 
-- LEFT JOIN department ON department.id = role.department_id 
-- WHERE manager_id = ?