package sptech.school;

import java.sql.SQLOutput;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Scanner;

public class ExemploData2 {

    public static void main(String[] args) {

        Scanner leitor = new Scanner(System.in);
        DateTimeFormatter formatador = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        System.out.println("Digite uma data:");
        LocalDate dataDigitada = LocalDate.parse(leitor.nextLine(), formatador);

        System.out.println("A data informada é: ");
        System.out.println(dataDigitada.format(formatador));
    }
}
