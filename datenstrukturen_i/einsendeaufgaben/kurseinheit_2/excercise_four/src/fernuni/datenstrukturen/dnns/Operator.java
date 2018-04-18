package fernuni.datenstrukturen.dnns;

public interface Operator {

    /**
     * Sign of this operator.
     * @return Sign as string that represents this operator.
     */
    public String sign();

    /**
     * Number of operands for this calculation.
     * @return Number of operands, that are valid for this calculation.
     */
    public int numOperands();

    /**
     * Actual calculation for this operator.
     * @param operands Operands for this calculation.
     * @return Result of the actual calculation.
     */
    public double calculate(double[] operands);

}
