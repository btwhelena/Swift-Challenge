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
print("8 - Milk")
print("9 - Water")
print("10 - Oil")
print("Type a number: ", terminator: "")

var intOption: Int?


//Reading user`s option
let option = readLine()
intOption = Int(option!)

/* switch option{
  case 0:
  
  case 1:

  case 2:

  case 3:

  case 4:

  case 5:

  case 6:

  case 7:

  case 8:

  case 9:

  case 10:
}
*/
 

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
