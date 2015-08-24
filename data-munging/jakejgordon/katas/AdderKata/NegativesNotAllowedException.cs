using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace katas.AdderKata
{
    public class NegativesNotAllowedException : Exception
    {
        const string MESSAGE_FORMAT = "Negatives are not allowed. You tried to pass: '{0}'";

        public NegativesNotAllowedException(int number) : base(string.Format(MESSAGE_FORMAT, number))
        {
            
        }
    }
}
