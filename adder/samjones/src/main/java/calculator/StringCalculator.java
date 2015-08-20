package calculator;

public class StringCalculator {

    private final StringCalculatorTokenizer fStringCalculatorTokenizer;

    public StringCalculator(String theString) {
        fStringCalculatorTokenizer = new StringCalculatorTokenizer(theString);
    }

    public int add() {
        return fStringCalculatorTokenizer.calculate(new CalculateObject() {
            @Override
            public int calculate(int theCurrentValue, int theTokenValue) {
                return theCurrentValue + theTokenValue;
            }
        });
    }

    public int subtract() {
        return fStringCalculatorTokenizer.calculate(new CalculateObject() {
            @Override
            public int calculate(int theCurrentValue, int theTokenValue) {
                return theCurrentValue - theTokenValue;
            }
        });
    }
}
