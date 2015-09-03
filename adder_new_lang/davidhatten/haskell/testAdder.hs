module TestAdder where
import Control.Exception
import Control.Monad
import Test.HUnit
import Adder

testAddEmptyString = TestCase $ assertEqual "An empty string should add to 0" 0 ( add "" )
testAddSingleNumber = TestCase $ assertEqual "2 should add to 2" 2 ( add "2" )
testAddMoreThanOneNumber = TestCase $ do
                            assertEqual "2 plus 2 is 4" 4 ( add "2,2" )
                            assertEqual "3 plus 3 plus 3 is 9" 9 ( add "3,3,3" )
testAddNumbersWithNewlineDelimiter = TestCase $ assertEqual "3 plus 3 plus 3 is 6, split with a newline" 9 ( add "3,3\n3")
testCustomDelimiter = TestCase $ assertEqual "2 plus 2 is 4 with custom delimiters" 4 ( add "//:\n2:2" )
testNegativeNumberFail = TestCase $ do
                    handleJust isWanted (const $ return ()) $ do
                        ( evaluate $ add "2,-3,4" )
                        assertFailure "Negative values should throw errors"
                    where isWanted = guard . (== LossOfPrecision) 

main = runTestTT $ TestList [ testAddEmptyString, 
                                testAddSingleNumber, 
                                testAddMoreThanOneNumber, 
                                testAddNumbersWithNewlineDelimiter, 
                                testCustomDelimiter,
                                testNegativeNumberFail ]