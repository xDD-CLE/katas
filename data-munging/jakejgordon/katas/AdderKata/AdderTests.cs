using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

namespace katas.AdderKata
{
    [TestFixture]
    public class AdderTests
    {
        private Adder adder;

        [SetUp]
        public void SetUp()
        {
            adder = new Adder();
        }

        [Test]
        public void ItReturnsZeroIfThereIsOnlyAnEmptyString()
        {
            var result = adder.Add(string.Empty);

            Assert.That(result, Is.EqualTo(0));
        }

        [TestCase("0", Result = 0)]
        [TestCase("1", Result = 1)]
        [TestCase("2", Result = 2)]
        [TestCase("99", Result = 99)]
        public int ItReturnsTheNumberThatWasPassedInIfThereIsOnlyOneNumber(string theNumberPassedIn)
        {
            return adder.Add(theNumberPassedIn);
        }

        [TestCase("0,0", Result = 0)]
        [TestCase("0,1", Result = 1)]
        [TestCase("1,0", Result = 1)]
        [TestCase("1,1", Result = 2)]
        [TestCase("11,22", Result = 33)]
        [TestCase("100,200", Result = 300)]
        public int ItReturnsTheSumOfTwoNumbers(string commaSeparatedNumberList)
        {
            return adder.Add(commaSeparatedNumberList);
        }

        [TestCase("0,0,0", Result = 0)]
        [TestCase("1,2,3", Result = 6)]
        [TestCase("1,2,3,4,5,6,7", Result = 28)]
        public int ItReturnsTheSumOfAllNumbersPassedInRegardlessOfHowMany(string commaSeparatedNumberList)
        {
            return adder.Add(commaSeparatedNumberList);
        }
    }
}
