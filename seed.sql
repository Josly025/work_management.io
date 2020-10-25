-- DROP DATABASE IF EXISTS employee_tracker;
CREATE database employee_tracker;

USE employee_tracker;

CREATE TABLE department (
  id INT NOT NULL,
  name VARCHAR(30) NOT NULL, -- to hold department name
  PRIMARY KEY (id)
);

SELECT * FROM department;
-- ////////////////////////////////////////////
CREATE TABLE role (
  id INT NOT NULL,
  title VARCHAR(30) NOT NULL, -- hold role title
  salary DECIMAL(10,4), -- hold role salary
  deparment_id INT NOT NULL, -- hold reference to department role belongs to
  PRIMARY KEY (id)
);

SELECT * FROM role; 
-- ///////////////////////////////////////
CREATE TABLE employee (
  id INT PRIMARY KEY, -- question
  first_name VARCHAR(30), -- to hold the employees first name
  last_name VARCHAR(30),  -- to hold the employees last name 
  role_id INT(10,4) NOT NULL, -- to hold reference to role employee has 
  manager_id INT (10,4) NOT NULL, -- to hold reference to another employee that manages the employee
  PRIMARY KEY (id)    
);

SELECT * FROM employee;