import sqlite3
from faker import Faker
import random

fake = Faker()


def insert_students(cur, num_students, starting_id=1):
    students = [(starting_id + i, fake.name(), fake.date_of_birth().strftime('%Y-%m-%d'), random.randint(1, 3)) for i in range(num_students)]
    print(f"Inserting {num_students} students into the database.")
    cur.executemany("INSERT INTO students (id, student_name, date_of_birth, group_id) VALUES (?, ?, ?, ?)", students)


def insert_grades(cur, num_students, num_subjects, max_grades_per_student, starting_id=1):
    # Fetch existing student IDs from the students table
    existing_student_ids = [i for i in range(starting_id, starting_id + num_students)]

    # Generate grades with valid student IDs
    grades = []
    for student_id in existing_student_ids:
        student_grades = [
            (None, student_id, random.randint(1, num_subjects), random.randint(1, 100), fake.date_between(start_date='-1y', end_date='today').strftime('%Y-%m-%d'))
            for _ in range(max_grades_per_student)
        ]
        grades.extend(student_grades)

    cur.executemany("INSERT INTO grades (id, student_id, subject_id, grade, date_obtained) VALUES (?, ?, ?, ?, ?)", grades)


def insert_groups(cur, num_groups, starting_id=1):
    groups = [(starting_id + i, fake.word() + str(i + 1),) for i in range(num_groups)]
    cur.executemany("INSERT INTO groups (id, group_name) VALUES (?, ?)", groups)


def insert_teachers(cur, num_teachers, starting_id=1):
    teachers = [(starting_id + i, fake.name(),) for i in range(num_teachers)]
    cur.executemany("INSERT INTO teachers (id, teacher_name) VALUES (?, ?)", teachers)


def insert_subjects(cur, num_subjects, num_teachers, starting_id=1):
    subjects = [(starting_id + i, fake.word(), random.randint(1, num_teachers)) for i in range(num_subjects)]
    cur.executemany("INSERT INTO subjects (id, subject_name, teacher_id) VALUES (?, ?, ?)", subjects)


def fill_data():
    db_file = 'education.db'

    with sqlite3.connect(db_file) as con:
        cur = con.cursor()

        num_students = random.randint(30, 50)
        num_groups = 3
        num_teachers = random.randint(3, 5)
        num_subjects = random.randint(5, 8)
        max_grades_per_student = 20

        starting_id = 1

        insert_students(cur, num_students, starting_id)
        insert_groups(cur, num_groups, starting_id)
        insert_teachers(cur, num_teachers, starting_id)
        insert_subjects(cur, num_subjects, num_teachers, starting_id)
        insert_grades(cur, num_students, num_subjects, max_grades_per_student, starting_id)

    print(f"Random data added to the database '{db_file}'.")


if __name__ == "__main__":
    fill_data()
