import mysql.connector

connection = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="root123", 
    database="blog_db"  
)

cursor = connection.cursor()

# Getting user input
title = input("Enter post title: ")
content = input("Enter post content: ")
tags_input = input("Enter tags (Comma-Separated): ")

# Converting tags_input into list
raw_tags = tags_input.split(",")
tags = []
for tag in raw_tags:
    tags.append(tag.strip())

# Inserting post in POST table
cursor.execute("INSERT INTO posts (title, content) VALUES (%s, %s)", (title, content))
post_id = cursor.lastrowid  

# Inserting tags in TAGS table
tag_ids = []
for tag in tags:
    cursor.execute("SELECT id FROM tags WHERE name = %s", (tag,))
    result = cursor.fetchone()
    
    if result:
        tag_id = result[0]
    else:
        cursor.execute("INSERT INTO tags (name) VALUES (%s)", (tag,))
        tag_id = cursor.lastrowid
    tag_ids.append(tag_id)

# Inserting into post_tags linking table 
for tag_id in tag_ids:
    cursor.execute("INSERT INTO post_tags (post_id, tag_id) VALUES (%s, %s)", (post_id, tag_id))

connection.commit()
print("Saved Successfully!")

cursor.close()
connection.close()
