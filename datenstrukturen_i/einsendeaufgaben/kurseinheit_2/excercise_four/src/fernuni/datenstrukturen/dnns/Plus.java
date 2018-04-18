package fernuni.datenstrukturen.dnns;

public class Plus implements Operator {

    /**
     * PLus sign.
     *
     * @return "+".
     */
    @Override
    public String sign() {
        return "+";
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
     * Actual addition.
     *
     * @param operands Operands that should be subtracted from each other.
     * @return Result of the subtraction.
     */
    @Override
    public double calculate(double[] operands) {
        if (operands.length != numOperands()) {
            return 0;
        }

        return operands[0] + operands[1];
    }
}
