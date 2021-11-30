import Foundation

class Student {
  var name: String
  var female: String
  var dateOfBirth: Date
  
   init (_ dateOfBirth: Date, _ name: String, _ female: String) {
     self.dateOfBirth = dateOfBirth
     self.name = name
     self.female = female
   }
}

let date = Date()
let calendar = Calendar.current

var dateComponent = DateComponents()
var componentDate = calendar.date(from: dateComponent)

let females: [String] = ["Пуцыкович","Бэкхзем","Катышкин","Пустин","Карманный"]
let names: [String] = ["Влад","Дима","Саша","Кирилл","Алексей"]

var students: [Student] = []

(0...29).forEach { num in
  dateComponent = DateComponents(calendar: calendar, 
                                 year: Int.random(in: 1970..<2005), 
                                 month: Int.random(in: 1...12), 
                                 day: Int.random(in: 1...30))
  componentDate = calendar.date(from: dateComponent)
  students.append(Student(componentDate!, names.randomElement()!, females.randomElement()!))
}

students.forEach { stud in 
  print(stud.dateOfBirth)
}
print("\n")

let sortedArray = students.sorted { $0.dateOfBirth < $1.dateOfBirth }

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy"

sortedArray.forEach { stud in 
  print("\(stud.name) \(stud.female) \(dateFormatter.string(from: stud.dateOfBirth))")
}

dateFormatter.dateFormat = "EEEE MMMM"

print("\nПервые дни месяцев\n")

(1...12).forEach { m in 
  dateComponent = DateComponents(calendar: calendar, 
                                 year: 2021, 
                                 month: m, 
                                 day: 1)
  componentDate = calendar.date(from: dateComponent)
  print("\(dateFormatter.string(from: componentDate!))")
}

print("\nВоскресенья месяцев\n")

dateFormatter.dateFormat = "EEEE MMMM dd"

var firstSunday = 3

(1...52).forEach { m in 
  dateComponent = DateComponents(calendar: calendar, 
                                 year: 2021, 
                                 month: 1, 
                                 day: firstSunday)
  componentDate = calendar.date(from: dateComponent)
  print("\(dateFormatter.string(from: componentDate!))")
  firstSunday += 7
}

print("\nРабочие дни\n")



var monthWorkDays: [Int] = []
var count = 0
var currentMonth = "January"

(1...365).forEach { d in 
  dateFormatter.dateFormat = "MMMM"
  dateComponent = DateComponents(calendar: calendar, 
                                 year: 2021, 
                                 month: 1, 
                                 day: d)
  componentDate = calendar.date(from: dateComponent)
  if currentMonth != dateFormatter.string(from: componentDate!) {
    currentMonth = dateFormatter.string(from: componentDate!)
    monthWorkDays.append(count)
    count = 0
  }
  dateFormatter.dateFormat = "EEEE"
  if "Sunday" != dateFormatter.string(from: componentDate!) && "Saturday" !=  dateFormatter.string(from: componentDate!) {
    count += 1
  }
  if d == 365 {
    monthWorkDays.append(count)
  }
}

dateFormatter.dateFormat = "MMMM"

(1...12).forEach { m in 
  dateComponent = DateComponents(calendar: calendar, 
                                 year: 2021, 
                                 month: m, 
                                 day: 1)
  componentDate = calendar.date(from: dateComponent)
  print("В \(dateFormatter.string(from: componentDate!)) \(monthWorkDays[m-1]) рабочих дней")
}