//Check if a string is an anagram of another string
func isAnagram(this: String, ofThis: String)-> Bool{
  
  var charCounts : [Character : Int] = [:]

  for char in ofThis{
    if charCounts[char] == nil{
      charCounts[char] = 1
    }else{
      charCounts[char]! += 1
    }
  }

  for char in this{
    if (charCounts[char] == nil || charCounts[char]! <= 0){
      return false
    }else{
      charCounts[char]! -= 1
    }
  }

  return true
}

//TESTS
var isAnagram = "anne"
var testString = "Banane"
var noAnagram = "lane"

var result = isAnagram(this: isAnagram, ofThis: testString)
assert (result == true, "\(isAnagram) was no anagram of \(testString)")

result = isAnagram(this: noAnagram, ofThis: testString)
assert (result == false, "\(noAnagram) was no anagram of \(testString)")