import tkinter as tk
from tkinter import messagebox,Text
from PIL import Image, ImageTk
import mysql.connector
from mysql.connector import Error
from datetime import datetime, timedelta

def open_add_member_window():
    add_member_window = tk.Toplevel(root)
    add_member_window.title("Add Member")

    # Create the form to add member information inside the new window
    lbl_name = tk.Label(add_member_window, text="Member ID:")
    lbl_name.grid(row=0, column=0, padx=10, pady=5)
    entry_name = tk.Entry(add_member_window)
    entry_name.grid(row=0, column=1, padx=10, pady=5)

    lbl_address = tk.Label(add_member_window, text="SSN")
    lbl_address.grid(row=1, column=0, padx=10, pady=5)
    entry_address = tk.Entry(add_member_window)
    entry_address.grid(row=1, column=1, padx=10, pady=5)

    lbl_contact = tk.Label(add_member_window, text="Name")
    lbl_contact.grid(row=2, column=0, padx=10, pady=5)
    entry_contact = tk.Entry(add_member_window)
    entry_contact.grid(row=2, column=1, padx=10, pady=5)

    lbl_phone = tk.Label(add_member_window, text="Phone Number")
    lbl_phone.grid(row=3, column=0, padx=10, pady=5)
    entry_phone = tk.Entry(add_member_window)
    entry_phone.grid(row=3, column=1, padx=10, pady=5)

    lbl_home_addr = tk.Label(add_member_window, text="Home Address")
    lbl_home_addr.grid(row=4, column=0, padx=10, pady=5)
    entry_home_addr = tk.Entry(add_member_window)
    entry_home_addr.grid(row=4, column=1, padx=10, pady=5)

    lbl_campus_addr = tk.Label(add_member_window, text="Campus Address")
    lbl_campus_addr.grid(row=5, column=0, padx=10, pady=5)
    entry_campus_addr = tk.Entry(add_member_window)
    entry_campus_addr.grid(row=5, column=1, padx=10, pady=5)

    lbl_mem_card_num = tk.Label(add_member_window, text="Member Card Number")
    lbl_mem_card_num.grid(row=6, column=0, padx=10, pady=5)
    entry_mem_card_num = tk.Entry(add_member_window)
    entry_mem_card_num.grid(row=6, column=1, padx=10, pady=5)

    lbl_is_faculty = tk.Label(add_member_window, text="Is a faculty")
    lbl_is_faculty.grid(row=7, column=0, padx=10, pady=5)
    entry_is_faculty = tk.Entry(add_member_window)
    entry_is_faculty.grid(row=7, column=1, padx=10, pady=5)

    # Create button to add member
    btn_add_member = tk.Button(add_member_window, text="Add Member", command=lambda: add_member_to_database(entry_name, entry_address, entry_contact, entry_phone, entry_home_addr, entry_campus_addr, entry_mem_card_num, entry_is_faculty))
    btn_add_member.grid(row=8, columnspan=2, pady=10)



def add_member_to_database(entry_name, entry_address, entry_contact, entry_phone, entry_home_addr, entry_campus_addr, entry_mem_card_num, entry_is_faculty):
    # Get values from entry fields
    member_id = entry_name.get()
    ssn = entry_address.get()
    name = entry_contact.get()
    phone_number = entry_phone.get()
    home_address = entry_home_addr.get()
    campus_address = entry_campus_addr.get()
    member_card_num = entry_mem_card_num.get()
    is_faculty = entry_is_faculty.get()

    # Connect to the MySQL database
    try:
        connection = mysql.connector.connect(host='127.0.0.1',
                                             database='library',
                                             user='root',
                                             password='p@Lhjs1312')

        if connection.is_connected():
            cursor = connection.cursor()
            # Execute SQL query to insert member information into the database
            sql_query = "INSERT INTO Member (Member_ID, SSN, Name, Phone_number, Home_addr, Campus_addr, Mem_card_num, Is_faculty) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(sql_query, (member_id, ssn, name, phone_number, home_address, campus_address, member_card_num, is_faculty))
            connection.commit()
            messagebox.showinfo("Add Member", "Member added successfully.")
            cursor.close()

    except Error as e:
        print("Error while connecting to MySQL", e)
        messagebox.showerror("Error", "Error while connecting to MySQL")

    finally:
        if connection.is_connected():
            connection.close()



def open_add_book_window():
    add_book_window = tk.Toplevel(root)
    add_book_window.title("Add Book")

    # Create the form to add book information inside the new window
    lbl_isbn = tk.Label(add_book_window, text="ISBN:")
    lbl_isbn.grid(row=0, column=0, padx=10, pady=5)
    entry_isbn = tk.Entry(add_book_window)
    entry_isbn.grid(row=0, column=1, padx=10, pady=5)

    lbl_title = tk.Label(add_book_window, text="Title")
    lbl_title.grid(row=1, column=0, padx=10, pady=5)
    entry_title = tk.Entry(add_book_window)
    entry_title.grid(row=1, column=1, padx=10, pady=5)

    lbl_author_name = tk.Label(add_book_window, text="Author Name")
    lbl_author_name.grid(row=2, column=0, padx=10, pady=5)
    entry_author_name = tk.Entry(add_book_window)
    entry_author_name.grid(row=2, column=1, padx=10, pady=5)

    lbl_description = tk.Label(add_book_window, text="Description")
    lbl_description.grid(row=3, column=0, padx=10, pady=5)
    entry_description = tk.Entry(add_book_window)
    entry_description.grid(row=3, column=1, padx=10, pady=5)

    lbl_copies_on_loan = tk.Label(add_book_window, text="Copies on Loan")
    lbl_copies_on_loan.grid(row=4, column=0, padx=10, pady=5)
    entry_copies_on_loan = tk.Entry(add_book_window)
    entry_copies_on_loan.grid(row=4, column=1, padx=10, pady=5)

    lbl_number_of_copies = tk.Label(add_book_window, text="Number of Copies")
    lbl_number_of_copies.grid(row=5, column=0, padx=10, pady=5)
    entry_number_of_copies = tk.Entry(add_book_window)
    entry_number_of_copies.grid(row=5, column=1, padx=10, pady=5)

    lbl_publisher_code = tk.Label(add_book_window, text="Publisher Code")
    lbl_publisher_code.grid(row=6, column=0, padx=10, pady=5)
    entry_publisher_code = tk.Entry(add_book_window)
    entry_publisher_code.grid(row=6, column=1, padx=10, pady=5)

    lbl_genre_id = tk.Label(add_book_window, text="Genre ID")
    lbl_genre_id.grid(row=7, column=0, padx=10, pady=5)
    entry_genre_id = tk.Entry(add_book_window)
    entry_genre_id.grid(row=7, column=1, padx=10, pady=5)

    # Create button to add book
    btn_add_book = tk.Button(add_book_window, text="Add Book", command=lambda: add_book_to_database(entry_isbn, entry_title, entry_author_name, entry_description, entry_copies_on_loan, entry_number_of_copies, entry_publisher_code, entry_genre_id))
    btn_add_book.grid(row=8, columnspan=2, pady=10)

def add_book_to_database(entry_isbn, entry_title, entry_author_name, entry_description, entry_copies_on_loan, entry_number_of_copies, entry_publisher_code, entry_genre_id):
    # Get values from entry fields
    isbn = entry_isbn.get()
    title = entry_title.get()
    author_name = entry_author_name.get()
    description = entry_description.get()
    copies_on_loan = entry_copies_on_loan.get()
    number_of_copies = entry_number_of_copies.get()
    publisher_code = entry_publisher_code.get()
    genre_id = entry_genre_id.get()

    # Connect to the MySQL database
    try:
        connection = mysql.connector.connect(host='127.0.0.1',
                                             database='library',
                                             user='root',
                                             password='p@Lhjs1312')

        if connection.is_connected():
            cursor = connection.cursor()
            # Execute SQL query to insert book information into the database
            sql_query = "INSERT INTO Book (ISBN, Title, Author_name, Description, Copies_on_loan, Number_of_copies, publisher_code, Genre_ID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(sql_query, (isbn, title, author_name, description, copies_on_loan, number_of_copies, publisher_code, genre_id))
            connection.commit()
            messagebox.showinfo("Add Book", "Book added successfully.")
            cursor.close()

    except Error as e:
        print("Error while connecting to MySQL", e)
        messagebox.showerror("Error", "Error while connecting to MySQL")

    finally:
        if connection.is_connected():
            connection.close()





def open_borrow_book_window():
    borrow_window = tk.Toplevel(root)
    borrow_window.title("Borrow Book")

    # Create labels and entry fields for loan ID, member ID, and ISBN
    lbl_loan_id = tk.Label(borrow_window, text="Loan ID")
    lbl_loan_id.grid(row=0, column=0, padx=10, pady=5)
    entry_loan_id = tk.Entry(borrow_window)
    entry_loan_id.grid(row=0, column=1, padx=10, pady=5)

    lbl_member_id = tk.Label(borrow_window, text="Member ID")
    lbl_member_id.grid(row=1, column=0, padx=10, pady=5)
    entry_member_id = tk.Entry(borrow_window)
    entry_member_id.grid(row=1, column=1, padx=10, pady=5)

    lbl_isbn = tk.Label(borrow_window, text="ISBN")
    lbl_isbn.grid(row=2, column=0, padx=10, pady=5)
    entry_isbn = tk.Entry(borrow_window)
    entry_isbn.grid(row=2, column=1, padx=10, pady=5)

    # Create button to handle book borrow
    btn_borrow = tk.Button(borrow_window, text="Borrow Book", command=lambda: handle_book_borrow(entry_loan_id.get(), entry_member_id.get(), entry_isbn.get()))
    btn_borrow.grid(row=3, columnspan=2, pady=10)


def handle_book_borrow(loan_id, member_id, isbn):
    try:
        connection = mysql.connector.connect(host='127.0.0.1',
                                             database='library',
                                             user='root',
                                             password='p@Lhjs1312')

        if connection.is_connected():
            cursor = connection.cursor()

            # Check if the member has already borrowed five books
            count_query = "SELECT COUNT(*) FROM Borrows WHERE Member_ID = %s AND Return_date IS NULL"
            cursor.execute(count_query, (member_id,))
            count = cursor.fetchone()[0]

            if count >= 5:
                messagebox.showerror("Borrow Book", "Maximum books borrowed limit reached for this member.")
                return

            # Check if the book is available
            availability_query = "SELECT Copies_on_loan, Number_of_copies FROM Book WHERE ISBN = %s"
            cursor.execute(availability_query, (isbn,))
            copies_on_loan, total_copies = cursor.fetchone()

            if copies_on_loan >= total_copies:
                messagebox.showerror("Borrow Book", "This book is not available for borrowing.")
                return

            # Calculate checkout date, due date, and return date
            checkout_date = datetime.now().date()
            due_date = checkout_date + timedelta(days=21)
            return_date = None

            # Insert new borrow record into Borrows table
            insert_query = "INSERT INTO Borrows (Loan_ID, checkout_date, Due_date, Return_date, Staff_ID, Member_ID, ISBN) VALUES (%s, %s, %s, %s, %s, %s, %s)"
            cursor.execute(insert_query, (loan_id, checkout_date, due_date, return_date, 1, member_id, isbn))
            connection.commit()

            messagebox.showinfo("Borrow Book", "Book borrowed successfully.")

            cursor.close()

    except mysql.connector.Error as e:
        print("Error while connecting to MySQL", e)
        messagebox.showerror("Error", "Error while connecting to MySQL")

    finally:
        if connection.is_connected():
            connection.close()



def open_return_book_window():
    return_window = tk.Toplevel(root)
    return_window.title("Return Book")

    # Create labels and entry fields for loan ID and member ID
    lbl_loan_id = tk.Label(return_window, text="Loan ID")
    lbl_loan_id.grid(row=0, column=0, padx=10, pady=5)
    entry_loan_id = tk.Entry(return_window)
    entry_loan_id.grid(row=0, column=1, padx=10, pady=5)

    lbl_member_id = tk.Label(return_window, text="Member ID")
    lbl_member_id.grid(row=1, column=0, padx=10, pady=5)
    entry_member_id = tk.Entry(return_window)
    entry_member_id.grid(row=1, column=1, padx=10, pady=5)

    # Create text widget to display return receipt
    receipt_text = Text(return_window, height=10, width=50)
    receipt_text.grid(row=2, column=0, columnspan=2, padx=10, pady=5)

    # Create button to handle book return
    btn_return = tk.Button(return_window, text="Return Book", command=lambda: handle_book_return(entry_loan_id.get(), entry_member_id.get(), receipt_text))
    btn_return.grid(row=3, column=0, columnspan=2, pady=10)


def handle_book_return(loan_id, member_id, receipt_text):
    try:
        connection = mysql.connector.connect(host='127.0.0.1',
                                             database='library',
                                             user='root',
                                             password='p@Lhjs1312')

        if connection.is_connected():
            cursor = connection.cursor()

            # Retrieve borrowing record for the loan ID and member ID
            query = "SELECT * FROM Borrows WHERE Loan_ID = %s AND Member_ID = %s"
            cursor.execute(query, (loan_id, member_id))
            borrowing_record = cursor.fetchone()

            if borrowing_record:
                # Check if the book has already been returned
                if borrowing_record[3] is not None:
                    messagebox.showinfo("Return Book", "This book has already been returned.")
                    return

                # Calculate borrowing and return dates
                borrowed_date = borrowing_record[1]
                return_date = datetime.now().date()
                due_date = borrowing_record[2]

                # Calculate duration of borrowing
                duration = (return_date - borrowed_date).days

                # Update Borrows table to mark the book as returned
                update_query = "UPDATE Borrows SET Return_date = %s WHERE Loan_ID = %s"
                cursor.execute(update_query, (return_date, loan_id))
                connection.commit()

                # Retrieve book details using ISBN
                isbn = borrowing_record[6]
                book_query = "SELECT * FROM Book WHERE ISBN = %s"
                cursor.execute(book_query, (isbn,))
                book_details = cursor.fetchone()

                # Display return receipt in the text widget
                receipt_text.insert(tk.END, "Return Receipt:\n")
                receipt_text.insert(tk.END, f"Loan ID: {loan_id}\n")
                receipt_text.insert(tk.END, f"Member ID: {member_id}\n")
                receipt_text.insert(tk.END, f"ISBN: {isbn}\n")
                if book_details:
                    receipt_text.insert(tk.END, f"Book Title: {book_details[1]}\n")
                receipt_text.insert(tk.END, f"Borrowed Date: {borrowed_date}\n")
                receipt_text.insert(tk.END, f"Due Date: {due_date}\n")
                receipt_text.insert(tk.END, f"Return Date: {return_date}\n")
                receipt_text.insert(tk.END, f"Borrowing Duration (days): {duration}\n")

                messagebox.showinfo("Return Book", "Return successful.")
            else:
                messagebox.showerror("Return Book", "No matching borrowing record found.")

            cursor.close()

    except Error as e:
        print("Error while connecting to MySQL", e)
        messagebox.showerror("Error", "Error while connecting to MySQL")

    finally:
        if connection.is_connected():
            connection.close()




def open_renew_membership_window():
    renew_window = tk.Toplevel(root)
    renew_window.title("Renew Membership")

    # Create labels and entry field for member ID or card number
    lbl_member_info = tk.Label(renew_window, text="Card Number")
    lbl_member_info.grid(row=0, column=0, padx=10, pady=5)
    entry_member_info = tk.Entry(renew_window)
    entry_member_info.grid(row=0, column=1, padx=10, pady=5)

    # Create button to renew membership
    btn_renew = tk.Button(renew_window, text="Renew Membership", command=lambda: renew_membership(entry_member_info.get()))
    btn_renew.grid(row=1, columnspan=2, pady=10)


def renew_membership(card_number):
    try:
        connection = mysql.connector.connect(host='127.0.0.1',
                                             database='library',
                                             user='root',
                                             password='p@Lhjs1312')

        if connection.is_connected():
            cursor = connection.cursor()

            # Check if the input is a card number
            if card_number.isdigit():
                query = "SELECT * FROM Card WHERE Card_number = %s"
                cursor.execute(query, (card_number,))
                card = cursor.fetchone()

                if card:
                    # Calculate new expiry date
                    expiry_date = datetime.now().date() + timedelta(days=365)

                    # Update expiry date in the database
                    update_query = "UPDATE Card SET Expiry_date = %s WHERE Card_number = %s"
                    cursor.execute(update_query, (expiry_date, card_number))
                    connection.commit()

                    messagebox.showinfo("Renew Membership", "Membership renewed successfully.")
                else:
                    messagebox.showerror("Renew Membership", "Card not found.")
            else:
                messagebox.showerror("Renew Membership", "Invalid input. Please enter a valid card number.")

            cursor.close()

    except Error as e:
        print("Error while connecting to MySQL", e)
        messagebox.showerror("Error", "Error while connecting to MySQL")

    finally:
        if connection.is_connected():
            connection.close()


# Create the main window
root = tk.Tk()
root.title("Library Management System")

# Open and resize the background image
bg_image = Image.open("C:/Users/pulij/Desktop/img.png")
bg_image = bg_image.resize((800, 600), Image.ANTIALIAS)

# Convert the image to a format compatible with tkinter
bg_photo = ImageTk.PhotoImage(bg_image)

# Create a label with the background image
background_label = tk.Label(root, image=bg_photo)
background_label.place(x=0, y=0, relwidth=1, relheight=1)

# Create a label for the heading
heading_label = tk.Label(root, text="Library Management", font=("Helvetica", 16, "bold"))
heading_label.pack(side="top", pady=10)

# Create a frame to hold the buttons
button_frame = tk.Frame(root)
button_frame.pack(side="top", pady=10)

# Create buttons for each transaction
btn_add_member = tk.Button(button_frame, text="Add Member", command=open_add_member_window)
btn_add_book = tk.Button(button_frame, text="Add Book", command=open_add_book_window)
btn_add_borrow = tk.Button(button_frame, text="Add Borrow", command=open_borrow_book_window)
btn_handle_return = tk.Button(button_frame, text="Handle Return", command=open_return_book_window)
btn_renew_membership = tk.Button(button_frame, text="Renew Membership", command=open_renew_membership_window)

# Position buttons using the pack layout manager
btn_add_member.pack(side="left", padx=10)
btn_add_book.pack(side="left", padx=10)
btn_add_borrow.pack(side="left", padx=10)
btn_handle_return.pack(side="left", padx=10)
btn_renew_membership.pack(side="left", padx=10)

root.mainloop()
