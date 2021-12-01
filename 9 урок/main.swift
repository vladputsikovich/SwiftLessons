import Foundation
func nothingsReturn (_ closure: () -> Void) {
    (0...10).forEach {
        print($0)
    }
    closure()
}

nothingsReturn { print("closure") }

let numArr = [10, 6, 3, 9, 0]
let newNumArrUp = numArr.sorted(by: > )
let newNumArrDown = numArr.sorted(by: < )


func intArrClosure (_ numArr: [Int], _ closure: (Int, Int?) -> String) -> Int {
    let numOpt: Int? = 7
    numArr.forEach { num in
        print(closure(num, numOpt))
    }
    return 0
}

intArrClosure(numArr, { num, numOpt in
    if num > numOpt ?? 0 {
        return "ДА"
    } else {
        return "НЕТ"
    }
})

var randomChar: [String] = []

let randomString: () = "sdfiNUV345345#!#@!@56YY53F3F".forEach {
    randomChar.append(String($0))
}
var glasn = ["A","E","Y","U","O","I"]
var newRandomChar =
randomChar.filter { glasn.contains($0.capitalized) }.sorted(by: >) +
randomChar.filter { !glasn.contains($0.capitalized) }.sorted(by: >)

print(newRandomChar)
