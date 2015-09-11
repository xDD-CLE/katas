namespace StringCalculator
    open System
    open System.Text.RegularExpressions
    module Adder =
        let (DEFAULT_DELIMITER:string) = ","
        let (NEWLINE:string) = "\n"


        let SumStringValues (arrayOfStrings:string []) = Seq.sumBy int arrayOfStrings

        let ZeroIfBlank delimitedString = if delimitedString = "" then "0" else delimitedString

        //todo not sure why I can't do Regex.Replace delimitedString NEWLINE DEFAULT_DELIMITER
        let SplitStringValues (delimitedString:string) = Regex.Replace(delimitedString, NEWLINE, DEFAULT_DELIMITER).Split((char)DEFAULT_DELIMITER)

        let public AddDelimitedIntegers = fun(delimitedString:string) -> ZeroIfBlank delimitedString |> SplitStringValues |> SumStringValues
