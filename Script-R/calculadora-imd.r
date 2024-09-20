# Script IMC - Automação
chave = 1
while(chave > 0) {
  peso = readline(prompt = "Digite o seu peso: ") 
  peso = as.integer(peso)
  altura = as.numeric(readline(prompt = "Digite a sua altura: "))
  altura = as.double(altura)
  IMC = peso/(altura * altura)
  print(round(IMC, 1))
  
  if (IMC < 18.5) {
    print("Diagnóstico: Abaixo do peso normal")
  } else if (IMC >= 18.5 & IMC < 25) {
    print("Diagnóstico: Peso normal")
  } else if (IMC >= 25 & IMC < 30) {
    print("Diagnóstico: Sobrepeso")
  } else if (IMC >= 30 & IMC < 40) {
    print("Diagnóstico: Obeso")
  } else if (IMC >= 40) {
    print("Diagnóstico: Obesidade Mórbida")
  }
  
  datasetIMC <- rbind(data_imc, data.frame(Peso = peso, Altura = altura, IMC = round(IMC, 1)))
}