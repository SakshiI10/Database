import mysql.connector

connection = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="root123", 
    database="blog_db"  
)

cursor = connection.cursor()

cursor.execute("SELECT title FROM posts")
titles = cursor.fetchall()

print("\nAll Post Titles:")
for i, (title,) in enumerate(titles, start=1):
    print(f"{i}. {title}")

cursor.close()
connection.close()
