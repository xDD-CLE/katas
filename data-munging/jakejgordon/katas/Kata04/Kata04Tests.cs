using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;

namespace Katas.Kata04
{
	[TestFixture]
    public class Kata04Tests
	{
	    private Kata04 kata04;

	    [SetUp]
	    public void SetUp()
	    {
	        kata04 = new Kata04();
	    }

	    [Test]
	    public void DoIt()
	    {
			kata04.FindSmallestTemperatureSpread();
	    }

	    [Test]
	    public void ItGetsRowsBasedOnTheNewLineCharacter()
	    {
            const string FOUR_ROWS = @"  Dy MxT   MnT   AvT   HDDay  AvDP 1HrP TPcpn WxType PDir AvSp Dir MxS SkyC MxR MnR AvSLP

   1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5
   2  79    63    71          46.5       0.00         330  8.7 340  23  3.3  70 28 1004.5";

	        var results = kata04.GetTableRows(FOUR_ROWS);

            Assert.That(results.Count, Is.EqualTo(4));
	    }

	    [Test]
	    public void ItGetsColumnsBasedOnWhiteSpace()
	    {
	        const string SINGLE_ROW = @"  1  88    59    74          53.8       0.00 F       280  9.6 270  17  1.6  93 23 1004.5";
	        var tableWithSingleRow = new List<string>
	        {
	            SINGLE_ROW
	        };
            
            var results = kata04.GetTableWithRowsAndColumns(tableWithSingleRow);

            Assert.That(results.Count, Is.EqualTo(1));
            Assert.That(results[0].Count, Is.EqualTo(14));
            Assert.That(results[0][13], Is.EqualTo(1004.5));
	    }

	    [Test]
	    public void ItGetsTheTemperatureSpreads()
	    {
	        const int DAY_NUMBER_ONE = 1;
	        const int DAY_NUMBER_TWO = 2;
	        var table = new List<List<decimal>>
	        {
	            new List<decimal>
	            {
	                DAY_NUMBER_ONE,
	                100,
	                0
	            },
	            new List<decimal>
	            {
	                DAY_NUMBER_TWO,
	                100,
	                99
	            }
	        };

	        var results = kata04.GetTemperatureSpreads(table);

            Assert.That(results[DAY_NUMBER_ONE], Is.EqualTo(100));
            Assert.That(results[DAY_NUMBER_TWO], Is.EqualTo(1));
	    }
    }
}
