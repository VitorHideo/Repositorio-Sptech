package sptech.school;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

public class ExemploData {

    public static void main(String[] args) {

        /*
                Date yyyy/MM/dd
                DateTime yyyy/MM/dd : hh:mm:ss
                -------------------------------
                Calendar
                ZonedDateTime
                GregorianCalendar
                Offset
         */

        DateTimeFormatter formatador = DateTimeFormatter.ofPattern("dd/MM/yyyy");

        LocalDate dataAtual = LocalDate.now();
        LocalDate outraData = LocalDate.of(1910,9,01);

        if (dataAtual.isAfter(outraData)) {
            System.out.println("É posterior");
        } else {
            System.out.println("Antecede");
        }

        DayOfWeek diaDaSemana = dataAtual.getDayOfWeek();
        System.out.println("Dia semana:" + diaDaSemana);


        System.out.println(formatador.format(dataAtual));
        System.out.println(formatador.format(outraData));

        LocalDateTime dataHora = LocalDateTime.now();
        System.out.println("Data e Hora: " + dataHora);
    }
}
