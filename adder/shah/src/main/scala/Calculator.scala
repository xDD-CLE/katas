/**
 * Created by shah on 8/21/15.
 */
case class Calculator(numbers :String) {

  private val DELIMITER = ","

  def add : Int = if (numbers == "") 0 else numbers.replace("\n",DELIMITER).split(DELIMITER).map(_.toInt).sum

}
