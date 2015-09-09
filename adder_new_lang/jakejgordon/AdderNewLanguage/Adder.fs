module Adder

open System



type Adder() =
    member this.ReturnZeroIfBlank delimitedString = if delimitedString = "" then 0 else Int32.Parse(delimitedString)

    member this.AddDelimitedIntegers delimitedString = this.ReturnZeroIfBlank delimitedString
