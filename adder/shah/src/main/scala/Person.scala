/**
 * Created by shah on 8/21/15.
 */
case class Person(firstName: String, lastName: String) {

  def sayHello() : String = {
    s"Hello, I'm ${firstName} ${lastName}"
  }

}
