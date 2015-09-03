module TestAdder where
import Test.HUnit
import Adder

testAddEmptyString = TestCase $ assertEqual "An empty string should add to 0" 0 ( add "" )

main = runTestTT testAddEmptyString