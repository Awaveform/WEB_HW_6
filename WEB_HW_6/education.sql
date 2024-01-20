-- Drop existing tables if they exist
DROP TABLE IF EXISTS students;
DROP TABLE IF EXISTS groups;
DROP TABLE IF EXISTS teachers;
DROP TABLE IF EXISTS subjects;
DROP TABLE IF EXISTS grades;

-- Table: students
CREATE TABLE students (
    id INTEGER PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    group_id INTEGER,
    FOREIGN KEY (group_id) REFERENCES groups (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: groups
CREATE TABLE groups (
    id INTEGER PRIMARY KEY,
    group_name VARCHAR(255) NOT NULL
);

-- Table: teachers
CREATE TABLE teachers (
    id INTEGER PRIMARY KEY,
    teacher_name VARCHAR(255) NOT NULL
);

-- Table: subjects
CREATE TABLE subjects (
    id INTEGER PRIMARY KEY,
    subject_name VARCHAR(255) NOT NULL,
    teacher_id INTEGER,
    FOREIGN KEY (teacher_id) REFERENCES teachers (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);

-- Table: grades
CREATE TABLE grades (
    id INTEGER PRIMARY KEY,
    student_id INTEGER,
    subject_id INTEGER,
    grade INTEGER,
    date_obtained DATE NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE,
    FOREIGN KEY (subject_id) REFERENCES subjects (id)
      ON DELETE CASCADE
      ON UPDATE CASCADE
);
