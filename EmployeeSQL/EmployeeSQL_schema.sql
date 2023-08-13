-- Schema for Employee Database
-- Create Departments Table
CREATE TABLE "departments" (
    "dept_no" VARCHAR(20)   NOT NULL,
    "dept_name" VARCHAR(30)   NOT NULL,
    PRIMARY KEY ("dept_no")
);

-- Create Titles Table
CREATE TABLE "titles" (
    "title_id" varchar(20)   NOT NULL,
    "title" varchar(30)   NOT NULL,
    PRIMARY KEY ("title_id")
);

-- Create Employees Table
CREATE TABLE "employees" (
    "emp_no" INT   NOT NULL,
    "emp_title_id" VARCHAR(20)   NOT NULL,
    "birth_date" DATE   NOT NULL,
    "first_name" VARCHAR(30)   NOT NULL,
    "last_name" VARCHAR(30)   NOT NULL,
    "sex" VARCHAR(10),
    "hire_date" DATE   NOT NULL,
    PRIMARY KEY ("emp_no"),
    FOREIGN KEY("emp_title_id") REFERENCES "titles" ("title_id")
);

-- Create Employees' Departments Table
CREATE TABLE "dept_emp" (
    "emp_no" INT   NOT NULL,
    "dept_no" VARCHAR(20)   NOT NULL,
    FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no"),
    FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no")
);

-- Create Managers' Departments Table
CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR(20)   NOT NULL,
    "emp_no" INT   NOT NULL,
    FOREIGN KEY("dept_no") REFERENCES "departments" ("dept_no"),
    FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);

-- Create Salaries Table
CREATE TABLE "salaries" (
    "emp_no" INT   NOT NULL,
    "salary" INT   NOT NULL,
    FOREIGN KEY("emp_no") REFERENCES "employees" ("emp_no")
);

-- To add primary keys for tables with no primary keys added when creating
ALTER TABLE dept_emp ADD PRIMARY KEY(emp_no,dept_no);
ALTER TABLE dept_manager ADD PRIMARY KEY (emp_no);
ALTER TABLE salaries ADD PRIMARY KEY (emp_no);

