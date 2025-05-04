import mysql.connector

connection = mysql.connector.connect(
    host="localhost",
    user="root",               
    password="root123", 
    database="blog_db"  
)

cursor = connection.cursor()

tag_input = input("Enter a tag to search posts: ").strip()
cursor.execute("SELECT id FROM tags WHERE name = %s", (tag_input,))
tag_result = cursor.fetchone()

if tag_result:
    tag_id = tag_result[0]

    query = """
    SELECT posts.title FROM posts
    JOIN post_tags ON posts.id = post_tags.post_id
    WHERE post_tags.tag_id = %s
    """
    cursor.execute(query, (tag_id,))
    posts = cursor.fetchall()

    if posts:
        print(f"\nPosts tagged with '{tag_input}':")
        for i, (title,) in enumerate(posts, start=1):
            print(f"{i}. {title}")
    else:
        print("No posts found with that tag.")
else:
    print("Tag not found.")

cursor.close()
connection.close()
