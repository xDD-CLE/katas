﻿using System.Linq;
using katas.AdderKata;
using NUnit.Framework;

namespace AdderKata
{
    [TestFixture]
    public class AdderTests
    {
        private Adder adder;

        [SetUp]
        public void SetUp()
        {
            this.adder = new Adder();
        }

        [Test]
        public void ItReturnsZeroIfThereIsOnlyAnEmptyString()
        {
            var result = this.adder.Add(string.Empty);

            Assert.That(result, Is.EqualTo(0));
        }

        [TestCase("0", Result = 0)]
        [TestCase("1", Result = 1)]
        [TestCase("2", Result = 2)]
        [TestCase("99", Result = 99)]
        public int ItReturnsTheNumberThatWasPassedInIfThereIsOnlyOneNumber(string theNumberPassedIn)
        {
            return this.adder.Add(theNumberPassedIn);
        }

        [TestCase("0,0", Result = 0)]
        [TestCase("0,1", Result = 1)]
        [TestCase("1,0", Result = 1)]
        [TestCase("1,1", Result = 2)]
        [TestCase("11,22", Result = 33)]
        [TestCase("100,200", Result = 300)]
        public int ItReturnsTheSumOfTwoNumbers(string commaSeparatedNumberList)
        {
            return this.adder.Add(commaSeparatedNumberList);
        }

        //TODO discuss the fact that this test never failed. The amount of code to satisfy the previous test AND this one at the same time
        // was less than the code to satisfy only the first.
        [TestCase("0,0,0", Result = 0)]
        [TestCase("1,2,3", Result = 6)]
        [TestCase("1,2,3,4,5,6,7", Result = 28)]
        public int ItReturnsTheSumOfAllNumbersPassedInRegardlessOfHowMany(string commaSeparatedNumberList)
        {
            return this.adder.Add(commaSeparatedNumberList);
        }

        [Test]
        public void ItAcceptsNewlineDelimitedNumbers()
        {
            var result = this.adder.Add("1\n1");

            Assert.That(result, Is.EqualTo(2));
        }

        //TODO discuss the fact that this test never failed. The amount of code to satisfy the previous test AND this one at the same time
        // was less than the code to satisfy only the first.
        [Test]
        public void ItAcceptsBothNewlineAndCommaDelimitersAtTheSameTime()
        {
            var result = this.adder.Add("1\n1,1");

            Assert.That(result, Is.EqualTo(3)); 
        }

        [Test]
        public void ItSupportsSpecifyingADelimiter()
        {
            var result = this.adder.Add("//p\n1p1p1");

            Assert.That(result, Is.EqualTo(3));
        }

        [Test]
        public void ItSupportsDelimitersThatAreMultipleCharacters()
        {
            var result = this.adder.Add("//foobar\n1foobar2foobar3");

            Assert.That(result, Is.EqualTo(6));
        }

        [Test]
        public void ItThrowsANegativesNotAllowedExceptionIfOneOfTheNumbersAreNegative()
        {
            const string EXPECTED_MESSAGE = "Negatives are not allowed. You tried to pass: '-1'";
            var actualException = Assert.Throws<NegativesNotAllowedException>(() => this.adder.Add("-1"));

            Assert.That(actualException.Message, Is.EqualTo(EXPECTED_MESSAGE));
        }

        [Test]
        public void ItHandlesMultipleNegatives()
        {
            var expectedException = new NegativesNotAllowedException(-1, -2, -3);

            var actualException = Assert.Throws<NegativesNotAllowedException>(() => this.adder.Add("-1,-2,-3"));

            Assert.That(actualException.Message, Is.EqualTo(expectedException.Message));
        }

        [Test]
        public void ItTreatsNumbersGreaterThan1000As0()
        {
            var result = this.adder.Add("1000,2000,3000,999,0");

            Assert.That(result, Is.EqualTo(999));
        }

        [Test]
        public void ItAllowsMultipleDelimitersToBeSpecified()
        {
            var result = this.adder.Add("//[p][q]\n1p1q1");

            Assert.That(result, Is.EqualTo(3)); 
        }

        [Test]
        public void ItAllowsDelimitersAndEscapesSpecialRegexCharacters()
        {
            var result = this.adder.Add("//[_.][*#%]\n1_.1*#%1");

            Assert.That(result, Is.EqualTo(3));  
        }

    }
}
