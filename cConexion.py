# Create a SQL Server database connection
from os import getenv
import pymssql

server = getenv("127.0.0.1")
user = getenv("sa")
password = getenv("150480")

def CrearConexion(server, user, password):

    conn = pymssql.connect(server, user, password, "dbExperimental")

    return conn

def CerrarConexion(conn):

    try:
        conn.close()
    except pymssql.TypeError:
        pass