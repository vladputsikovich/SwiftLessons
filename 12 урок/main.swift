import Foundation

class Singleton {

  static let shared = Singleton()

  init(){}

  let internalQueue = DispatchQueue(label: "com.singletioninternal.queue",
                                            qos: .default,
                                            attributes: .concurrent)
}

class Student {
  var name: String

  init(_ name: String) {
    self.name = name
  }

  func setAnswer(_ randomInt: Int, _ range: (Int, Int), _ closure: @escaping  (Int) -> Void) {
    var answer = 0
    Singleton().internalQueue.async {
      while answer != randomInt {
        answer = Int.random(in: range.0...range.1)
      }
      Singleton().internalQueue.async() {
        closure(answer)
      }
    }
    
    
  }
}

let stud1 = Student("vlad")
let stud2 = Student("sasha")
let stud3 = Student("dima")
let stud4 = Student("oleg")
let stud5 = Student("eug")

stud1.setAnswer(Int.random(in: 0...100), (0, 100), { answer in 
  print("\(stud1.name) \(answer)")
})
stud2.setAnswer(Int.random(in: 0...100), (0, 100), { answer in 
  print("\(stud2.name) \(answer)")
})
stud3.setAnswer(Int.random(in: 0...100), (0, 100), { answer in 
  print("\(stud3.name) \(answer)")
})
stud4.setAnswer(Int.random(in: 0...100), (0, 100), { answer in 
  print("\(stud4.name) \(answer)")
})
stud5.setAnswer(Int.random(in: 0...100), (0, 100), { answer in 
  print("\(stud5.name) \(answer)")
})