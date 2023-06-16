import pymysql
from config import host, user, password, bd_name

try:
    connection = pymysql.connect(
        host=host,
        port=3306,
        user=user,
        password=password,
        database=bd_name,
        cursorclass=pymysql.cursors.DictCursor
    )
    print("Successfully")

    try:
        cursor = connection.cursor()
        # drop table
        cursor.execute("DROP TABLE IF EXISTS pups;")
        # create table
        create_query = "CREATE TABLE IF NOT EXISTS pups(" \
                        "id INT PRIMARY KEY AUTO_INCREMENT," \
                        "ProductName VARCHAR(10)," \
                        "Manufacturer VARCHAR(10)," \
                        "ProductCount INT," \
                        "Price INT);"
        cursor.execute(create_query)
        print("Table successfully created")
        # insert
        insert_query = "INSERT pups (ProductName, Manufacturer, ProductCount, Price) " \
                       "VALUES" \
	                   "('iPhone X', 'Apple', 3, 76000)," \
                       "('iPhone 8', 'Apple', 2, 51000)," \
                       "('Galaxy s9', 'Samsung', 2, 56000)," \
                       "('Galaxy s8', 'Samsung', 1, 41000)," \
                       "('P20', 'Huawei', 5, 36000);"
        cursor.execute(insert_query)
        connection.commit()
        print("Insert successfully")
        # update
        update_query = "UPDATE pups SET Price = 0 WHERE ProductCount = 2;"
        connection.commit()
        print("Update successfully")
    finally:
        connection.close()

except Exception as ex:
    print("Disconnected")
    print(ex)

