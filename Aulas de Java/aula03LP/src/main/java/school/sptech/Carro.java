package school.sptech;

public class Carro {
    String fabricante;
    String modelo;
    String cor;
    String placa;
    Double velocidade = 0.0;
    Boolean quebrado = false;

    void acelerar () {
        System.out.println("VRUMMM...");
        velocidade += 10.0;
    }

    void freiar () {
        System.out.println("PSSSHSS...");
        velocidade -= 10.0;
    }

    void colidir () {
        System.out.println("PLAFFTT...");
        quebrado = true;
    }

    void exibirInfo () {
        String texto = """
                  fabricante: %s
                  modelo: %s
                  cor: %s
                  placa: %s
                  velocidade: %.2f
                  quebrado: %s
                """ .formatted(fabricante,modelo,cor,placa,velocidade,quebrado);

        System.out.println(texto);
    }

}
