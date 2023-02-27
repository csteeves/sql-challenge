CREATE TABLE Employees (
    emp_no INT PRIMARY KEY,
    emp_tile_id VARCHAR NOT NULL,
    birth_date date NOT NULL,
    first_name VARCHAR NOT NULL,
    last_name VARCHAR NOT NULL,
    sex VARCHAR NOT NULL,
    hire_date date NOT NULL,
	FOREIGN KEY emp_title_id REFERENCES Titles(title_id)
);

CREATE TABLE Departments (
    dept_no VARCHAR PRIMARY KEY,
    dept_name VARCHAR NOT NULL
);

CREATE TABLE Dept_Emp (
    emp_no INT NOT NULL,
	FOREIGN KEY emp_no REFERENCES Employees(emp_no)
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY dept_no REFERENCES Departments(dept_no),
    CONSTRAINT pk_Dept_Emp PRIMARY KEY (emp_no,dept_no)
);


CREATE TABLE Dept_Manager (
    dept_no VARCHAR NOT NULL,
	FOREIGN KEY dept_no REFERENCES Departments(dept_no),
    emp_no INT NOT NULL,
	FOREIGN KEY emp_no REFERENCES Employees(emp_no),
    CONSTRAINT pk_Dept_Manager PRIMARY KEY (dept_no,emp_no)
);

CREATE TABLE Salaries (
    emp_no INT NOT NULL,
	FOREIGN KEY emp_no REFERENCES Employees(emp_no),
    salary INT NOT NULL,
    CONSTRAINT pk_Salaries PRIMARY KEY (emp_no)
);

CREATE TABLE Titles (
    title_id VARCHAR PRIMARY KEY NOT NULL,
    title VARCHAR NOT NULL
);

