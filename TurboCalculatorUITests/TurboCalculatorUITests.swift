//
//  TurboCalculatorUITests.swift
//  TurboCalculatorUITests
//
//  Created by Michail Klimov on 07.09.2023.
//

import XCTest

final class TurboCalculatorUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
    }

    func testSum() throws {
        app.launch()
        app.buttons["5"].firstMatch.tap()
        app.buttons["+"].firstMatch.tap()
        app.buttons["5"].firstMatch.tap()
        app.buttons["="].firstMatch.tap()
        XCTAssert(app.staticTexts["10"].exists)
    }

    func testMinus() throws {
        app.launch()
        app.buttons["1"].firstMatch.tap()
        app.buttons["5"].firstMatch.tap()
        app.buttons["-"].firstMatch.tap()
        app.buttons["5"].firstMatch.tap()
        app.buttons["="].firstMatch.tap()
        XCTAssertTrue(app.staticTexts["10"].exists)
    }

    func testMulty() throws {
        app.launch()
        app.buttons["6"].firstMatch.tap()
        app.buttons["x"].firstMatch.tap()
        app.buttons["8"].firstMatch.tap()
        app.buttons["="].firstMatch.tap()
        XCTAssertEqual(app.staticTexts["48"].label, "48")
    }


    func testClear() throws {
        app.launch()
        app.buttons["6"].firstMatch.tap()
        app.buttons["AC"].firstMatch.tap()
        XCTAssert(app.staticTexts["0"].exists)
    }

    func testdoubleTap() throws {
        app.launch()
        app.buttons["1"].firstMatch.tap()
        app.buttons["1"].firstMatch.tap()
        app.buttons["1"].firstMatch.tap()
        app.buttons["1"].firstMatch.tap()
        app.buttons["backspace"].doubleTap()
        XCTAssertTrue(app.staticTexts["11"].exists)
    }
}
