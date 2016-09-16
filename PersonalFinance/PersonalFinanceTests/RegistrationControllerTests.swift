//
//  RegistrationControllerTests.swift
//  PersonalFinance
//
//  Created by Irfan on 9/16/16.
//  Copyright © 2016 Irfan. All rights reserved.
//

import XCTest

class RegistrationControllerTests: XCTestCase {
    
    var registrationViewController: RegistrationViewController! // System Under Test
    
    // dependencies
    var store: AccountStore!
    var homeLoader: ControllerLoader!
    var account: Account!
    var fieldValidator: StubRegistrationFieldValidator!
    var alertHandler: AlertHandler!
    
    override func setUp() {
        super.setUp()
        
        store = MockStore()
        homeLoader = MockControllerLoader()
        account = Account(context: ManagedObjectContexter.getManagedObjectContext())
        fieldValidator = StubRegistrationFieldValidator()
        alertHandler = MockAlertHandler()
        
        registrationViewController = UIStoryboard(name: "Registration", bundle: NSBundle(forClass: self.dynamicType)).instantiateViewControllerWithIdentifier("RegistrationViewController") as! RegistrationViewController
        registrationViewController.loadView()
        
        registrationViewController.setStore(store)
        registrationViewController.setControllerLoader(homeLoader)
        registrationViewController.setAccount(account)
        registrationViewController.setValidator(fieldValidator)
        registrationViewController.setAlertHandler(alertHandler)
    }
    
    class MockStore: AccountStore {
        @objc func createAccount(account: Account) {
        }
        
        @objc internal var allItems: [Account] {
            get {
                return Array()
            }
        }
    }
    
    class MockControllerLoader: ControllerLoader {
        var loadControllerWasCalled = false
        @objc func loadController() {
            loadControllerWasCalled = true
        }
    }
    
    class StubRegistrationFieldValidator: FieldValidator {
        var state = false
        
        @objc func validate() -> Bool {
            state = true
            
            return state
        }
        
        @objc internal var errorMessage:String {
            get {
                return ""
            }
        }
    }
    
    class MockAlertHandler: AlertHandler {
        var presentAlertWasCalled = false
        
        @objc func presentAlert(alert: Alert) {
            presentAlertWasCalled = true
        }
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        ManagedObjectContexter.getManagedObjectContext().rollback()
        super.tearDown()
    }
    
    func testIfCreateWasCalledOnStore() {
        registrationViewController.proceedToHome()
        XCTAssertTrue(fieldValidator.state, "Validate method must call on validator")
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
