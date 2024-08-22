package school.sptech;

import java.util.function.ToDoubleBiFunction;

public class Calculadora {

    //métodos e atributos
    /*
        Uma classe é uma receita
        dado esse receita, você pode gerar uma "instancia"
        Calculadora calc = new Calculador();  // instancia

        Atributos (campos):
        Interger numeroOperações = 0

        Método(função):
        function somar (num1, num2) {
            soma = num1 + num2
        }

        void somar (Interger num1, num2) { Java
            ...
        }
     */

    Integer quantidadeOperacoes = 0;

    Integer somar (Integer num1, Integer num2) {
        //System.out.println(num1 + num2);
        quantidadeOperacoes++;
        Integer resultado = num1 + num2;
        return resultado;
    }

    // Sobrecarga do metodo somar
    // Overload
    Integer somar (Integer num1, Integer num2, Integer num3) {
        //System.out.println(num1 + num2);
        quantidadeOperacoes++;
        Integer resultado = num1 + num2 + num3;
        return resultado;
    }

    String saudacao(){
        return "Olá";
    }

}
