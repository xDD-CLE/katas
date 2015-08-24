using System.Linq;

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

            return commaSeparatedNumbers.Split(',').Select(int.Parse).Sum();
        }
    }
}