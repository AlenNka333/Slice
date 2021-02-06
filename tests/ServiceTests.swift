//
//  ServiceTests.swift
//  tests
//
//  Created by Alena Nesterkina on 5.02.21.
//

import XCTest

class ServiceTests: XCTestCase {
    let sut = PathService()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccessResult() {
        let testableInput = [Point(x: 1, y: 3), Point(x: 4, y: 4)]
        let successResult = "ENNNDEEEND"
        XCTAssertEqual(try sut.findSolution(unvisitedPlaces: testableInput), successResult)
    }
    
    func testFail() {
        let testableInput: [Point] = []
        XCTAssertThrowsError(try sut.findSolution(unvisitedPlaces: testableInput)) { error in
            XCTAssertEqual(error as! AppEnvironment.CustomErrors, AppEnvironment.CustomErrors.notExistingValue)
        }
    }
}
