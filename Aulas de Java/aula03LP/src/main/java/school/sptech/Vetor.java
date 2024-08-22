package school.sptech;

import java.util.Scanner;

public class Vetor {
    public static void main(String[] args) {

        /*
            No javaScript:
            var meuVetor = []
            var meuVetor2 = [1,2,3,4,5]
            var meuVetor3 = ["Bom dia", 2]

            No java Vetores "suportam" apenas um tipo e tem tamanho fixo

         */

        Object[] bizzaro = new Object[10];

        String[] nomes = new String[5];
        Integer[] numerosInteiros = new Integer[5];

        for (int i = 0; i < nomes.length ; i++) {
            nomes[i] = "TESTE";
            //System.out.println(i);
            //System.out.println(nomes[i]);
        }

        for (int i = 0; i < nomes.length; i++) {
            System.out.println(nomes[i]);
        }

        String[] nomeFilmes = {"Titanic", "Matrix", "Lagoa Azul"};
        Integer[] numerosInteiros2 = {1,32,3221,425,123};


        Scanner in = new Scanner(System.in);
        System.out.println("Digite a quantidade de numeros de deseja:");
        Integer quantidade = in.nextInt();

        Integer[] numerosEscolhidos = new Integer[quantidade];

        for (int i = 0; i < numerosEscolhidos.length ; i++) {
            System.out.println("Digite o %d numero".formatted(i + 1));
            numerosEscolhidos[i] = in.nextInt();
        }

        // toString () tenta converter para text
        System.out.println(numerosEscolhidos); //Isso ira exibir uma alocação de memória (endereço)

        // For each --> for aprimorado (enhanced)
        for (Integer inteiroDaVez: numerosEscolhidos) {
            System.out.println(inteiroDaVez);
        }

        // Mesma coisa do que o de cima
        for (int i = 0; i < numerosEscolhidos.length; i++) {
            Integer numeroDaVez = numerosEscolhidos[i];
            System.out.println(numeroDaVez);
        }

    }
}
