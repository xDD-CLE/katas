using System;
using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;

namespace AdderKata
{
    public class Calculator
    {
        public int Add(string input)
        {
            if (string.IsNullOrEmpty(input))
            {
                return 0;
            }

            var delimiters = GetDelimiters(input);
            var numbers = GetNumbers(input, delimiters);
            VerifyNoNegativeNumbers(numbers);

            return numbers.Sum(x => x);
        }

        private static List<char> GetDelimiters(string values)
        {
            var delimiters = new List<char> {',', '\n'};
            if (values.StartsWith("//"))
            {
                delimiters.Add(Convert.ToChar(values.Substring(2, 1)));
            }

            return delimiters;
        }

        private static List<int> GetNumbers(string values, List<char> delimiters)
        {
            if (values.StartsWith("//"))
            {
                values = values.Substring(4);
            }

            return values.Split(delimiters.ToArray()).Select(s => Convert.ToInt32(s)).ToList();
        }

        private static void VerifyNoNegativeNumbers(List<int> numbers)
        {
            var negativeNumbers = numbers.Where(x => x < 0).ToList();
            if (negativeNumbers.Count > 0)
            {
                var message = "negatives not allowed";
                negativeNumbers.ForEach(x => message += " " + x);
                throw new ArgumentException(message);
            }
        }
    }

    class CalculatorTests
    {
        [Test]
        public void It_Returns_Zero_For_Empty_String()
        {
            //--Arrange
            var calculator = new Calculator();

            //--Act
            int result = calculator.Add(string.Empty);

            //--Assert
            Assert.AreEqual(0, result);
        }

        [Test]
        public void It_Returns_The_Number()
        {
            //--Arrange
            var calculator = new Calculator();
            var value = "5";

            //--Act
            int result = calculator.Add(value);

            //--Assert
            Assert.AreEqual(5, result);
        }

        [Test]
        public void It_Returns_A_Sum()
        {
            //--Arrange
            var calculator = new Calculator();
            var values = "5,27";

            //--Act
            int result = calculator.Add(values);

            //--Assert
            Assert.AreEqual(32, result);
        }

        [Test]
        public void It_Can_Parse_Numbers_On_Different_Lines()
        {
            //--Arrange
            var calculator = new Calculator();
            var values = "5,2\n8";

            //--Act
            int result = calculator.Add(values);

            //--Assert
            Assert.AreEqual(15, result);
        }

        [Test]
        public void It_Supports_Custom_Delimiters()
        {
            //--Arrange
            var calculator = new Calculator();
            var input = "//;\n1;5;8";

            //--Act
            int result = calculator.Add(input);

            //--Assert
            Assert.AreEqual(14, result);
        }

        [Test]
        public void It_Does_Not_Accept_Negative_Numbers()
        {
            //--Arrange
            var calculator = new Calculator();
            var input = "8,-5";

            //--Act/Assert
            Assert.Throws<ArgumentException>(() => calculator.Add(input));
        }

        [Test]
        public void It_Says_Which_Inputs_Were_Invalid()
        {
            //--Arrange
            var calculator = new Calculator();
            var input = "-6,-15";

            //--Act/Assert
            Exception ex = Assert.Throws<ArgumentException>(() => calculator.Add(input));
            Assert.AreEqual("negatives not allowed -6 -15", ex.Message);
        }
    }
}
