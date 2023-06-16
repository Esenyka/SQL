import pymysql
from config import host, user, password, bd_name


def res_save(n, m, num):
    if m == 'm':
        m = 'men'
    else:
        m = 'woman'
    return f"contact {n}, {m}, phone-{num} was saved"


def create():
    return f"CREATE TABLE IF NOT EXISTS phone_book(" \
           "id INT PRIMARY KEY AUTO_INCREMENT," \
           "first_name VARCHAR(10)," \
           "male CHAR(1)),"\
           "phone_num VARCHAR(20);"


def add(first_name, male, phone_number):
    return "INSERT phone_book (first_name, male, phone_number) " \
            "VALUES" \
            f"('{first_name}', '{male}', {phone_number});"


def show():
    return "SELECT * FROM phone_book;"

