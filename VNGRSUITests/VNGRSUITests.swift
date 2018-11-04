//
//  VNGRSUITests.swift
//  VNGRSUITests
//
//  Created by omer kantar on 30.10.2018.
//  Copyright © 2018 vngrs. All rights reserved.
//

import XCTest

class VNGRSUITests: XCTestCase {

    var app: XCUIApplication!
    
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()
        
        app.launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    
    //
    func testSearch() {
        
        let keys = ["v", "n", "g", "r", "s"]
        keys.forEach { (obj) in
            app.keys[obj].tap()
        }
        app.buttons["Search"].tap()
        let textField = app.textFields["Search 🚀"]
        let search = textField.value
        XCTAssert(search != nil)
        XCTAssert(search! is String)
        XCTAssert((search as! String) == "vngrs")
    }

    
    func testRepositoryDetail() {
        testSearch()
        
        let table = app.tables.firstMatch
        XCTAssert(table.cells.count > 0)
        table.cells.firstMatch.tap()
        
    }

    
    var searchTextField: XCUIElement? {
        return app.textFields["Search 🚀"]
    }
}
