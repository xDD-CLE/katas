using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;

namespace Katas.Kata04
{
    public class Kata04
    {
        const int COLUMN_INDEX_DAY_NUMBER = 0;
        const int COLUMN_INDEX_MAXIMUM_TEMPERATURE = 1;
        const int COLUMN_INDEX_MINIMUM_TEMPERATURE = 2;

        public void FindSmallestTemperatureSpread()
        {
            var fileContents = File.ReadAllText(@"Data\weather.dat");

            var tableRows = this.GetTableRows(fileContents);
            RemoveAnyRowsThatArentForADayOfTheMonth(tableRows);
            var table = this.GetTableWithRowsAndColumns(tableRows);
            var temperatureSpreads = this.GetTemperatureSpreads(table);
            var dayWithLowestTemperatureSpread = this.GetDayWithLowestTemperatureSpread(temperatureSpreads);
            Debug.WriteLine(string.Format("The day with the lowest temperature spread is day {0}", dayWithLowestTemperatureSpread));
        }

        private static void RemoveAnyRowsThatArentForADayOfTheMonth(List<string> tableRows)
        {
            var rowsToRemove = new List<string>();
            foreach (var row in tableRows)
            {
                decimal placeHolder;
                if (row.Length < 4 || !decimal.TryParse(row.Substring(0, 4), out placeHolder))
                {
                    rowsToRemove.Add(row);
                }
            }

            rowsToRemove.ForEach(rowToRemove => tableRows.Remove(rowToRemove));
        }

        public virtual List<string> GetTableRows(string entireFile)
        {
            return Regex.Split(entireFile, "\n").ToList();
        }

        public virtual List<List<decimal>> GetTableWithRowsAndColumns(List<string> unparsedRows)
        {
            const string REGEX_ANYTHING_BUT_NUMBERS_AND_PERIOD = @"[^0-9\.]+";
            return unparsedRows.Select(row => Regex.Split(row.Trim(), REGEX_ANYTHING_BUT_NUMBERS_AND_PERIOD).ToList())
                .Select(singleRowColumns => singleRowColumns.Select(decimal.Parse).ToList())
                    .ToList();
        }

        public Dictionary<int, decimal> GetTemperatureSpreads(List<List<decimal>> table)
        {
            return table.Select(row => new
            {
                DayNumber = row[COLUMN_INDEX_DAY_NUMBER],
                TemperatureSpread = (row[COLUMN_INDEX_MAXIMUM_TEMPERATURE] - row[COLUMN_INDEX_MINIMUM_TEMPERATURE])
            }).ToDictionary(anonymousResult => (int)anonymousResult.DayNumber, anonymousResult => anonymousResult.TemperatureSpread);
        }

        private int GetDayWithLowestTemperatureSpread(Dictionary<int, decimal> dayToTemperatureSpread)
        {
            decimal minValue = dayToTemperatureSpread.Min(entry => entry.Value);
            return dayToTemperatureSpread.First(entry => entry.Value == minValue).Key;
        }
    }
}
