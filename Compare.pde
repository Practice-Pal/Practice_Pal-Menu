public static class Compare
{
  //returns true if user is pressing the resistor on stringed instrument
  static boolean notEmpty(String input)
  {
    if(input != " ")
      return true;
    else
      return false;
  }
  
  //true if the user plays the correct note
  static boolean check(String correct, String input)
  {
    input = input.toLowerCase();
    
    if(input.charAt(0) == correct.charAt(0))
      return true;
    else
      return false;
  }
  
}