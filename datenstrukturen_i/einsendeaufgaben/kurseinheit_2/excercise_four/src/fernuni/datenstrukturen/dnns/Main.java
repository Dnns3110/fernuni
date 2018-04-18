package fernuni.datenstrukturen.dnns;

public class Main {

    public static void main(String[] args) {

        Operator[] operators = new Operator[4];
        operators[0] = new Plus();
        operators[1] = new Minus();
        operators[2] = new Times();
        operators[3] = new Divided();

        System.out.println(new Postfix(operators).eval("7 3 5 + * 29 *"));
    }
}
