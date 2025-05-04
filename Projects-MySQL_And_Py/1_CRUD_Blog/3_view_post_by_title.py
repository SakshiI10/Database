import mysql.connector

connection = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="root123", 
    database="blog_db"  
)

cursor = connection.cursor()

title_input = input("Enter the post title to view: ").strip()

cursor.execute("SELECT content FROM posts WHERE title = %s", (title_input,))
result = cursor.fetchone()

if result:
    print("\nPost Content:")
    print(result[0])
else:
    print("\nPost not found.")

cursor.close()
connection.close()
