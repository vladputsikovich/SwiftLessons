import Foundation

class Singleton {
  static let shared = Singleton()

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

class StudentOperation {
  var name: String

  init(_ name: String) {
    self.name = name
  }

  func setAnswer(_ randomInt: Int, _ range: (Int, Int), _ closure: @escaping  (Int) -> Void) {
    var answer = 0
    let setAnswerQueue = OperationQueue()
    setAnswerQueue.addOperation {
      while answer != randomInt {
        answer = Int.random(in: range.0...range.1)
      }
      closure(answer)
    }
  }
}

let stud1 = Student("vlad")
let stud2 = Student("sasha")
let stud3 = Student("dima")
let stud4 = Student("oleg")
let stud5 = Student("eug")

let students: [Student] = [stud1, stud2, stud3, stud4, stud5]

students.forEach { student in 
  student.setAnswer(Int.random(in: 0...100), (0, 100), { answer in 
    print("\(student.name) \(answer)")
  })
}

let studentOper = StudentOperation("OPER")

studentOper.setAnswer(Int.random(in: 0...100), (0, 100), { answer in 
  print("\(studentOper.name) \(answer)")
})