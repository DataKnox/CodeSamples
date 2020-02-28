import pyodbc

conn = pyodbc.connect(
    'DRIVER={ODBC Driver 17 for SQL Server};SERVER=localhost,1401;DATABASE=WideWorldImporters;UID=sa;PWD=MyStrongPw!23')

cursor = conn.cursor()

cursor.execute(
    "select PurchaseOrderId, SupplierId from Purchasing.PurchaseOrders")

rows = cursor.fetchall()
# print(rows)
for row in rows:
    print(row.PurchaseOrderId, row.SupplierId)
