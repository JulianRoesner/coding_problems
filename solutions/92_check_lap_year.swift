//Check if a given year is a lap year
func isLap(year: Int)-> Bool{
	guard year >= 0 else{
		return false
	}

	if year % 400 == 0{
		return true
	}else if (year % 4 == 0 && year % 100 != 0 ){
		return true
	}else{
		return false
	}
}

//TESTS
var lapYear = 2000
var result = isLap(year: lapYear)
assert(result, "\(lapYear) was classified as not a lap year")

lapYear = 0
result = isLap(year: lapYear)
assert(result, "\(lapYear) was classified as not a lap year")

lapYear = 2008
result = isLap(year: lapYear)
assert(result, "\(lapYear) was classified as not a lap year")

var notLapYear = 100
result = isLap(year: notLapYear)
assert(!result, "\(notLapYear) was classified as a lap year")

notLapYear = 2007
result = isLap(year: notLapYear)
assert(!result, "\(notLapYear) was classified as a lap year")