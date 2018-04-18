package fernuni.datenstrukturen.dnns;

import java.util.Stack;
import java.util.StringTokenizer;

public class Postfix {

    public Operator[] operators;

    public Postfix(Operator[] operators) {
        this.operators = operators;
    }

    public double eval(String expr) {
        Stack<Double> operands = new Stack<>();
        StringTokenizer tokenizer = new StringTokenizer(expr);
        double result = 0;

        // Process expression token by token.
        while(tokenizer.hasMoreTokens()) {
            String token = tokenizer.nextToken();
            boolean isOperator = false;

            // Check, if current token is an operator or not.
            for(Operator operator : operators) {
                if (token.equals(operator.sign())) {
                    isOperator = true;

                    // Process operation of the current operator.
                    double[] ops = new double[operator.numOperands()];

                    for (int i = 0; i < operator.numOperands(); i++) {
                        ops[i] = operands.pop();
                    }

                    result = operator.calculate(ops);

                    // Push result of the current operation on top of the operands stack for the next calculation.
                    operands.push(result);
                }
            }

            // If current token is no operator it is an operand and needs to be pushed to operand stack.
            if (!isOperator) {
                try {
                    double operand = Double.parseDouble(token);
                    operands.push(operand);
                } catch (Exception e) {
                    System.out.println(token + " is neither a number nor a valid operator!");
                }
            }
        }

        return result;
    }
}
