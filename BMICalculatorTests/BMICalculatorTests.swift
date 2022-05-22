//
//  BMICalculatorTests.swift
//  BMICalculatorTests
//
//  Created by Vincent Gunawan on 22/05/22.
//

import XCTest
@testable import BMICalculator

class BMICalculatorTests: XCTestCase {
  var bmi: BMI!
  
    override func setUpWithError() throws {
        bmi = BMI()
    }

    override func tearDownWithError() throws {
        bmi = nil
    }

  func test_calculateBMI() {
    let result = bmi.calculateBMI(weight: 70.2, height: 174.1)
    XCTAssertEqual(result, 23.16)
  }
  
  func test_type_withBMIunder18_5() {
    let result = bmi.typeBMI(with: 18.4)
    XCTAssertEqual(result, "Underweight")
  }
  
  func test_type_withBMIunder25() {
    let result = bmi.typeBMI(with: 24.9)
    XCTAssertEqual(result, "Healty weight")
  }
  
  func test_type_withBMIunder30() {
    let result = bmi.typeBMI(with: 28.9)
    XCTAssertEqual(result, "Overweight")
  }
  
  func test_type_withBMIabove30() {
    let result = bmi.typeBMI(with: 31)
    XCTAssertEqual(result, "Obese")
  }
  
  func test_calculateIdealWeight_forMale() {
    let result = bmi.calculateIdealWeight(height: 165.2, gender: "Male")
    XCTAssertEqual(result, 60.04)
  }
  
  func test_calculateIdealWeight_forFemale() {
    let result = bmi.calculateIdealWeight(height: 165.2, gender: "Female")
    XCTAssertEqual(result, 52.99)
  }
  

  func testPerformanceExample() throws {
      // This is an example of a performance test case.
      self.measure {
          // Put the code you want to measure the time of here.
      }
  }

}
