package fernuni.datenstrukturen.dnns;

public class Divided implements Operator {
    /**
     * Divided sign.
     *
     * @return "/".
     */
    @Override
    public String sign() {
        return "/";
    }

    /**
     * Number of operands for this calculation.
     *
     * @return 2.
     */
    @Override
    public int numOperands() {
        return 2;
    }

    /**
     * Actual division.
     *
     * @param operands Operands for division.
     * @return Result of division.
     */
    @Override
    public double calculate(double[] operands) {
        // Input validation. To ensure, that there will be no Out of bounds Exception while actual calculation.
        if (operands.length != numOperands()) {
            return 0;
        }

        // Handle division by zero.
        if (operands[1] == 0) {
            System.out.println("Divide by zero is not allowed!");
            return 0;
        }

        return operands[0] / operands[1];
    }
}
