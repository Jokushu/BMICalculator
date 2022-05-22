//
//  BMI.swift
//  BMICalculator
//
//  Created by Vincent Gunawan on 22/05/22.
//

import Foundation

struct BMI {
  func calculateBMI (weight: Double, height: Double) -> Double {
    return ((weight / pow(height / 100, 2)) * 100).rounded() / 100
  }
  
  func typeBMI(with bmi: Double) -> String {
    switch bmi {
    case 0..<18.5:
      return "Underweight"
    case 18.5..<25:
      return "Healty weight"
    case 25..<30:
      return "Overweight"
    default:
      return "Obese"
    }
  }
  
  func calculateIdealWeight (height: Double, gender: String) -> Double {
    switch gender{
    case "Male":
      return ((22 * pow((height / 100), 2)) * 100).rounded() / 100
    default:
      return ((22 * pow(((height - 10) / 100), 2)) * 100).rounded() / 100
    }
    
  }
  
}
