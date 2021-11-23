var onlyNumbers: String = "216168468"
var lettersNumbers: String = "a1s6d5f1a6sdf"

var withFract: Double = 10.2
var withoutFract: Double = 5

//Приведение к int


let first = Int(onlyNumbers)
let second = Int(lettersNumbers)
let third = Int(withoutFract)
let four = Int(withFract)

var numbers: [Int] = [(first ?? 0), (second ?? 0), third, four]

func returnMax(_ numbers: [Int]) -> Int {
  var max = numbers[0]
  numbers.forEach {num in
    if num > max {
      max = num
    }
  }
  return max
}

print(numbers)
print("\(returnMax(numbers))")


/////////////////////////////
func printPerson(_ pers: (String, Int, String)){
  print("Имя: \(pers.0)\nВозраст: \(pers.1)\nПол: \(pers.2)\n")
}

func compareYears(_ pers1: (String, Int, String), _ pers2: (String, Int, String)){
  if pers1.1 > pers2.1{
    print("\(pers1.0) старше, чем \(pers2.0) на \(pers1.1 - pers2.1) лет")
  }else{
    print("\(pers2.0) старше, чем \(pers1.0) на \(pers2.1 - pers1.1) лет")
  }
}

var person1 = (name: "Vlad", age: 50, sex: "m")
var person2 = (name: "Sasha", age: 20, sex: "m")
var person3 = (name: "Vadim", age: 56, sex: "m")
var person4 = (name: "Oleg", age: 12, sex: "m")
var person5 = (name: "Dima", age: 4, sex: "m")


var persons = [person1, person2, person3, person4, person5]

persons.forEach { pers in
  printPerson(pers)
}

compareYears(person1, person2)


