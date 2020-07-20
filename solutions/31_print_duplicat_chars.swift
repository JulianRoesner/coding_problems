//Print duplicate characters of a string
func printDuplicates(inThis: String){
  
  var alreadySeenChars : Set<Character> = Set()

  for char in inThis{
    if(alreadySeenChars.contains(char)){
      print(String(char) + " ")
    }else{
      alreadySeenChars.insert(char)
    }
    
  }
}