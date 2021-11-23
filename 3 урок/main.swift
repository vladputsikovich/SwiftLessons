var onlyNumbers: String = "216168468"
var lettersNumbers: String = "a1s6d5f1a6sdf"

var withFract: Double = 10.2
var withoutFract: Double = 5

//Приведение к int

let first: Int? = Int(onlyNumbers)
if let second = Int(lettersNumbers)
let third: Int? = Int(withoutFract)
let four: Int? = Int(withFract)

var numbers: [Int] = [first!, second!, third!, four!]

print(numbers)
print(numbers.max())
