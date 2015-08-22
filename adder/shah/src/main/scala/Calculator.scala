/**
 * Created by shah on 8/21/15.
 */
case class Calculator(numbers :String) {

  private val DELIMITER = ","
  private val NEW_LINE = "\n"
  private val CUSTOM_DELIMITER_MARKER = "//"
  private val MAXIMUM_ADDEND= 1000

  def add : Int = {
    if (numbers == "") {
      0
    } else {
      changeToDelimiter(numbers)
        .replace(NEW_LINE,DELIMITER)
        .split(DELIMITER)
        .filterNot(_.isEmpty)
        .map(toNonNegativeInt)
        .filter( _ <= MAXIMUM_ADDEND)
        .sum
    }
  }



  def toNonNegativeInt(string : String): Int = {
    val int = string.toInt
    if(int < 0) throw new Exception("Negatives not allowed: -1, -2") else int
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
