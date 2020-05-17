//
//  Delivery_Drone_Swift_UIUITests.swift
//  Delivery Drone Swift UIUITests
//
//  Created by Timi Owoturo on 2020-01-03.
//  Copyright © 2020 CEG4912. All rights reserved.
//

import XCTest
@testable import Delivery_Drone_Swift_UI
class Delivery_Drone_Swift_UIUITests: XCTestCase {
    var app: XCUIApplication!

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testSignUpButtonDefault(){
        app.launch()
        XCTAssert(app.staticTexts["Create an Account"].exists)
        XCTAssertFalse(app.staticTexts["Login to Account"].exists)
    }
    
    func testNavigationToLogin(){
        app.launch()
        app.buttons["Login"].tap()
        XCTAssert(app.staticTexts["Login to Account"].exists)
        XCTAssertFalse(app.staticTexts["Create an Account"].exists)
    }
    
    func testCreationOfAccount() {
        app.launch()
        let fullName = app.textFields["Full Name"]
        let email = app.textFields["Email"]
        let password = app.secureTextFields["Password"]
        let cPassword = app.secureTextFields["Confirm Password"]
        fullName.tap()
        fullName.typeText("Test User")
        email.tap()
        email.typeText("testuser@ddrone.com")
        password.tap()
        password.typeText("testp")
        app.keyboards.buttons["return"].tap()
        cPassword.tap()
        cPassword.typeText("testp")
        app.keyboards.buttons["return"].tap()
        app.buttons["DONE"].tap()
        
//        assert(app.navigationBars.staticTexts["Categories"].exists)
        
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
