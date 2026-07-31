import XCTest
@testable import Core

final class DeepLinkParserTests: XCTestCase {
   
    func test_route_returnsHome_forHomeHost()  {
        let url = URL(string: "bankingapp://home")!
        
        XCTAssertEqual(DeepLinkParser.route(from: url), .home)
    }
    
    func test_route_returnsNil_forUnknownHost() {
        let url = URL(string: "bankingapp://settings")!
        XCTAssertNil(DeepLinkParser.route(from: url))
    }
    
    
}
