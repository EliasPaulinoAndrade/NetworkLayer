import Foundation
import NetworkingLayer

struct TargetMock: RequestTarget {
    let baseUrl: String
    let path: String
    
    init(baseUrl: String = "bla.com", path: String = "/path") {
        self.baseUrl = baseUrl
        self.path = path
    }
}
