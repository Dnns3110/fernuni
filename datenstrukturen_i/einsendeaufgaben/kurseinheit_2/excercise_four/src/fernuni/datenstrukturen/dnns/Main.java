package fernuni.datenstrukturen.dnns;

public class Main {

    public static void main(String[] args) {

        Operator[] operators = new Operator[4];
        Postfix postfix;

        // Create Operator objects for valid operators and pass them to the new created Postfix object.
        operators[0] = new Plus();
        operators[1] = new Minus();
        operators[2] = new Times();
        operators[3] = new Divided();
        postfix = new Postfix(operators);

        // Process all expressions from arguments.
        for (String expr : args) {
            System.out.println(postfix.eval(expr));
        }
    }
}
