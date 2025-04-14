import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="root123",   
    database="contact_manager" 
)

cursor = conn.cursor()

def view_contacts():
    cursor.execute("SELECT * FROM contacts")
    rows = cursor.fetchall()

    if rows:
        print("\nAll Contacts:")
        for row in rows:
            print(f"ID: {row[0]}, Name: {row[1]}, Phone: {row[2]}, Email: {row[3]}")
    else:
        print("No contacts found.")

view_contacts()
cursor.close()
conn.close()
