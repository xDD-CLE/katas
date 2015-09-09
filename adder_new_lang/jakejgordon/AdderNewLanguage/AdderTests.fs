module AdderTests

open NUnit.Framework
open FsUnit
open Adder

let adder = new Adder()

[<Test>] 
let ``Given I'm adding a blank string``() =
   adder.AddDelimitedIntegers "" |> should equal 0


