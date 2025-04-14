import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="root123",   
    database="contact_manager" 
)

cursor = conn.cursor()

def delete_contact():
    contact_id = input("Enter the ID of the contact to delete: ")

    cursor.execute("SELECT * FROM contacts WHERE id = %s", (contact_id,))
    result = cursor.fetchone()

    if result:
        confirm = input(f"Are you sure you want to delete '{result[1]}'? (y/n): ")
        if confirm.lower() == 'y':
            cursor.execute("DELETE FROM contacts WHERE id = %s", (contact_id,))
            conn.commit()
            print("Contact deleted.")
        else:
            print("Deletion canceled.")
    else:
        print("Contact not found.")

delete_contact()
cursor.close()
conn.close()


