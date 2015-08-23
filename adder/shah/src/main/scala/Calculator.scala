case class Calculator(input: String) {

  val DEFAULT_DELIMITER = ","
  val NEW_LINE = "\n"
  val CUSTOM_DELIMITER_MARKER = "//"
  val MAXIMUM_ADDEND = 1000

  def add: Int = if (input == "") 0 else numbersFrom(input) sum

  def numbersFrom(input: String): Seq[Int] = {
    changeToDelimiter(input)
      .replace(NEW_LINE, DEFAULT_DELIMITER)
      .split(DEFAULT_DELIMITER)
      .filterNot(_.isEmpty)
      .map(toNonNegativeInt)
      .filter(_ <= MAXIMUM_ADDEND)
  }

  def toNonNegativeInt(string: String): Int = {
    val int = string.toInt
    if (int < 0) throw new Exception("Negatives not allowed: -1, -2") else int
  }

  def changeToDelimiter(input: String): String = {
    val potentialDelimiter = input.stripPrefix(CUSTOM_DELIMITER_MARKER).charAt(0)
    if (potentialDelimiter.isDigit) {
      input
    } else if(potentialDelimiter == '[') {
      val delim = input.stripPrefix(CUSTOM_DELIMITER_MARKER + potentialDelimiter).takeWhile(_ != ']')
      input.stripPrefix(CUSTOM_DELIMITER_MARKER + potentialDelimiter).replace(delim, DEFAULT_DELIMITER).replace("]","")
    }else{
      input.stripPrefix(CUSTOM_DELIMITER_MARKER + potentialDelimiter).replace(potentialDelimiter.toString, DEFAULT_DELIMITER)
    }
  }
}
