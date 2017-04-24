//
//  HTTPRequestTests.swift
//  JeffreyKit
//
//  Created by zengdaqian on 2017/4/24.
//  Copyright © 2017年 CocoaPods. All rights reserved.
//

import XCTest
import JeffreyKit
import Alamofire
import HandyJSON

class HTTPRequestTests: XCTestCase {
    
    var httpClient = AlamofireClient(host: "http://apiv3.iucnredlist.org")
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAPIRequest() {
        let expectation = self.expectation(description: "test error")
        
        let req = APIVersion()
        httpClient.send(req) { (version) in
            guard let _ = version?.version else {
                XCTFail("Version can not be nil!")
                return
            }
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 2, handler: nil)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}

extension HTTPRequest {
    var headers: [String: String] {
        return ["token": "null"]
    }
}

struct AlamofireClient: Client {
    var host = ""
    
    func send<T: HTTPRequest>(_ r: T, handler: @escaping (T.Response?) -> Void) {
        let url = host.appending(r.path)
        var encoding: ParameterEncoding
        switch r.method {
        case .get, .head, .delete:
            encoding = URLEncoding.default
        default:
            encoding = JSONEncoding.prettyPrinted
        }
        let method = Alamofire.HTTPMethod(rawValue: r.method.rawValue) ?? .get
        Alamofire.request(url, method: method, parameters: r.parameter, encoding: encoding, headers: r.headers).responseString(encoding: String.Encoding.utf8) { (response) in
            if let json = response.result.value, let res = T.Response.decode(with: json) {
                handler(res)
            } else {
                handler(nil)
            }
        }
    }
}

struct Version: HandyJSON, JSONDecodable {
    var version: String?
    
    static func decode(with json: String) -> Version? {
        return JSONDeserializer<Version>.deserializeFrom(json: json)
    }
}

struct APIVersion: HTTPRequest {
    
    typealias Response = Version
    
    var path: String = "/api/v3/version"
    
    let method: JeffreyKit.HTTPMethod = .get
    var parameter: [String: Any] = [:]
}
