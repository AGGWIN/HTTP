//
//  HTTPTaskAPITests.swift
//  HTTPTests
//
//  Created by TTSY on 2018/12/11.
//  Copyright © 2018 AGGWIN. All rights reserved.
//

import XCTest
import HTTP

class HTTPTaskAPITests: XCTestCase {
    
    var sut: HTTPTask!
    
    let fakeBase = "http://www.fake.com"
    let fakePath = "/fake/path"
    
    override func setUp() {
        super.setUp()
        
        sut = HTTP(base: fakeBase).get(fakePath) { _ in }
    }
    
    func testSuspend() {
        sut.suspend()
        XCTAssertEqual(sut.state, .suspended)
    }
    
    func testResume() {
        sut.resume()
        XCTAssertEqual(sut.state, .running)
    }
    
    func testCancel() {
        sut.cancel()
        XCTAssertEqual(sut.state, .canceling)
    }
    
}
