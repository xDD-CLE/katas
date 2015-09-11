module AdderTests

open NUnit.Framework
open FsUnit
open StringCalculator 

[<Test>] 
let ``Given I'm adding a blank string``() =
    Adder.AddDelimitedIntegers "" |> should equal 0

[<Test>]
let ``Given I'm adding a single integer (1)``() =
    Adder.AddDelimitedIntegers "1" |> should equal 1

[<Test>]
let ``Given I'm adding a single integer (2)``() =
    Adder.AddDelimitedIntegers "2" |> should equal 2

[<Test>]
let ``Given I'm adding two integers (1,1)``() =
    Adder.AddDelimitedIntegers "1,1" |> should equal 2
