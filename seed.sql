-- DROP DATABASE IF EXISTS employee_tracker;
CREATE database employee_tracker;

USE employee_tracker;

CREATE TABLE department (
  id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30) NOT NULL -- to hold department name
);


SELECT * FROM department;
-- //////////////////////////////////////////////
drop table department;
drop table role;
drop table employee; 

CREATE TABLE role (
  id INT NOT NULL PRIMARY KEY auto_increment,
  title VARCHAR(30) NOT NULL, -- hold role title
  salary DECIMAL(10,4), -- hold role salary
  department_id INT NOT NULL -- hold reference to department role belongs to
);


SELECT * FROM role; 
-- ///////////////////////////////////////////
CREATE TABLE employee (
  id INT NOT NULL PRIMARY KEY auto_increment, -- question
  first_name VARCHAR(30), -- to hold the employees first name
  last_name VARCHAR(30),  -- to hold the employees last name 
  role_id INT NOT NULL, -- to hold reference to role employee has 
  manager_id INT -- to hold reference to another employee that manages the employee
);

SELECT * FROM employee;