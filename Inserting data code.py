#!/usr/bin/env python
# coding: utf-8

# In[1]:


pip install mysql-connector-python


# In[30]:


import csv
import mysql.connector

# Function to establish a connection to the MySQL database
def connect_to_database():
    try:
        connection = mysql.connector.connect(
            host='127.0.0.1',
            user='root',
            password="p@Lhjs1312",
            database="library"
        )
        return connection
    except mysql.connector.Error as error:
        print("Failed to connect to MySQL database:", error)
        return None

# Function to read data from a CSV file and insert it into a MySQL table
def load_data_from_csv(csv_filename, table_name):
    try:
        connection = connect_to_database()
        if connection:
            cursor = connection.cursor()

            with open(csv_filename, 'r') as csvfile:
                csv_reader = csv.reader(csvfile)
                next(csv_reader)  # Skip header row
                for row in csv_reader:
                    insert_query = f"INSERT INTO {table_name} VALUES ({', '.join(['%s']*len(row))})"
                    cursor.execute(insert_query, row)

            connection.commit()
            print(f"Data from {csv_filename} inserted into {table_name} table successfully.")

            cursor.close()
            connection.close()
    except Exception as e:
        print("Error loading data from CSV:", e)

# Load data from CSV files into MySQL tables
if __name__ == "__main__":
    load_data_from_csv("C:/Users/pulij/Desktop/DATABse/book_table.txt", "Book")
    load_data_from_csv("C:/Users/pulij/Desktop/DATABse/publisher_table.txt", "Publisher")
    load_data_from_csv("C:/Users/pulij/Desktop/DATABse/Member_table.txt", "Member")
    load_data_from_csv("C:/Users/pulij/Desktop/DATABse/staff_table.txt", "Staff")
    load_data_from_csv("C:/Users/pulij/Desktop/DATABse/borrows_table.txt", "Borrows")
    load_data_from_csv("C:/Users/pulij/Desktop/DATABse/physical_presence_table.txt", "Physical_presence")
    load_data_from_csv("C:/Users/pulij/Desktop/DATABse/Genre_table.txt", "Genre")
    load_data_from_csv("C:/Users/pulij/Desktop/DATABse/card_table.txt", "Card")
    
    
    
    
    
    


# In[25]:





# In[ ]:




