var nums = ""
var toch1 = [Int.random(in: 1...10),Int.random(in: 1...10)]
var toch2 = [Int.random(in: 1...10),Int.random(in: 1...10)]
var toch3 = [Int.random(in: 1...10),Int.random(in: 1...10)]

var toches = [toch1, toch2, toch3]
print(toches)
var count = 0
var square = [[2,3],[4,6]]

func checkPoints(_ x:Int, _ y:Int) -> Bool {
  var answer = false
  toches.forEach {toch in 
    if x == toch[0] && y == toch[1] {
      answer = true
    }
  }
  return answer
}

for x in (square[0][0]...square[1][0]) {
  for y in (square[0][1]...square[1][1]) {
    if checkPoints(x, y){
      count += 1
    }
  }
}

print(count)