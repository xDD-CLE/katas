import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner

import org.scalatest._
import org.scalatest.Matchers._

@RunWith(classOf[JUnitRunner])
class StringCalculatorSpec extends FlatSpec {

  "A string calculator" should "return 0 for an empty string" in {
    val result = Calculator("").add()
    result should be (0)
  }

  "A string calculator" should "return the number when adding only the number" in {
    val result = Calculator("1").add()

    result should be (1)
  }

  "A string calculator" should "return the sum of two comma separated numbers" in {
    val result = Calculator("1,2").add()

    result should be (3)
  }

  "A string calculator" should "return the sum of many comma separated numbers" in {
    val result = Calculator("1,2,3,7").add()

    result should be (13)
  }

  "A string calculator" should "Allow the Add method to handle new lines between numbers (instead of commas)" in {
    val result = Calculator("1\n2,3").add()

    result should be (6)
  }
}
