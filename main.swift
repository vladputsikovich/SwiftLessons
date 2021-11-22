//Урок 5 - задания
enum Sex{
  case man
  case woman
}

class Human {
  var name: String
  var height : Double
  var weight : Double
  var sex : Sex

  init (name:String,height: Double, weight:Double, sex:Sex){
    self.name = name
    self.height = height
    self.weight = weight
    self.sex = sex
  }

  func move(){
    print("Человек идет")
  }
}

class Runner:Human{
  override func move(){
    print("Бегун бежит")
  }
}

class Swimer:Human{
  override func move(){
    print("Плавец плывет")
  }
}

class Jumper : Human {
  var female : String
  init (name:String,height: Double, weight:Double, sex:Sex, female:String){
    self.female = female
    super.init(name:name,height:height,weight:weight,sex:sex)
  }
  override func move(){
      super.move()
      print("Прыгун прыгает")
    }
}

class Animal{
  var nickname: String
  var years: Int

  init(nickname:String, years: Int){
    self.nickname = nickname
    self.years = years
  }
  func move(){
    print("Животное бежит")
  }
}

class Wolf:Animal{
  override func move(){
    print("Волк бежит")
  }
}

class Tiger:Animal{
  override func move(){
    print("Тигр бежит")
  }
}

var vlad = Human(name:"Влда", height: 10.2,weight: 20.4,sex: Sex.man)
var sasha = Runner(name:"Саша", height: 10.2,weight: 20.4,sex: Sex.man)
var dima = Swimer(name:"Дима", height: 10.2,weight: 20.4,sex: Sex.man)
var oleg = Jumper(name:"Олег", height: 10.2,weight: 20.4,sex: Sex.man,female:"Витальевич")

var anim = Animal(nickname:"Пуц",years:24)
var tig = Tiger(nickname:"REy",years:24)
var wolf = Wolf(nickname:"РОК",years:24)

var peoples:[Any] = [vlad, sasha, dima, oleg, anim, tig, wolf]

peoples.reverse()

for man in peoples {
  if man is Human{
    print("Имя: \((man as! Human).name) Рост: \((man as! Human).height) Вес: \((man as! Human).weight) Пол: \((man as! Human).sex)")
    (man as! Human).move()
  }
  if man is Animal{
    print("Кличка: \((man as! Animal).nickname) Возраст: \((man as! Animal).years)")
    (man as! Animal).move()
  }
  print("\n")
}
