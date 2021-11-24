//ARRAY
var arr: [Int] = []
for _ in 1...10 {
    arr.append(Int.random(in: 1..<100))
}
print(arr)

var moreThan30 = arr.filter{$0 > 30}
print(moreThan30)

var stringArr: [String] = arr.map{String($0)}
print(stringArr)

var sum = arr.reduce(0){$0 + $1}
print(sum)

var lessThanMiddle = arr.filter{$0 < sum / arr.count}
print(lessThanMiddle)

//DICTIONARY
var month = [String: (Int, Int)] ()
month["Январь"] = (31, 1)
month["Февраль"] = (28, 2)
month["Март"] = (31, 3)
month["Апрель"] = (30, 4)
month["Май"] = (31, 5)
month["Июнь"] = (30, 6)
month["Июль"] = (31, 7)
month["Август"] = (31, 8)
month["Сентябрь"] = (30, 9)
month["Октябрь"] = (31, 10)
month["Ноябрь"] = (30, 11)
month["Декабрь"] = (31, 12)

var alldays = 0

month.forEach {(key, value) in 
  print("В месяце \(key) \(value.0) дней, его порядковый номер \(value.1)" )
  alldays += value.0
}

print("В году \(alldays) день")

