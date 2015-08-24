using System.Linq;
using System.Text.RegularExpressions;

namespace katas.AdderKata
{
    public class Adder
    {
        public int Add(string commaSeparatedNumbers)
        {
            if (string.IsNullOrWhiteSpace(commaSeparatedNumbers))
            {
                return 0;
            }

            return Regex.Split(commaSeparatedNumbers, @"[,\n]").Select(int.Parse).Sum();
        }
    }
}