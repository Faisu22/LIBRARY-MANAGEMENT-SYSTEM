import mysql.connector
from config import HOST, USER, PASSWORD, DATABASE

conn = mysql.connector.connect(host=HOST, user=USER, password=PASSWORD, database=DATABASE)
print('connected', conn.is_connected())
cursor = conn.cursor()
cursor.execute("SELECT SCHEMA_NAME FROM information_schema.schemata WHERE SCHEMA_NAME=%s", (DATABASE,))
print(cursor.fetchall())
conn.close()
