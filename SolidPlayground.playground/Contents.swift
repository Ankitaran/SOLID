import UIKit

/* Single Responsibility Principle */
 
// Voilation of SRP
class UserManager{
    func login(userName: String, password:String){
        //Authentication logic put here
    }
    func updateProfile(_ user: User){
        // Profile Managemenrt logic here
    }
    
}

// Adhering to SRP
class AuthManager{
    func login(userName: String, password:String){
        //Authentication logic put here
    }
}

class ProfileManager{
    func updateProfile(_ user: User){
        // Profile Managemenrt logic here
    }
}



struct User{
   let name : String
}


// Open Closed Principle OCP

protocol Shape{
    func area() -> Double
}
struct Circle:Shape{
    let radius:Double
    func area() -> Double {
        return Double.pi * radius * radius
    }
    
    
}
struct Rectangle: Shape{
    var width: Double
    var height: Double
    init (_ width: Double , height: Double){
        self.width = width
        self.height = height
    }
    func area() -> Double {
      return width * height
    }
    
}
var objRec = Rectangle(15, height: 5)
let rectValue = objRec.area()
print("getting area value:",rectValue)

// Interface Segregation Principle ISP

// Voilation Of ISP
protocol Worker{
    func work()
    func eat()
}

class Programmer:Worker{
    func work() {
        print("work list")
    }
    
    func eat() {
        print("eat time")
    }
    
    
}
// Adhering to ISP

protocol workable{
    func work()
}
protocol eatable{
    func eat()
}

class MutltipleProgrammer:workable,eatable {
    func work() {
        // coding login here
        print("wroking time")
    }
    
    func eat() {
        // coding login here
        print("eating time")
    }
    
    
}
class SinleProgrammer:workable {
    func work() {
        // coding login here
        print("wroking time")
    }
  
}

// Dependancy Inversion Principle DIP
// Voilation of DIP
class DataService{
    func fetchData(){
        // fetch data from a specific data sorce
    }
}

class UserManagerServices{
    let dataService =  DataService()
    func getUserData(){
        // use Data services to fetch user data
        dataService.fetchData()
    }
}

// Adhering to DIP
protocol DataFeching{
    func fetchData()
}
class DataServicesUser: DataFeching{
    func fetchData() {
        // fetch data from a specific data sorce
    }
    
    
}
class UserManagerDIP{
    let dataServices: DataFeching
    
    init(dataServices:DataFeching){
        self.dataServices = dataServices
    }
    func getUserData(){
        // use Dataservices to  fetch user data
    }
}

// Liskov Substitution Principle
// Violation of the Liskov Substitution Principle

class Bird{
    func fly(){
        print("this bird can fly")
    }
}
class Ostrich:Bird{
    override func fly() {
     print("Ostrich can't fly")
    }
}
func makeBirdFly(_ bird: Bird){
    bird.fly()
}
let sparrow = Bird()
let ostrich = Ostrich()
makeBirdFly(sparrow)
makeBirdFly(ostrich)

// Adhring to LSP

protocol BirdLSP {
    var isFlying: Bool{ get }
}
struct FlyingBird : BirdLSP{
    let isFlying: Bool = true
}
struct NonflyingBird: BirdLSP{
    let isFlying: Bool = false
}
struct OstrichLSP : BirdLSP{
    let isFlying: Bool = false
}
func makeBirdsFly(bird: BirdLSP){
    if bird.isFlying {
        print("this bird can fly")
    }else {
        print("this bird can't fly")
    }
}
let sparrowBird = FlyingBird()
let ostrichBird = OstrichLSP()

makeBirdsFly(bird:sparrowBird)
makeBirdsFly(bird:ostrichBird)
