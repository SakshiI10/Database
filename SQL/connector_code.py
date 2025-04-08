import mysql.connector

conn = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="your_password", 
    database="your_database_name"  
)

cursor = conn.cursor()
print("Connected to MySQL!")

cursor.close()
conn.close()