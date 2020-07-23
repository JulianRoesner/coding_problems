//Decode a byte array to a string
func decode(strToDecode: Array<UInt8>)->String{
	let str : [Unicode.UTF8.CodeUnit] = strToDecode
	return String(decoding: str, as: UTF8.self)


}

func encode(strToEncode: String) -> Array<UInt8>{
	var decodedBytes = Array<UInt8>()
    for b in strToEncode.utf8 {
      decodedBytes.append(b)
    }
    return decodedBytes
}


//TESTS
let testString = "A UTF8 String With Special Characters: 😀🍎"
let encodedString = encode(strToEncode: testString)
let decodedString = decode(strToDecode: encodedString)

assert(testString == decodedString, "Got incorrect decoded string: \(encodedString)")