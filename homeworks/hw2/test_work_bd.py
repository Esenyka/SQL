import dearpygui.dearpygui as dpg

import model
from model import *


def convert():
    save = dpg.get_value(save_id)
    name = dpg.get_value(name_cur_id)
    male = dpg.get_value(male_cur_id)
    phone = dpg.get_value(num_cur_id)

    status = model.res_save(name, male, phone)

    dpg.set_value(result_id, status)

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
            # insert
            cursor.execute(model.add(name, male, phone))
            connection.commit()
            print("Insert successfully")
        finally:
            connection.close()
    except Exception as ex:
        print("Disconnected")
        print(ex)


def contacts():
    try:
        connection = pymysql.connect(
            host=host,
            port=3306,
            user=user,
            password=password,
            database=bd_name,
            cursorclass=pymysql.cursors.DictCursor
        )
        try:
            cursor = connection.cursor()
            cursor.execute(model.show())
        finally:
            connection.close()
    except Exception as ex:
        print("Disconnected")
        print(ex)


dpg.create_context()

name_cur_id = dpg.generate_uuid()
male_cur_id = dpg.generate_uuid()
num_cur_id = dpg.generate_uuid()
save_id = dpg.generate_uuid()
result_id = dpg.generate_uuid()


dpg.create_viewport(title='Custom Title', width=600, height=300)

with dpg.window(label="Example Window", width=600, height=150):
    dpg.add_text(label=f"All contacts - {contacts()}")
    dpg.add_input_text(label="first_name", default_value="Write name...", tag=name_cur_id)
    dpg.add_input_text(label="male", default_value="Write m or w...", tag=male_cur_id)
    dpg.add_input_text(label="phone_number", default_value="Write number...", tag=num_cur_id)
    dpg.add_button(label="Save", callback=convert, tag=save_id)
    dpg.add_text("", tag=result_id)


dpg.setup_dearpygui()
dpg.show_viewport()
dpg.start_dearpygui()
dpg.destroy_context()




