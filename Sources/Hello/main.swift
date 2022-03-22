import Foundation

func kitchenAssistant(){

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
print("8️⃣ - Coffee Powder")
print("9️⃣ - Peanut Butter")
print("🔟 - Grated Cheese")
print("\n")
print("👉🏻 Please type a number: ", terminator: "")

var intOption: Int?
    
//Function to read weight
var intWeight: Int = 0

//Reading user`s option
let option = readLine()
intOption = Int(option!)

print("\n") //Next line

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

  case 8:
  print("➡️ You selected Coffee Powder!")
  readGrams()
  conversor(input: intWeight)
    
  case 9:
  print("➡️ You selected Peanut Butter!")
  readGrams()
  conversor(input: intWeight)
    
  case 10:
  print("➡️ You selected Grated Cheese!")
  readGrams()
  conversor(input: intWeight)
    
  case .none:
    print("⚠️ ERROR! Invalid option. Try again.")
    print("\n")
   kitchenAssistant()
    
  case .some(_):
    print("⚠️ ERROR! Invalid option. Try again and select a number between 0 and 10")
    print("\n")
    kitchenAssistant()
}

//Reading weight in grams
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

//Converting weight
func conversor(input: Int){
    var totalTeaCup = 0
    var totalTableSpoon = 0
    var totalTeaSpoon = 0
    
    totalTeaCup = (input / (ingredients[intOption!].teaCup))
    totalTableSpoon = (input / (ingredients[intOption!].tableSpoon))
    totalTeaSpoon = (input / (ingredients[intOption!].teaSpoon))
    
    if (totalTeaSpoon == 0){
        totalTeaSpoon = 1
    }
    
    print("\n")
    print(" Number of Tea Cups: \(totalTeaCup) ")
    print(" ----- OR -----")
    print(" Number of Table Spoons: \(totalTableSpoon) ")
    print(" ----- OR -----")
    print(" Number of Tea Spoons: \(totalTeaSpoon) \n")
    print("😄 Thanks for using Kitchen Assistant! 😄")
    
    print("👉🏻 Do you want to select another ingredient?")
    
    print("1️⃣ - Yes")
    print("2️⃣ - No")
    
    //Reading user`s option
    var intOption2: Int?
    let option2 = readLine()
    intOption2 = Int(option2!)
    
    switch intOption2 {
        case 1:
        kitchenAssistant()
  
        case 2:
        print("See you later 👋🏻")
        
        case .none:
        print("⚠️ ERROR! Invalid option.")
        
        case .some(_):
        print("⚠️ ERROR! Invalid option. Try again.")

    }
}

}

kitchenAssistant()
