//importing connection file
const connection = require("./connection");

//New class DB
class DB {
  constructor(connection) {
    this.connection = connection; //using connection for reference in functions
  }

  //Find all employee - Left join tables
  findAllEmployees() {
    return this.connection.query(
      "SELECT employee.id, employee.first_name, employee.last_name, role.title, department.name AS department, role.salary, CONCAT(manager.first_name, ' ', manager.last_name) AS manager FROM employee LEFT JOIN role on employee.role_id = role.id LEFT JOIN department on role.department_id = department.id LEFT JOIN employee manager on manager.id = employee.manager_id;"
    );
  }

  //Use the id to find a certain employee
  findAllPossibleManagers(employeeId) {
    return this.connection.query(
      "SELECT id, first_name, last_name FROM employee WHERE id != ?",
      employeeId
    );
  }

  //Create new employee
  createEmployee(employee) {
    return this.connection.query("INSERT INTO employee SET ?", employee);
  }

  // Remove employee - this uses the id = ?
  //employeeId is what is used for ? - removes it from table
  removeEmployee(employeeId) {
    return this.connection.query(
      "DELETE FROM employee WHERE id = ?",
      employeeId
    );
  }

  // Update role columm
  updateEmployeeRole(employeeId, roleId) {
    return this.connection.query(
      "UPDATE employee SET role_id = ? WHERE id = ?",
      [roleId, employeeId]
    );
  }

  // Add to employee managers column
  updateEmployeeManager(employeeId, managerId) {
    return this.connection.query(
      "UPDATE employee SET manager_id = ? WHERE id = ?",
      [managerId, employeeId] //this takes the place of the ? in our schema
    );
  }

  //Left join to find roles --
  //left join: returns all records from left table, matched to right
  findAllRoles() {
    return this.connection.query(
      "SELECT role.id, role.title, department.name AS department, role.salary FROM role LEFT JOIN department on role.department_id = department.id;"
    );
  }

  //New role
  createRole(role) {
    return this.connection.query("INSERT INTO role SET ?", role);
  }

  //Removing role
  removeRole(roleId) {
    return this.connection.query("DELETE FROM role WHERE id = ?", roleId);
  }

  // Left join tables for finding all departments
  findAllDepartments() {
    return this.connection.query(
      "SELECT department.id, department.name, SUM(role.salary) AS utilized_budget FROM employee LEFT JOIN role on employee.role_id = role.id LEFT JOIN department on role.department_id = department.id GROUP BY department.id, department.name;"
    );
  }

  //Creates department
  createDepartment(department) {
    return this.connection.query("INSERT INTO department SET ?", department);
  }

  //Removes departent
  removeDepartment(departmentId) {
    return this.connection.query(
      "DELETE FROM department WHERE id = ?",
      departmentId
    );
  }

  // Left join: find all employees by department
  findAllEmployeesByDepartment(departmentId) {
    return this.connection.query(
      "SELECT employee.id, employee.first_name, employee.last_name, role.title FROM employee LEFT JOIN role on employee.role_id = role.id LEFT JOIN department department on role.department_id = department.id WHERE department.id = ?;",
      departmentId
    );
  }

  // Left join: find all Employess by manager
  findAllEmployeesByManager(managerId) {
    return this.connection.query(
      "SELECT employee.id, employee.first_name, employee.last_name, department.name AS department, role.title FROM employee LEFT JOIN role on role.id = employee.role_id LEFT JOIN department ON department.id = role.department_id WHERE manager_id = ?;",
      managerId
    );
  }
}

//export Instantiating class of DB with connection -- from constructor
module.exports = new DB(connection);
