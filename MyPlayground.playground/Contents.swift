import UIKit

var greeting = "Hello, playground"


class Vehicle {
    // MARK: Variables
    private let name: String
    private let purchaseCost: Double
    private let costToRun: Double
    private let fuelType: String
    private var currentSpeed: Double
    var currentGear: Int
    
    // MARK: Lifecycle
    init(
        name: String,
        purchaseCost: Double,
        costToRun: Double,
        fuelType: String,
        currentSpeed: Double,
        currentGear: Int
    ) {
        self.name = name
        self.purchaseCost = purchaseCost
        self.costToRun = costToRun
        self.fuelType = fuelType
        self.currentSpeed = currentSpeed
        self.currentGear = currentGear
        
        if !isValidGear(gear: currentGear, fuelType: fuelType) {
            self.currentGear = 1
        }
        print("A new object will be created with name: \(name)")
    }
    
    // MARK: Functions
    func speedUp(_ speed: Double) {
        print("My current speed is: \(currentSpeed), it will increase by: \(speed) and final speed will be: \(currentSpeed + speed)")
        currentSpeed = currentSpeed + speed
    }
    
    func applyBrake(speedDecrease: Double) {
        print("My current speed is: \(currentSpeed), it will decrease by: \(speedDecrease) and final speed will be: \(currentSpeed - speedDecrease)")
        currentSpeed = currentSpeed - speedDecrease
    }
    
    func changeGear(gear: Int) {
        if isValidGear(gear: gear, fuelType: fuelType) {
            print("My current gear is: \(currentGear), it will become: \(gear)")
            currentGear = gear
        } else {
            return
        }
    }
    
    func isValidGear(gear: Int, fuelType: String) -> Bool {
        // (       FALSE          ) ir (         TRUE            )
        //                                         (  TRUE  arba   FALSE )
        if fuelType.lowercased() == "electric" && (gear > 2 || gear < -1) {
            print("Invalid gear, unable to change it!")
            return false
        }
        return true
    }
}

//let petrolVehicle = Vehicle(name: "BMW", purchaseCost: 15500, costToRun: 100, fuelType: "petrol", currentSpeed: 0, currentGear: 0)
let electricVehicle = Vehicle(name: "Tesla", purchaseCost: 35000, costToRun: 10, fuelType: "EleCtric", currentSpeed: 100, currentGear: 4)
//let dieselVehicle = Vehicle(name: "VW", purchaseCost: 5000, costToRun: 50, fuelType: "diesel", currentSpeed: 30, currentGear: 3)


print(electricVehicle.currentGear)
electricVehicle.changeGear(gear: 2)
electricVehicle.changeGear(gear: 5)
electricVehicle.speedUp(50)
electricVehicle.applyBrake(speedDecrease:25)


//dieselVehicle.speedUp(100)
//dieselVehicle.applyBrake(speedDecrease:10)
//dieselVehicle.changeGear(gear: 5)
//
//petrolVehicle.speedUp(10)
//petrolVehicle.applyBrake(speedDecrease:0)
//petrolVehicle.changeGear(gear: 1)

