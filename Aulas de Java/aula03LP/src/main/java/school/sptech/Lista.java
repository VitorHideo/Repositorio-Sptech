package school.sptech;

import java.util.ArrayList;
import java.util.List;

public class Lista {
    public static void main(String[] args) {

        /*
        List listaEstranha = new ArrayList<>();

        listaEstranha.add("Vitor Hideo");
        listaEstranha.add(18);
        listaEstranha.add(true);
        listaEstranha.add(1.78);

        for (int i = 0; i < listaEstranha.size(); i++) {
            System.out.println(listaEstranha.get(i));

        }
        */

        List<String> filmes = new ArrayList<>();

        filmes.add("Matrix");
        filmes.add(0,"HarryPotter");
        System.out.println("Teste add:");
        System.out.println(filmes);


        filmes.remove(0);
        System.out.println("Teste remove:");
        System.out.println(filmes);


        filmes.remove("Matrix");
        System.out.println("Teste remove2:");
        System.out.println(filmes);


        filmes.add("Matrix");
        filmes.add("Matrix 2");
        filmes.add("Matrix 3 agora vai");
        filmes.remove(1);
        System.out.println("Teste remove3:");
        System.out.println(filmes);


        filmes.set(0,"Meu malvado favorito");
        System.out.println("Teste set:");
        System.out.println(filmes);


        String filmeDevolvido = filmes.get(0);
        System.out.println("Teste get:");
        System.out.println(filmeDevolvido);


        System.out.println("Teste com size:");
        System.out.println(filmes.size());


        if (filmes.isEmpty()) {
            System.out.println("Ta vazio");
        } else {
            System.out.println("Não esta vazio");
        }





    }
}
