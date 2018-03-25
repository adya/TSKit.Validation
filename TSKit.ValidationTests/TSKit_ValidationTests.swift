//
//  TSKit_ValidationTests.swift
//  TSKit.ValidationTests
//
//  Created by Arkadii Glushchevskyi on 3/25/18.
//  Copyright © 2018 Arkadiy Glushchevsky. All rights reserved.
//

import XCTest
import TSKit_Validation

class TSKit_ValidationTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        let validator = LengthValidator(minimumLength: 6, maximumLength: 20)
        XCTAssert(validator.validate("ValidString"), "Not valid")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
