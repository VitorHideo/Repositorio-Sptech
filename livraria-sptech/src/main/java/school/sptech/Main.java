package school.sptech;

import org.apache.commons.dbcp2.DelegatingStatement;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Scanner;

public class Main {
    public static void main(String[] args) {

        System.out.println("""
                +------------------------+
                |  Livraria SPTECH       |
                +------------------------+
                | 1) Cadastrar Livros    |
                | 2) Exibir Livros       |
                | 3) Atualizar Livros    |
                | 4) Buscar por nome     |
                | 6) Sair                |
                +------------------------+
               
                """);

        Scanner scanner = new Scanner(System.in);
        System.out.println("Escolha uma opção: ");
        Integer opcao = scanner.nextInt();

        if (opcao == 1) {

        } else if (opcao == 2){

        } else if (opcao == 3){

        } else if (opcao ==4) {
        }

    }
}



