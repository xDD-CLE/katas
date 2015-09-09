module Adder

open System



type Adder() =
    member this.ReturnZeroIfBlank delimitedString = if delimitedString = "" then "0" else delimitedString

    member this.ReturnInteger delimitedString = Int32.Parse(delimitedString)

    member this.AddDelimitedIntegers delimitedString = this.ReturnZeroIfBlank delimitedString |> this.ReturnInteger
