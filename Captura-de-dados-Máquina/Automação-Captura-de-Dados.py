import psutil
import mysql.connector

# Config dos dados do MYSQL, usuario, senha, host e nome da database
db_config = {
    'user': 'root',
    'password': '947921',
    'host': 'localhost',
    'database': 'captura'
}

# Config da conexão com banco de dados
conn = mysql.connector.connect(**db_config)
cursor = conn.cursor()

while True:

    # Dados do processar de 2 a 2 segundos
    processador = psutil.cpu_percent(interval=2) 
    print(processador)

    # Comando de instrução para fazer a inserção no banco
    query = "INSERT INTO dados (processador) VALUES (%s)"
    cursor.execute(query, (processador,))
    conn.commit()

# Para para é preciso usar o CTRL + C no terminal