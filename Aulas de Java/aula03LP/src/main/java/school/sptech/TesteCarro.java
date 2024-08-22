package school.sptech;

public class TesteCarro {
    public static void main(String[] args) {

        Carro marquinhos = new Carro();

        marquinhos.fabricante = "Volks";
        marquinhos.modelo = "Gol quadrado";
        marquinhos.cor = "Vermelho";
        marquinhos.placa = "1234VHF";

        marquinhos.acelerar();
        marquinhos.freiar();


        Carro carro2 = new Carro();

        carro2.fabricante = "Fiat";
        carro2.modelo = "Palio";
        carro2.cor = "Preto";
        carro2.placa = "4321FHV";

        carro2.acelerar();
        carro2.acelerar();

        marquinhos.exibirInfo();
        carro2.exibirInfo();
    }
}
