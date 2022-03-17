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
print("🍰 Hi there! Welcome to Kitchen Assistant! 🍕 \n")
print("👉🏻 Select an ingredient from the list below: \n")
print("0️⃣ - Wheat Flour")
print("1️⃣ - Sugar")
print("2️⃣ - Corn Start")
print("3️⃣ - Oat")
print("4️⃣ - Chocolate powder")
print("5️⃣ - Yeast")
print("6️⃣ - Baking Powder")
print("7️⃣ - Butter")
print("\n")
print("👉🏻 Please type a number: ", terminator: "")

var intOption: Int?
//Function to read weight
var intWeight: Int = 0

//Reading user`s option
let option = readLine()
intOption = Int(option!)

print("\n")
//Choosing the ingredient
switch intOption {
    
  case 0:
    print("✅ You selected Wheat Flour!")
    readGrams()
    conversor(input: intWeight)
    
  case 1:
    print("➡️ You selected Sugar!")
    readGrams()
    conversor(input: intWeight)
    
  case 2:
    print("➡️ You selected Corn Start!")
    readGrams()
    conversor(input: intWeight)
    
  case 3:
    print("➡️ You selected Oat!")
    readGrams()
    conversor(input: intWeight)
    
  case 4:
    print("➡️ You selected Chocolate Powder!")
    readGrams()
    conversor(input: intWeight)
    
  case 5:
    print("➡️ You selected Yeast!")
    readGrams()
    conversor(input: intWeight)
    
  case 6:
    print("➡️ You selected Baking Powder!")
    readGrams()
    conversor(input: intWeight)
    
  case 7:
    print("➡️ You selected Butter!")
    readGrams()
    conversor(input: intWeight)
    
case .none:
    print("⚠️ ERROR! Type a valid option")
case .some(_):
    print("⚠️ ERROR! Type an option between 0 and 7")
}

func readGrams(){
    print("👉🏻 Enter ingredient weight in grams: ", terminator: "")
    let weight = readLine()
    let intString = Int(weight!)
    if (intString == nil || intString! <= 0) {
            print ("Type a valid weight in grams")
    } else {
        intWeight = intString!
    }
  }

func conversor(input: Int){
    var totalTeaCup = 0
    var totalTableSpoon = 0
    var totalTeaSpoon = 0
    
    totalTeaCup = (input / (ingredients[intOption!].teaCup))
    totalTableSpoon = (input / (ingredients[intOption!].tableSpoon))
    totalTeaSpoon = (input / (ingredients[intOption!].teaSpoon))
    
    print("\n")
    print(" Number of Tea Cups: \(totalTeaCup) ")
    print(" ----- OR -----")
    print(" Number of Table Spoons: \(totalTableSpoon) ")
    print(" ----- OR -----")
    print(" Number of Tea Spoons: \(totalTeaSpoon) \n")
    print("😄 Thanks for using Kitchen Assistant! 😄")
}
