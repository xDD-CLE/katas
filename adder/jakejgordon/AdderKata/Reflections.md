* There were a couple of places where I wrote tests that never failed, because the effort to 
write the solution that covered multiple scenarios was less than the code to narrow-mindedly
solve just the first scenario. For example, providing support for 2 numbers or more is the same
in C#: Regex.Split(...

* Do people generally use theories or "TestCases" (nUnit) to test multiple data points? What is a sufficient
number of cases to test? E.g.:

```
   	[TestCase("0,0,0", Result = 0)]
        [TestCase("1,2,3", Result = 6)]
        [TestCase("1,2,3,4,5,6,7", Result = 28)]
        public int ItReturnsTheSumOfAllNumbersPassedInRegardlessOfHowMany(string commaSeparatedNumberList)
        {
            return this.adder.Add(commaSeparatedNumberList);
        }
```

* More functional-style programming is hard for me to debug in Visual Studio. Pulling out separate methods
was easier to debug and the lines where it blows up are much more clear. How do other languages get around this problem?
Here is an example of some code that could have been much more functional but was split out to be easier to debug:

```
        //hybrid approach
        var listOfRegexes =
                individualDelimiterRegex.Matches(allDelimitersString)
                                        .Cast<Match>()
                                        .Select(match => match.Value)
                                        .Select(BuildIndividualRegex)
                                        .ToList();
        
        //method that
        private static string BuildIndividualRegex(string delimiterWithSquareBrackets)
        {
            return Regex.Escape(delimiterWithSquareBrackets.Replace("[", string.Empty).Replace("]", string.Empty));
        }
```