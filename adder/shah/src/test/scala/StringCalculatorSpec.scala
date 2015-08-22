import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner

import org.scalatest._
import org.scalatest.Matchers._

@RunWith(classOf[JUnitRunner])
class StringCalculatorSpec extends FlatSpec {

  it should "return 0 for an empty string" in {
    Calculator("").add should be(0)
  }

  it should "return the number when adding only the number" in {
    Calculator("1").add should be(1)
  }

  it should "return the sum of two comma separated numbers" in {
    Calculator("1,2").add should be(3)
  }

  it should "return the sum of many comma separated numbers" in {
    Calculator("1,2,3,7").add should be(13)
  }

  it should "Allow the Add method to handle new lines between numbers (instead of commas)" in {
    Calculator("1\n2,3").add should be(6)
  }

  it should "Support different delimiters for the addition of numbers" in {
    Calculator("//;\n1;2").add should be(3)
  }

  it should "not support the addition of negative numbers" in {
    the[Exception] thrownBy {
      Calculator("//;\n-1;-2").add
    } should have message "Negatives not allowed: -1, -2"
  }

  it should "ignore numbers bigger than 1000" in {
    Calculator("1001,2").add should be(2)
  }

}
