module AdderTests

open NUnit.Framework
open FsUnit
open Adder

let adder = new Adder()

[<Test>] 
let ``Given I'm adding a blank string``() =
   adder.AddDelimitedIntegers "" |> should equal 0

[<Test>]
let ``Given I'm adding a single integer (1)``() =
    adder.AddDelimitedIntegers "1" |> should equal 1

[<Test>]
let ``Given I'm adding a single integer (2)``() =
    adder.AddDelimitedIntegers "2" |> should equal 2
