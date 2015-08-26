using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text.RegularExpressions;
using NUnit.Framework;

namespace katas.AdderKata
{
    public class Adder
    {
        public const int NUMBER_THRESHOLD_BEFORE_THEY_ARE_IGNORED = 999;

        private readonly List<int> negativeNumbers = new List<int>();

        public int Add(string commaSeparatedNumbers)
        {
            if (string.IsNullOrWhiteSpace(commaSeparatedNumbers))
            {
                return 0;
            }

            var delimetersRegex = "[,\n]";
            commaSeparatedNumbers = HandleExplicitDelimiters(commaSeparatedNumbers, ref delimetersRegex);

            var sum = SumUpValidNumbersAndCheckForInvalidOnes(commaSeparatedNumbers, delimetersRegex);

            this.ValidateWhetherThereWereNegatives();

            return sum;
        }

        private static string HandleExplicitDelimiters(string commaSeparatedNumbers, ref string delimitersRegex)
        {
            var delimiterSpecifierRegex = new Regex(@"//.*\n");
            if (delimiterSpecifierRegex.IsMatch(commaSeparatedNumbers))
            {
                var indexOfFirstNewline = commaSeparatedNumbers.IndexOf('\n');
                const int NUMBER_OF_NEWLINE_SLASHES = 2;
                var numberOfCharactersOfTheDelimiter = indexOfFirstNewline - NUMBER_OF_NEWLINE_SLASHES;
                var allDelimitersString = commaSeparatedNumbers.Substring(NUMBER_OF_NEWLINE_SLASHES, numberOfCharactersOfTheDelimiter);
                var individualDelimiterRegex = new Regex(@"\[[^\]*]\]");
                var listOfRegexes =
                    individualDelimiterRegex.Matches(allDelimitersString)
                                            .Cast<Match>()
                                            .Select(match => match.Value)
                                            .Select(BuildIndividualRegex)
                                            .ToList();

                if (listOfRegexes.Count > 0)
                {
                    const string REGEX_OR = "|";
                    delimitersRegex = string.Join(REGEX_OR, listOfRegexes);
                }
                else
                {
                    delimitersRegex = allDelimitersString;
                }

                commaSeparatedNumbers = commaSeparatedNumbers.Substring(indexOfFirstNewline);
            }
            return commaSeparatedNumbers;
        }

        private static string BuildIndividualRegex(string delimiterWithSquareBrackets)
        {
            return Regex.Escape(delimiterWithSquareBrackets.Replace("[", string.Empty).Replace("]", string.Empty));
        }

        private int SumUpValidNumbersAndCheckForInvalidOnes(string commaSeparatedNumbers, string delimetersRegex)
        {
            return Regex.Split(commaSeparatedNumbers, delimetersRegex).Select(number => this.HandleIndividualValues(int.Parse(number))).Sum();
        }

        private void ValidateWhetherThereWereNegatives()
        {
            if (this.negativeNumbers.Count > 0)
            {
                throw new NegativesNotAllowedException(this.negativeNumbers.ToArray());
            }
        }

        private int HandleIndividualValues(int number)
        {
            if (number < 0)
            {
                negativeNumbers.Add(number);
            }

            if (number > NUMBER_THRESHOLD_BEFORE_THEY_ARE_IGNORED)
            {
                return 0;
            }
            return number;
        }
    }
}