import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="root123",   
    database="contact_manager" 
)

cursor = conn.cursor()

def add_contact():
    name = input("Enter name: ")
    phone = input("Enter phone number: ")
    email = input("Enter email: ")

    query = "INSERT INTO contacts (name, phone_number, email) VALUES (%s, %s, %s)"
    values = (name, phone, email)

    cursor.execute(query, values)
    conn.commit()

    print("Contact added successfully!")

add_contact()
cursor.close()
conn.close()
