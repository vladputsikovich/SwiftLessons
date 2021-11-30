import Foundation

struct StudenSubjectType : OptionSet {
  let rawValue: Int

  static let biology = StudenSubjectType(rawValue:1 << 0)
  static let math = StudenSubjectType(rawValue:1 << 1)
  static let development = StudenSubjectType(rawValue:1 << 2)
  static let art = StudenSubjectType(rawValue:1 << 3)
}

class Student {
  var study: StudenSubjectType

  init (_ study: StudenSubjectType) {
    self.study = study
  }
}

var student = Student(.math | .art)

print(student.study)