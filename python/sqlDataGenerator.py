import sqlite3
import os

"""
保存数据库的数据为insert语句到doc/data.sql文件
"""

# path
base = os.path.abspath(os.path.dirname(os.getcwd()))
sql_path = os.path.join(base, "project.sqlite")
output_path = os.path.join(base, "doc", "data.sql")

connect = sqlite3.connect(sql_path)

text = ""

tables = (
    "academy", "course", "score", "student", "teacher", "user"
)

for table in tables:
    result = connect.execute(f"select * from {table}").fetchall()
    text += f"insert into {table} values "

    for row in result:
        row_data = ", ".join(map(str, [item if isinstance(item, int) else f"'{item}'" for item in row]))
        text += f"({row_data.replace('None', '')}),"

    text = text[:-1] + ";"
    text += "\n\n"

with open(output_path, "w", encoding='utf-8') as f:
    f.write(text)

print("done!")
