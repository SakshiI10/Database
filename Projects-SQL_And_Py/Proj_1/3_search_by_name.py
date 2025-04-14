import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="root123",   
    database="contact_manager" 
)

cursor = conn.cursor()

def search_contact():
    name = input("Enter name to search: ")

    query = "SELECT * FROM contacts WHERE name LIKE %s"
    value = ("%" + name + "%",)

    cursor.execute(query, value)
    rows = cursor.fetchall()

    if rows:
        print("\nResults:")
        for row in rows:
            print(f"ID: {row[0]}, Name: {row[1]}, Phone: {row[2]}, Email: {row[3]}")
    else:
        print("No contacts found.")

search_contact()
cursor.close()
conn.close()
