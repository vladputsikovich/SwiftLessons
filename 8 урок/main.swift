import Foundation

protocol Food {
  var name: String { get }
  func taste()
}
protocol Storable {
  var name: String { get }
  var expired: Bool { get set }
  var daysToExpire: Int { get set}
  func taste()
}
class Apple: Food, Storable {
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
class Banana: Food, Storable {
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

func printFood(_ product: [AnyObject]) {
  product.forEach { prod in
    if let prod  = prod as? Food {
      print("Продукт: \(prod.name)")
      prod.taste()
    }
    else {
      if let prod  = prod as? Storable {
        print("Продукт ХРАНИЫЙ: \(prod.name)")
        prod.taste()
      }
    }
  }
  print("\n")
}

// func sortProduct(_ product: [AnyObject]) -> [AnyObject] {
//   var newArr = product
//   if let product = product as? [Storable] {
//     newArr = product.sorted { $0.daysToExpire > $1.daysToExpire }
//   }else{
//     newArr = product.sorted { $0.name > $1.name }
//   }
//   return newArr
// }

let apple = Apple("Яблоко", true, 20)
let banana = Banana("Банан", false, 5)
let juice = Juice("Cок")

var package: [AnyObject] = [apple, banana, juice]

printFood(package)

var freeze: [AnyObject] = []

package.forEach { prod in 
  if let prod = prod as? Storable {
    if prod.expired {
      if let prod = prod as? AnyObject {
        freeze.append(prod)
      }
    }
  }
}

printFood(freeze)