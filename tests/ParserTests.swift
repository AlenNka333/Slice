//
//  tests.swift
//  tests
//
//  Created by Alena Nesterkina on 2.02.21.
//

import XCTest

class ParserTests: XCTestCase {
    let sut = Parser(validator: Validator())
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testSuccess() {
        let correctResult = Task(grid: Grid(width: 5, height: 5), points: [Point(x: 1, y: 3), Point(x: 4, y: 4)])
        XCTAssertEqual(try sut.parseToTask(input: "5x5 (1, 3) (4, 4)"), correctResult)
    }
    
    func testFailure() {
        XCTAssertThrowsError(try sut.parseToTask(input: "aga(1, t) (4, o)")) { error in
            XCTAssertEqual(error as! AppEnvironment.CustomErrors, AppEnvironment.CustomErrors.invalidInput)
        }
    }
}
