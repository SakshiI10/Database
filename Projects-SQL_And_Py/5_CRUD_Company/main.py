import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root123",
    database="COMPANY_DB"
)

cursor = conn.cursor()

def create():
    id = int(input("Enter company ID: ").strip())
    name = input("Enter company name: ").strip()
    loc = input("Enter company location: ").strip()

    query = "INSERT INTO COMPANY (ID, COMPANY_NAME, COMPANY_LOC) VALUES (%s, %s, %s)"
    values = (id, name, loc)

    try:
        cursor.execute(query, values)
        conn.commit()
        print("Created successfully.")
    except mysql.connector.Error as err:
        print("Error:", err)

create()
cursor.close()
conn.close()
