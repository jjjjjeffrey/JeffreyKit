import UIKit
import XCTest
import JeffreyKit

class NotificationTests: XCTestCase {
    
    typealias NotificationCenter = JeffreyKit.NotificationCenter
    
    enum TestNotification: String, JeffreyKit.Notification {
        case exampleOne, exampleTwo
    }
    
    override func setUp() {
        super.setUp()
        

    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNotification() {
        
        let expectation = self.expectation(description: "test error")
        let notifi = TestNotification.exampleOne
        
        let sub = NotificationCenter.default.addObserver(forNotification: notifi) { (notification) in
            guard let userInfo = notification.userInfo as? [String: String] else {
                XCTFail("UserInfo can not be nil!")
                return
            }
            XCTAssert(userInfo["Key"] == "Value")
            expectation.fulfill()
        }
        
        
        NotificationCenter.default.send(notification: notifi, userInfo: ["Key": "Value"])
        
        waitForExpectations(timeout: 1, handler: nil)
        
        NotificationCenter.default.removeObserver(observer: sub)
        
    }
    
    
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure() {
            // Put the code you want to measure the time of here.
        }
    }
    
}
