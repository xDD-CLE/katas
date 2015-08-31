module AdderTests

    open NUnit.Framework
    open FsUnit
    open StringCalculator.Adder

    [<TestFixture>]
    type AdderTests() = class

        [<Test>]
        member x. ``should return zero when for empty string``() = 
            Assert.That(Add(""), Is.EqualTo(0))

        [<Test>]
        member x. ``should throw exception if negative number included``() = 
         Assert.Throws<System.ArgumentException>(fun () -> 
            Add("1,-2") |> ignore) |> ignore

        [<Test>]
        member x. ``should not include numbers greater than or equal to 1000``() = 
            Assert.That(Add("5,1000"), Is.EqualTo(5))

        [<TestCase("1",1)>]
        [<TestCase("5",5)>]
        member x. ``should sum up single addend" ``(addend:string, expectedSum:int) =
            let actualSum = Add(addend)
            Assert.That(actualSum, Is.EqualTo(expectedSum))

        [<TestCase("6,7,8",21)>]
        [<TestCase("6\n7\n8",21)>]
        [<TestCase("//;\n6;7;8",21)>]
        member x. ``should sum up multiple addend" ``(addends:string, expectedSum:int32) = 
            let actualSum = Add(addends)
            Assert.That(actualSum, Is.EqualTo(expectedSum))
    end