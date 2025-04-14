import csv
import os
from datetime import datetime

FILE_NAME = "expenses.csv"

if not os.path.exists(FILE_NAME):
    with open(FILE_NAME, mode='w', newline='') as file:
        writer = csv.writer(file)
        writer.writerow(["id", "title", "amount", "category", "date"])

def add_expense():
    title = input("Title: ")
    amount = input("Amount: ")
    category = input("Category: ")
    date = input("Date (YYYY-MM-DD) [leave blank for today]: ")

    if not date:
        date = datetime.today().strftime('%Y-%m-%d')

    with open(FILE_NAME, mode='r') as file:
        reader = list(csv.reader(file))
        new_id = len(reader)

    with open(FILE_NAME, mode='a', newline='') as file:
        writer = csv.writer(file)
        writer.writerow([new_id, title, amount, category, date])

    print("✅ Expense added!")

def view_expenses():
    with open(FILE_NAME, mode='r') as file:
        reader = csv.reader(file)
        next(reader)  # skip header
        print("\n📋 All Expenses:\n")
        for row in reader:
            print(f"ID: {row[0]}, Title: {row[1]}, Amount: ₹{row[2]}, Category: {row[3]}, Date: {row[4]}")

def main():
    while True:
        print("\n💸 Expense Tracker")
        print("1. Add Expense")
        print("2. View All Expenses")
        print("3. Exit")

        choice = input("Enter your choice: ")

        if choice == '1':
            add_expense()
        elif choice == '2':
            view_expenses()
        elif choice == '3':
            print("👋 Exiting... Bye!")
            break
        else:
            print("Invalid choice. Try again.")

main()
