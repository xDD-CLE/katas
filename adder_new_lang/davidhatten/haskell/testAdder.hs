module TestAdder where
import Test.HUnit
import Adder

testAddEmptyString = TestCase $ assertEqual "An empty string should add to 0" 0 ( add "" )
testAddSingleNumber = TestCase $ assertEqual "2 should add to 2" 2 ( add "2" )
testAddMoreThanOneNumber = TestCase $ assertEqual "2 plus 2 is 4" 4 ( add "2,2" )


main = runTestTT $ TestList [ testAddEmptyString, testAddSingleNumber, testAddMoreThanOneNumber ]