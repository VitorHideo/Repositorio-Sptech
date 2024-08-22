package school.sptech;

public class TesteCalculadora {
    public static void main(String[] args) {

        Calculadora calc = new Calculadora();


        Integer numero1 = 10;
        Integer numero2 = 2;
        Integer xd = calc.somar(numero1,numero2);

        String a = calc.saudacao();

        Integer lol = calc.somar(numero1,numero2,2);

        System.out.println(a);
        System.out.println(xd);
        System.out.println(lol);
    }
}
