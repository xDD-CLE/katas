/**
 * Created by shah on 8/21/15.
 */
case class Calculator(numbers :String) {

  private val DELIMITER = ","
  private val NEW_LINE = "\n"
  private val CUSTOM_DELIMITER_MARKER = "//"

  def add : Int = {
    if (numbers == "") {
      0
    } else {
      changeToDelimiter(numbers)
        .replace(NEW_LINE,DELIMITER)
        .split(DELIMITER)
        .filterNot(_.isEmpty)
        .map(_.toInt)
        .sum
    }
  }

  def changeToDelimiter(input :String) : String = {
    val potentialDelimiter = input.stripPrefix(CUSTOM_DELIMITER_MARKER).charAt(0)
    if(potentialDelimiter.isDigit){
      input
    } else {
      input
        .stripPrefix(CUSTOM_DELIMITER_MARKER + potentialDelimiter)
        .replaceAll(potentialDelimiter.toString,DELIMITER)
    }
  }
}
