from mysql.connector import connect

import psutil

def mysql_connection(host, user, passwd, database=None):
    connection = connect(
        host = host,
        user = user,
        passwd = passwd,
        database = 'captura_maquina'
    )
    return connection

connection = mysql_connection('localhost', 'aluno', 'sptech')

#Captura automatica da Porcentagem de uso da CPU E MEMORIA RAM de 2 em 2 segundos
while True:

    processador = psutil.cpu_percent(interval = 3)

    query = '''
    INSERT INTO dados VALUES
    (default,'processador')
            
    '''
    cursor = connection.cursor()
    cursor.execute(query)
    connection.commit()

