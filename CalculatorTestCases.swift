//
//  CalculatorTestCases.swift
//  CalculatorTestTests
//
//  Created by Trentium Solution on 10/10/24.
//

import XCTest
@testable import CalculatorTest

final class CalculatorTestCases: XCTestCase {

    var tcCalculator: CalculatorViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        super.setUp()
        tcCalculator = CalculatorViewModel()
        tcCalculator?.firstOperand = 90.0 // set the value of FirstOperand
        
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        tcCalculator = nil
        super.tearDown()
    }

        //MARK: Test cases for addition
    func testAdditionFeature() throws {
        let result = tcCalculator?.additionalCalculation(value: 1080.0)
        XCTAssertEqual(result, 1090.0, "Addition is incorrect")
    }
    
    // Test for Subtraction
      func testSubstractionCalculation() throws {
          let result = tcCalculator?.substractionCalculation(value: 4.0)
          XCTAssertEqual(result, 6.0, "Subtraction is correct")
      }

      // Test for Multiplication
    func testMultipleCalculation() throws {
            let result = tcCalculator?.multipleCalculation(value: 2.0)
            XCTAssertEqual(result, 20.0, "Multiplication is correct")
                
        }
    
    // Test for Division
      func testDivideCalculation() throws {
          let result = tcCalculator?.devideCalculation(value: 2.0)
          XCTAssertEqual(result, 5.0, "Division is incorrect")
      }
    
    // Test for Division by Zero
        func testDivideByZero() throws {
            let result = tcCalculator?.devideCalculation(value: 0)
            XCTAssertTrue(result!.isInfinite, "Division by zero should return infinity")
        }
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
