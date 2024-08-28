import psutil
import time
import mysql.connector
import platform

db_connection = mysql.connector.connect(host='localhost', user='root', password='947921', database='desafio')
cursor = db_connection.cursor()

sistemaOperacional = platform.system()

nomeMaquina = input("Escolha a máquina que você quer monitorar (m1, m2, m3, m4): ")
componente = input("Escolha o componente que você deseja monitorar (cpu, memoria, disco): ")
metrica = input("Escolha a métrica (a) percentual; b) bytes): ")
tipoMedida = input("Escolha o tipo de medida (a) média por máquina; b) média total): ")


def capturaDeDados():
    if sistemaOperacional == "Windows":
        usoDeDisco = psutil.disk_usage('C:\\')
    elif sistemaOperacional == "Linux":
        usoDeDisco = psutil.disk_usage('/')

    usoDeCPU = psutil.cpu_percent(interval=1)
    freqDeCPU = psutil.cpu_freq()
    usoDeMemo = psutil.virtual_memory()

    qtdNucleos = psutil.cpu_count()
    qtdNucleosVirtuais = psutil.cpu_count(logical=False)

    return usoDeCPU, freqDeCPU.current, usoDeMemo, usoDeDisco, qtdNucleos, qtdNucleosVirtuais


def inserindoDados(usoDeCPU, freqDeCPU, usoDeMemo, usoDeDisco, qtdNucleos, qtdNucleosVirtuais):
    sql = """INSERT INTO registros (nomeMaquina, sistemaOperacional, qtdTotalMemoria, percentualMemoria, qtdTotalDisco, qtdUtilizadaDisco, percentualDisco, qtdNucleosCPU, qtdNucleosVirtuaisCPU, percentualCPU, frequenciaCPU) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)"""
    
    values = (nomeMaquina, sistemaOperacional, usoDeMemo.total, usoDeMemo.percent, usoDeDisco.total, usoDeDisco.used, usoDeDisco.percent, qtdNucleos, qtdNucleosVirtuais, usoDeCPU, freqDeCPU)
    
    cursor.execute(sql, values)
    db_connection.commit()


def mostrarDados(usoDeCPU, usoDeMemo, usoDeDisco):
    if componente == "cpu":
        if metrica == "a":
            print(f"Percentual de uso da CPU: {usoDeCPU:.2f}%")
        else:
            print(f"Frequência da CPU: {freqDeCPU.current:.2f} MHz")
    elif componente == "memoria":
        if metrica == "a":
            print(f"Percentual de uso da memória: {usoDeMemo.percent:.2f}%")
        else:
            print(f"Total de memória: {usoDeMemo.total / (1024 ** 3):.2f} GB")
    elif componente == "disco":
        if metrica == "a":
            print(f"Percentual de uso do disco: {usoDeDisco.percent:.2f}%")
        else:
            print(f"Total de disco: {usoDeDisco.total / (1024 ** 3):.2f} GB")


def main():
    usoDeCPU, freqDeCPU, usoDeMemo, usoDeDisco, qtdNucleos, qtdNucleosVirtuais = capturaDeDados()
    inserindoDados(usoDeCPU, freqDeCPU, usoDeMemo, usoDeDisco, qtdNucleos, qtdNucleosVirtuais)
    
    print("\nMostrando dados coletados em tempo real:\n")
    mostrarDados(usoDeCPU, usoDeMemo, usoDeDisco)

while True:
    main()
    time.sleep(3)