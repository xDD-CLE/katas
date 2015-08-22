/**
 * Created by shah on 8/21/15.
 */
case class Calculator(contents :String) {

  def add() : Int = if (contents == "") 0 else contents.toInt

}
