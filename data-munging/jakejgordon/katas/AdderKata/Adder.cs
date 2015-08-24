using System.ComponentModel;
using System.Linq;
using System.Text.RegularExpressions;

namespace katas.AdderKata
{
    public class Adder
    {
        private const string DELIMETER_SPECIFIER = @"//.*\n";
        private static readonly Regex DELIMITER_SPECIFIER_REGEX = new Regex(@"//.*\n");

        public int Add(string commaSeparatedNumbers)
        {
            if (string.IsNullOrWhiteSpace(commaSeparatedNumbers))
            {
                return 0;
            }

            string delimetersRegex = "[,\n]";
            if (Adder.DELIMITER_SPECIFIER_REGEX.IsMatch(commaSeparatedNumbers))
            {
                int indexOfFirstNewline = commaSeparatedNumbers.IndexOf('\n');
                const int NUMBER_OF_NEWLINE_SLASHES = 2;
                int numberOfCharactersOfTheDelimiter = indexOfFirstNewline - NUMBER_OF_NEWLINE_SLASHES;
                string specifiedDelimeter = commaSeparatedNumbers.Substring(NUMBER_OF_NEWLINE_SLASHES, numberOfCharactersOfTheDelimiter);
                delimetersRegex = specifiedDelimeter;
                commaSeparatedNumbers = commaSeparatedNumbers.Substring(indexOfFirstNewline);
            }

            return Regex.Split(commaSeparatedNumbers, delimetersRegex).Select(int.Parse).Sum();
        }
    }
}