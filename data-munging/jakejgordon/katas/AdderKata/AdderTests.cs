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

    }
}
