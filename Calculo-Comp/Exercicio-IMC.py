#Exercicio 01
peso=float(input('Quanto você pesa em kg? (kg)'))
altura=float(input('Qual sua altura em M? (M)'))

IMC = peso / (altura**2)

print('O seu IMC é de {:.1f}'.format(IMC))



#Exercicio 02
peso=float(input('Quanto você pesa em kg? (kg)'))
altura=float(input('Qual sua altura em M? (M)'))

IMC = peso / (altura**2)

print('O seu IMC é de {:.1f}'.format(IMC)) 

if IMC <= 18.5:
  print('Diagnóstico: Abaixo do peso normal')
elif IMC >= 18.5 and IMC <25:
  print('Diagnóstivo: Peso normal')
elif IMC >= 25 and IMC <30:
  print('Diagnóstico: Sobrepeso')
elif IMC >= 30 and IMC <40:
  print('Diagnóstico: Obeso')
elif IMC >= 40:
  print('Diagnóstico: Obesidade Mórbida')


#Exercicio 03
peso=float(input('Quanto você pesa em Kg? (kg) '))
altura=float(input('Quanto você mede em altura? (m)'))

IMC = peso/(altura**2)

print('O seu IMC é de {:.1f}'.format(IMC))

if IMC < 18.5:
  print('Diagnóstico: Abaixo do peso normal') 
elif 18.5 <= IMC <25:
  print('Diagnóstico: peso normal') 
elif 25 <= IMC <30:
  print('Diagnóstico: sobrepeso')
elif 30 <= IMC <40:
  print('Diagnóstico: obeso') 
elif IMC >= 40:
  print('Diagnóstico: obesidade mórbida')


#Exercicio 04
peso=float(input('Quanto você pesa em kg? (kg)'))
altura=float(input('Qual sua altura em M? (M)'))

IMC = peso / (altura**2)

print('O seu IMC é de {:.2f}'.format(IMC))


#Desafio, programa em LOOP
while True:
    peso = float(input('Quanto você pesa em kg? (kg) '))
    altura = float(input('Qual sua altura em M? (M) '))

    IMC = peso / (altura ** 2)

    print('O seu IMC é de {:.1f}'.format(IMC))

    if IMC < 18.5:
        print('Diagnóstico: Abaixo do peso normal')
    elif 18.5 <= IMC < 25:
        print('Diagnóstico: Peso normal')
    elif 25 <= IMC < 30:
        print('Diagnóstico: Sobrepeso')
    elif 30 <= IMC < 40:
        print('Diagnóstico: Obeso')
    elif IMC >= 40:
        print('Diagnóstico: Obesidade Mórbida')

# Nesse caso o programa está em loop infinito, a unica maneira que parar a execução é utilizando o CRTL + C no terminal !!!