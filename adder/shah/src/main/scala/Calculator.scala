/**
 * Created by shah on 8/21/15.
 */
case class Calculator(numbers :String) {

  def add() : Int = if (numbers == "") 0 else numbers.split(",").map(_.toInt).sum

}
