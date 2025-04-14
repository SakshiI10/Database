import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="root123",   
    database="contact_manager" 
)

cursor = conn.cursor()

def update_contact():
    contact_id = input("Enter the ID of the contact to update: ")

    cursor.execute("SELECT * FROM contacts WHERE id = %s", (contact_id,))
    result = cursor.fetchone()

    if result:
        print("Leave field empty to keep existing value.")

        name = input(f"New name (current: {result[1]}): ") or result[1]
        phone = input(f"New phone (current: {result[2]}): ") or result[2]
        email = input(f"New email (current: {result[3]}): ") or result[3]

        update_query = """
        UPDATE contacts
        SET name = %s, phone_number = %s, email = %s
        WHERE id = %s
        """
        cursor.execute(update_query, (name, phone, email, contact_id))
        conn.commit()

        print("Contact updated.")
    else:
        print("Contact not found.")

update_contact()
cursor.close()
conn.close()

