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
    }
}
