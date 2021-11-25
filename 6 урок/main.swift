//CLASS
class Worker {
  var name: String
  var female: String
  var onWorkPlace: Bool

  init(_ name: String,_ female: String,_ onWorkPlace: Bool) {
    self.name = name
    self.female = female
    self.onWorkPlace = onWorkPlace
  }
}

var vlad = Worker("Влад", "Пуцыкович", Bool.random())
var sasha = Worker("Саша", "Пуцыкович", Bool.random())
var oleg = Worker("Олег", "Алексеев", Bool.random())
var dima = Worker("Дима", "Нарышкин", Bool.random())
var eug = Worker("Женя", "Буракевич", Bool.random())

var workers = [vlad, sasha, oleg, dima, eug]

workers.forEach { worker in 
  if !worker.onWorkPlace {
    worker.onWorkPlace = true
    print("Работник \(worker.name) \(worker.female) приступил к работе")
  }
}
print("\n")

var listWorkers = workers
    .filter { $0.onWorkPlace }
    .sorted { $0.female < $1.female } 
                + workers
    .filter { !$0.onWorkPlace }
    .sorted { $0.name < $1.name }

listWorkers.forEach { worker in 
  print("\(worker.name) \(worker.female) \(worker.onWorkPlace)")
}
print("\n")

var newArr = workers

workers[0].name = "Лох"
workers[2].female = "это еще что такое"

newArr.forEach { worker in 
  print("\(worker.name) \(worker.female) \(worker.onWorkPlace)")
}

//STRUCT
struct WorkerStruct {
  var name: String
  var female: String
  var onWorkPlace: Bool

  mutating func setOnWorkPlace (_ onWorkPlace: Bool) {
    self.onWorkPlace = onWorkPlace
  }
}

var vladS = WorkerStruct(name: "Влад", female: "Пуцыкович", onWorkPlace: Bool.random())
var sashaS = WorkerStruct(name: "Саша", female: "Пуцыкович", onWorkPlace: Bool.random())
var olegS = WorkerStruct(name: "Олег", female: "Алексеев", onWorkPlace: Bool.random())
var dimaS = WorkerStruct(name: "Дима", female: "Нарышкин", onWorkPlace: Bool.random())
var eugS = WorkerStruct(name: "Женя", female: "Буракевич", onWorkPlace: Bool.random())


var workersStruct = [vladS, sashaS, olegS, dimaS, eugS]

workersStruct.forEach { worker in 
  if !worker.onWorkPlace {
    if var worker = worker as? WorkerStruct {
      worker.setOnWorkPlace(true)
    }
    print("Работник \(worker.name) \(worker.female) приступил к работе")
  }
}
print("\n")

var listWorkersStruct = workersStruct
    .filter { $0.onWorkPlace }
    .sorted { $0.female < $1.female } 
    + workersStruct
    .filter { !$0.onWorkPlace }
    .sorted { $0.name < $1.name }

listWorkersStruct.forEach { worker in 
  print("\(worker.name) \(worker.female) \(worker.onWorkPlace)")
}
print("\n")

var newArrStuct = workersStruct

workersStruct[0].name = "Лох"
workersStruct[2].female = "это еще что такое"

newArrStuct.forEach { worker in 
  print("\(worker.name) \(worker.female) \(worker.onWorkPlace)")
}