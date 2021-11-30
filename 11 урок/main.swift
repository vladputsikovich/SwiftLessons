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

let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "dd MMMM yyyy"

(0...29).forEach { num in
  dateComponent = DateComponents(calendar: calendar, 
                                 year: Int.random(in: 1970..<2005), 
                                 month: Int.random(in: 1...12), 
                                 day: Int.random(in: 1...30))
  componentDate = calendar.date(from: dateComponent)
  students.append(Student(componentDate ?? date, names.randomElement() ?? "" , females.randomElement() ?? ""))
}

students.forEach { stud in 
  print("\(dateFormatter.string(from: stud.dateOfBirth))")
}
print("\n")

let sortedArray = students.sorted { $0.dateOfBirth < $1.dateOfBirth }

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
  print("\(dateFormatter.string(from: componentDate ?? date))")
}

print("\nВоскресенья месяцев\n")

dateFormatter.dateFormat = "EEEE MMMM dd"

var firstSunday = 3

var dateComponentStart = DateComponents(calendar: calendar, 
                                 year: 2021, 
                                 month: 1, 
                                 day: 1)
var dateComponentFinish = DateComponents(calendar: calendar, 
                                 year: 2022, 
                                 month: 1, 
                                 day: 1)
var componentDates = calendar.dateComponents([.weekOfYear], from: dateComponentStart, to: dateComponentFinish)

let weeks = componentDates.weekOfYear ?? 0

(1...weeks).forEach { m in 
  dateComponent = DateComponents(calendar: calendar, 
                                 year: 2021, 
                                 month: 1, 
                                 day: firstSunday)
  componentDate = calendar.date(from: dateComponent)
  print("\(dateFormatter.string(from: componentDate ?? date))")
  firstSunday += 7
}

print("\nРабочие дни\n")

var monthWorkDays: [Int] = []
var count = 0
var currentMonth = "January"

componentDates = calendar.dateComponents([.day], from: dateComponentStart, to: dateComponentFinish)

let day = componentDates.day ?? 0

(1...day).forEach { d in 
  dateFormatter.dateFormat = "MMMM"
  dateComponentStart.day = d
  componentDate = calendar.date(from: dateComponentStart)
  
  if currentMonth != dateFormatter.string(from: componentDate ?? date) {
    currentMonth = dateFormatter.string(from: componentDate ?? date)
    monthWorkDays.append(count)
    count = 0
  }
  dateFormatter.dateFormat = "EEEE"
  if "Sunday" != dateFormatter.string(from: componentDate ?? date) && "Saturday" !=  dateFormatter.string(from: componentDate ?? date) {
    count += 1
  }
  if d == 365 {
    monthWorkDays.append(count)
  }
}

dateFormatter.dateFormat = "MMMM"

componentDates = calendar.dateComponents([.month], from: dateComponentStart, to: dateComponentFinish)

let mth = componentDates.month ?? 0

(1...mth).forEach { m in 
  dateComponentStart.month = m
  componentDate = calendar.date(from: dateComponentStart)
  print("В \(dateFormatter.string(from: componentDate ?? date)) \(monthWorkDays[m-1]) рабочих дней")
}
