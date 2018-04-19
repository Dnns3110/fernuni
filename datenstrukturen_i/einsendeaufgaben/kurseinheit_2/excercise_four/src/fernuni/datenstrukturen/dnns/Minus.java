package fernuni.datenstrukturen.dnns;

public class Minus implements Operator {

    /**
     * Minus sign.
     *
     * @return "-".
     */
    @Override
    public String sign() {
        return "-";
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
     * Actual subtraction.
     *
     * @param operands Operands that should be subtracted from each other.
     * @return Result of the subtraction.
     */
    @Override
    public double calculate(double[] operands) {
        // Input validation. To ensure, that there will be no Out of bounds Exception while actual calculation.
        if (operands.length != numOperands()) {
            return 0;
        }

        return operands[0] - operands[1];
    }
}
