CREATE TABLE departments (
    dept_no varchar(4) PRIMARY KEY,
    dept_name varchar(30) NOT NULL
);

CREATE TABLE titles (
    title_id varchar(5) PRIMARY KEY,
    title varchar(30) NOT NULL
);

CREATE TABLE employees (
    emp_no varchar(6) PRIMARY KEY,
    emp_title_id varchar(5) REFERENCES titles(title_id),
    birth_date date NOT NULL,
    first_name varchar(30) NOT NULL,
    last_name varchar(30) NOT NULL,
    sex varchar(1) NOT NULL,
    hire_date date NOT NULL
);

CREATE TABLE salaries (
    emp_no varchar(6) PRIMARY KEY REFERENCES employees(emp_no),
    salary int NOT NULL
);

CREATE TABLE dept_manager (
    dept_no varchar(4) REFERENCES departments(dept_no),
    emp_no varchar(6) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

CREATE TABLE dept_emp (
    emp_no varchar(6) REFERENCES employees(emp_no),
    dept_no varchar(4) REFERENCES departments(dept_no),
    PRIMARY KEY (emp_no, dept_no)
);