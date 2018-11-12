//
//  NYRSFeedTests.swift
//  NYRSFeedTests
//
//  Created by Mohamed Ismail on 11/11/18.
//  Copyright © 2018 elzokla. All rights reserved.
//

import XCTest
@testable import NYRSFeed


class NYRSFeedTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testMostViewedArticles() {

        let promise = expectation(description: "Status code: 200")
        

        WebService.getMostViewedArticles { (response) in
            if response?.isSuccess() ?? false {
                promise.fulfill()
            }else {
                XCTFail("Status code: \(response?.error?.message)")
            }
        }
        
        waitForExpectations(timeout: 35, handler: nil)



    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
