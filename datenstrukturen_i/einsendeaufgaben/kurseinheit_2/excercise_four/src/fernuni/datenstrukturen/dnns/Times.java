package fernuni.datenstrukturen.dnns;

public class Times implements Operator {
    /**
     * Multiplication sign.
     *
     * @return Sign as string that represents this operator.
     */
    @Override
    public String sign() {
        return "*";
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
     * Actual multiplication.
     *
     * @param operands Operands that should be multiplied.
     * @return Result of multiplication.
     */
    @Override
    public double calculate(double[] operands) {
        if (operands.length != numOperands()) {
            return 0;
        }

        return operands[0] * operands[1];
    }
}
