//: Playground - noun: a place where people can play

import Cocoa

protocol ExerciseType: CustomStringConvertible {
    var name: String { get }
    var caloriesBurned: Double { get }
    var minutes: Double { get }
}

struct EllipticalTrainer: ExerciseType {
    let name = "Elliptical Machine"
    let caloriesBurned: Double
    let minutes: Double
}

struct Tredmill: ExerciseType {
    let name = "Tredmill"
    let caloriesBurned: Double
    let minutes: Double
    let distanceInMiles: Double
}

//func caloriesBurnedPerMinute<Exercise: ExerciseType>(exercise: Exercise) -> Double {
//    return exercise.caloriesBurned / exercise.minutes
//}

extension ExerciseType {
    var caloriesBurnedPerMinute: Double {
        return caloriesBurned / minutes
    }
}

let ellipticalWorkout = EllipticalTrainer(caloriesBurned: 335, minutes: 30)
let tredmillWorkout = Tredmill(caloriesBurned: 350, minutes: 25, distanceInMiles: 4.2)
//print(caloriesBurnedPerMinute(ellipticalWorkout))
//print(caloriesBurnedPerMinute(tredmillWorkout))
print(ellipticalWorkout.caloriesBurnedPerMinute)
print(tredmillWorkout.caloriesBurnedPerMinute)

extension SequenceType where Generator.Element == ExerciseType {
    func totalCaloriesBurned() -> Double {
        var total: Double = 0
        for exercise in self {
            total += exercise.caloriesBurned
        }
        return total
    }
}

let mondayWorkout: [ExerciseType] = [ellipticalWorkout, tredmillWorkout]
print(mondayWorkout.totalCaloriesBurned())

extension ExerciseType {
    var description: String {
        return "\(name), burned \(caloriesBurned) in \(minutes) minutes"
    }
}

print(tredmillWorkout)
print(ellipticalWorkout)

extension Tredmill {
    var description: String {
        return "Tredmill, burned \(caloriesBurned) and \(distanceInMiles) miles in \(minutes) minutes"
    }
}

print(tredmillWorkout)


