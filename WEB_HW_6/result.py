import sqlite3


def run_query(query_number):
    script_path = f'query_{query_number}.sql'

    with open(script_path, 'r') as script_file:
        sql_query = script_file.read()

    print(f"\nExecuting Query {query_number}:\n")

    with sqlite3.connect('education.db') as connection:
        cursor = connection.cursor()
        cursor.execute(sql_query)

        # Fetch and print the results
        results = cursor.fetchall()
        for row in results:
            print(row)


if __name__ == "__main__":
    for query_number in range(1, 12 + 1):
        run_query(query_number)
