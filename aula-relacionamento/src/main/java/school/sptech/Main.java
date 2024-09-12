package school.sptech;

public class Main {
    public static void main(String[] args) {

        Contato c1 = new Contato("Vitor", "11920492123");
        Contato c2 = new Contato("Hideo", "119289312220");

        Grupo grupo1 = new Grupo("Sptech");

        grupo1.adiciona(c1);
        grupo1.adiciona(c2);

        System.out.println(grupo1.getContatos());

    }
}