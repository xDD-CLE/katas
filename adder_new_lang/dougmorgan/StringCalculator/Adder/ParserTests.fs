module ParserTests

    open NUnit.Framework
    open FsUnit
    open StringCalculator.Parser

    [<TestFixture>]
    type ParserTests() = class

        [<Test>]
        member x.``should handle comma delimiter" ``() = 
            Assert.That(Parse("1,2,4,5"), Is.EqualTo([1;2;4;5;]))

        [<Test>]
        member x.``should handle newline delimiter" ``() = 
            Assert.That(Parse("1\n2\n4\n5"), Is.EqualTo([1;2;4;5;]))

        [<Test>]
        member x.``should be able to override delimiter" ``() = 
            Assert.That(Parse("//;\n1;2;4;5"), Is.EqualTo([1;2;4;5;]))
    end