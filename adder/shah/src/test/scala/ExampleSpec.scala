import org.junit.runner.RunWith
import org.scalatest.junit.JUnitRunner

import org.scalatest._
import org.scalatest.Matchers._

@RunWith(classOf[JUnitRunner])
class ExampleSpec extends FlatSpec {

  "A friend" should "say hello" in {
    val friend = Person("Bob","Bobson")

    friend.sayHello() should be ("Hello, I'm Bob Bobson")
  }

}
