func compareString (_ strings: [String]) -> String {
  var answer = ""
  strings.forEach { str in 
    answer += str.prefix(1).uppercased() + str.dropFirst()
  }
  return answer
}

func splitString (_ str: String) -> [String] {
  var arr: [String] = []
  str.split( separator: " ").forEach { s in 
    arr.append(String(s))
  }
  return arr
}

func getMax (_ strings: [String]) -> String {
  return strings.max() ?? ""
}

func dropRepeatAndMirror (_ str: String) -> String {
  var buffer: [String] = []
  var answer = ""
  str.forEach { s in
     if !buffer.contains(String(s)) {
       buffer.append(String(s))
     }
  }
  for index in stride(from: buffer.count-1, through: 0, by: -1) {
     answer += buffer[index]
  }
  return answer
}

func getNums (_ str: String) -> [String] {
    var answer: [String] = []
    var buff = ""
    str.forEach { letter in 
      if Int(String(letter)) != nil {
        buff += String(letter)
      }
      else {
        if buff != "" {
          answer.append(buff)
          buff = ""
        }
      }
    }
    if buff != "" {
      answer.append(buff)
    }
    return answer
}


print(compareString(["asd","dfdf"]))
print(splitString("asdf dasf asdf"))
print(getMax(["asd","dfdf"]))
print(dropRepeatAndMirror("sasha"))
print(getNums("15sdf458sd48"))