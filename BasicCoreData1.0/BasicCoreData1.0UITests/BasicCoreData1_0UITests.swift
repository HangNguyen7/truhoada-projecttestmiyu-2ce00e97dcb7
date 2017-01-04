//
//  BasicCoreData1_0UITests.swift
//  BasicCoreData1.0UITests
//
//  Created by Mi Yu on 1/4/17.
//  Copyright © 2017 trunghoangdang. All rights reserved.
//

import XCTest

class BasicCoreData1_0UITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        let app = XCUIApplication()
        app.scrollViews.otherElements.icons["BasicCoreData1.0"].tap()
     
        
        
        
        app.navigationBars["Core Data 1.0"].buttons["Add"].tap()
        app.alerts["Add Element"].collectionViews.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element.typeText("bcd")
        app.otherElements.containing(.navigationBar, identifier:"Core Data 1.0").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element.tap()
        
        let bcdStaticText = app.tables.staticTexts["bcd"]
        bcdStaticText.tap()
        bcdStaticText.tap()
        
        let textField = app.alerts["Add Element"].collectionViews.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 1).children(matching: .textField).element
        textField.tap()
        textField.typeText("rf")
        app.typeText("ff")
        app.otherElements.containing(.navigationBar, identifier:"Core Data 1.0").children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .table).element.tap()
    }}
    func demotest01(){
        let app = XCUIApplication()
        app.scrollViews.otherElements.icons["BasicCoreData1.0"].tap()
            
            
        XCUIApplication().tables.buttons["Delete"].tap()
        
}



