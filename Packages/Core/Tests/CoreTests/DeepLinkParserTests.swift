import XCTest
@testable import Core

final class DeepLinkParserTests: XCTestCase {
   
    func test_route_returnsHome_forHomeHost()  {
        let url = URL(string: "bankingapp://home")!
        
        XCTAssertEqual(DeepLinkParser.route(from: url), .home)
    }
    
    
}
