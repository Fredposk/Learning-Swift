import UIKit

var str: String = "Hello, world"

print(str)


let firstName: String = "Jenna"
let lastName: String = "Smith"

var person: String = "\(firstName) \(lastName)"
print(person)

print("my age is \(30 + 1)")

var a: Int = 5
var b: Int = 8
var c: Int = a


a = b
b = c

print("\(a) and \(b)")

func exercise1() {

    let numbers = [45, 73, 195, 53]
    
    //Write your code here
    let computedNumbers = [numbers[0] * numbers[1], numbers[1] * numbers[2], numbers[2] * numbers[3], numbers[3] * numbers[0]]
    
    
    print(computedNumbers)

}

exercise1()


func exercise2() {
    
    
    let alphabet = ["a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"]
    
    //The number of letters in alphabet equals 26
    
//    let first = alphabet.randomElement()
    
   var password = ""
    while password.count < 6 {
       password += alphabet.randomElement()!
    }
    
    print(password)
    
    
}

exercise2()
