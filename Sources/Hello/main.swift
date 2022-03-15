import Foundation

//Creating Ingredient model
struct Ingredient: Codable {
    var name: String
    var tableSpoon: Int
    var teaSpoon: Int
    var teaCup: Int
}

//reading JSON file
let currentDirectory = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
guard let urlForIngredients = Bundle.module.url(forResource: "Ingredients", withExtension: "json") else {
    exit(0)
}

//do {
//    let data = try Data(contentsOf: urlForIngredients)
//    let ingredients = try JSONDecoder().decode([Ingredient].self, from: data)
//    print(ingredients[0].name)
//
//} catch {
//    print(error)
//}

guard let data = try? Data(contentsOf: urlForIngredients),
      let ingredients = try? JSONDecoder().decode([Ingredient].self, from: data) else {
    exit(0)
}

//Menu
print("🍉 Welcome to Kitchen Assistant! 🥑 \n")
print("Select ingredient from the list below: \n")
print("0 - Wheat Flour")
print("1 - Sugar")
print("2 - Corn Start")
print("3 - Oat")
print("4 - Chocolate powder")
print("5 - Yeast")
print("6 - Baking Powder")
print("7 - Butter")
print("Type a number: ", terminator: "")

var intOption: Int?

//Reading user`s option
let option = readLine()
intOption = Int(option!)
print(intOption!) //teste

switch intOption {
    
  case 0:
    print("You selected Wheat Flour!")
  case 1:
    print("You selected Sugar!")
  case 2:
    print("You selected Corn Start!")
  case 3:
    print("You selected Oat!")
  case 4:
    print("You selected Chocolate Powder!")
  case 5:
    print("You selected Yeast!")
  case 6:
    print("You selected Baking Powder!")
  case 7:
    print("You selected Butter!")
case .none:
    print("ERROR! Type a valid option")
case .some(_):
    print("ERROR! Type an option between 0 and 7")
}

//Reading weight
var intWeight: Int = 0

func readGrams(weight: Int) -> Int {
  while (true){
    print("Enter ingredient weight in grams: ", terminator: "")
    let weight = readLine()
    let intWeight = Int(weight!)
    if (intWeight == nil || intWeight! <= 0) {
            print ("Type a valid weight in grams")
    }
    else {
            break
    }
  }
    return intWeight
}
