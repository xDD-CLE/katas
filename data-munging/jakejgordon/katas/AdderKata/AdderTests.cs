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

        [TestCase("0")]
        [TestCase("1")]
        [TestCase("2")]
        [TestCase("99")]
        public void ItReturnsTheNumberThatWasPassedInIfThereIsOnlyOneNumber(string theNumberPassedIn)
        {
            var result = adder.Add(theNumberPassedIn);

            Assert.That(result, Is.EqualTo(int.Parse(theNumberPassedIn)));
        }
    }
}
