using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;

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
            return int.Parse(commaSeparatedNumbers);
        }
    }
}