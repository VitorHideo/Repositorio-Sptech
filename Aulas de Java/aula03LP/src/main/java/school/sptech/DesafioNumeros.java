package school.sptech;

import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class DesafioNumeros {
    public static void main(String[] args) {

        Scanner input = new Scanner(System.in);
        List<Integer> numerosInteiros = new ArrayList<>();

        Integer cont = 0;
        while (cont < 100) {
            cont++;
            System.out.println("Digite um número para adicionar na lista: ");
            Integer valorDigitado = input.nextInt();
            numerosInteiros.add(valorDigitado);

            if (valorDigitado == 0) {
                break;
            }
        }

        Integer soma = 0;

        Integer maior = numerosInteiros.get(0);
        Integer menor = numerosInteiros.get(0);

        for (int i = 0; i < numerosInteiros.size(); i++) {
            Integer numeroAtual = numerosInteiros.get(i);

            soma += numeroAtual;

            if (numeroAtual % 2 == 0) {
                System.out.println("Números pares:" + numeroAtual);
            } else {
                System.out.println("Números impares:" + numeroAtual);
            }

            if (numeroAtual > maior) {
                maior = numeroAtual;
            }
            if (numeroAtual < menor) {
                menor = numeroAtual;
            }

        }
        System.out.println(soma);
        System.out.println(maior);
        System.out.println(menor);
        
    }
}
