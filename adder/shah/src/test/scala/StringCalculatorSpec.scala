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

}
