import Foundation

protocol Food {
  var name: String { get }
  func taste()
}
protocol Storable : Food {
  var name: String { get }
  var expired: Bool { get set }
  var daysToExpire: Int { get set }
  func taste()
}
class Apple: Storable {
  var name: String
  var expired: Bool
  var daysToExpire: Int
  init(_ name: String, _ expired: Bool, _ daysToExpire: Int) {
    self.name = name
    self.expired = expired
    self.daysToExpire = daysToExpire
  }
  func taste() {
    print("Емае какое вкусное \(self.name)")
  }
}
class Banana: Storable {
  var name: String
  var expired: Bool
  var daysToExpire: Int
  init(_ name: String, _ expired: Bool, _ daysToExpire: Int) {
    self.name = name
    self.expired = expired
    self.daysToExpire = daysToExpire
  }
  func taste() {
    print("Емае какое вкусный \(self.name)")
  }
}
class Juice: Food {
  var name: String
  init(_ name: String) {
    self.name = name
  }
  func taste() {
    print("Емае какое вкусный \(self.name)")
  }
}

let apple = Apple("Яблоко", true, 20)
let banana = Banana("Банан", false, 5)
let juice = Juice("Cок")

var package: [Food] = [apple, banana, juice]

printFood(sortProduct(package))

var freeze: [Food] = []

package.forEach { prod in 
  if let prod = prod as? Storable {
    if prod.expired {
      freeze.append(prod)
    }
  } else {
    freeze.append(prod)
  }
}

printFood(sortProduct(freeze))

func printFood(_ product: [Food]) {
  product.forEach { prod in
    print("Продукт: \(prod.name)")
    prod.taste()
  }
  print("\n")
}
func sortProduct(_ product: [Food]) -> [Food] {
  var newArr = product
  if let product = product as? [Storable] {
    newArr = product.sorted { $0.daysToExpire > $1.daysToExpire }
  } else {
    newArr = product.sorted { $0.name > $1.name }
  }
  return newArr
}