enum MacDonalds {
  case burgir(_ value: Int , _ was: Bool)
  case potato(_ value: Potato, _ was: Bool)
  case cheese(_ value: Int, _ was: Bool)
  case icecream(_value: Int, _ was: Bool)
  case cola(_ value: Cola, _ was: Bool)

  enum Cola : Int {
    case s = 300
    case m = 400
    case l = 500
  } 
  enum Potato : String {
    case s = "S"
    case m = "M"
    case l = "L"
  }

  func fullInformation() -> String {
     switch self {
			case .burgir(let value, let key): 
				if key {
          return "Гамбургер \(value)"
        }
        else {
          return "Гамбургер - такой позиции нет в наличие"
        }
			case .potato(let value, let key): 
				if key {
          return "Картошка Фри \(value)"
        }
        else {
          return "Картошка Фри - такой позиции нет в наличие"
        }
      case .cheese(let value, let key): 
				if key {
          return "Чизбургир \(value)"
        }
        else {
        return "Чизбургир - такой позиции нет в наличие"
        }
			case .icecream(let value, let key): 
				if key {
          return "Мороженное \(value)"
        }
        else {
          return "Мороженное - такой позиции нет в наличие"
        }
      case .cola(let value,let key): 
        if key {
          return "Кока Кола \(value.rawValue)"
        } 
        else {
          return "Кока Кола - такой позиции нет в наличие"
        }
				
    }
  }
}

let order: [MacDonalds] = [MacDonalds.burgir(2, Bool.random()), 
                           MacDonalds.cola(MacDonalds.Cola.s, Bool.random()), 
                           MacDonalds.cheese(3, Bool.random()),
                           MacDonalds.potato(MacDonalds.Potato.m, Bool.random())] 

print("Вы заказали:\n")

order.forEach {prod in
  print("\(prod.fullInformation())\n")
}