//
//  MonkeyNewsTests.swift
//  MonkeyNewsTests
//
//  Created by training on 3/19/16.
//  Copyright © 2016 training. All rights reserved.
//

import XCTest
@testable import MonkeyNews

class MonkeyNewsTests: XCTestCase {
    var comm:HackerNewsComm!;
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        comm = HackerNewsComm()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        comm = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testFetchTopStories(){
        let exp = expectationWithDescription("fetching top stories")
        
        comm.fetchTopStories() {
            (collection:StoryCollection) in
            
            print(collection)
            
            exp.fulfill();
        }
        
        waitForExpectationsWithTimeout(5, handler: {
            error in
            
        })
        
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
