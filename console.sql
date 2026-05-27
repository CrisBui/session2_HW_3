-- 1
CREATE DATABASE CompanyDB;

-- 2
CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Employees (
    emp_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    dob DATE,
    department_id INTEGER,
    
    CONSTRAINT fk_employees_departments
        FOREIGN KEY (department_id) REFERENCES Departments(department_id)
        ON DELETE SET NULL
);

CREATE TABLE Projects (
    project_id SERIAL PRIMARY KEY,
    project_name VARCHAR(150) NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE,
    
    CONSTRAINT chk_project_dates CHECK (end_date >= start_date)
);

-- 3
CREATE TABLE EmployeeProjects (
    emp_id INTEGER,
    project_id INTEGER,
    
    PRIMARY KEY (emp_id, project_id),
    
    CONSTRAINT fk_employeeprojects_employees
        FOREIGN KEY (emp_id) REFERENCES Employees(emp_id)
        ON DELETE CASCADE,
        
    CONSTRAINT fk_employeeprojects_projects
        FOREIGN KEY (project_id) REFERENCES Projects(project_id)
        ON DELETE CASCADE
);
