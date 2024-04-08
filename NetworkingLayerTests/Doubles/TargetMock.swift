import Foundation
import NetworkingLayer

struct TargetMock: RequestTarget, Equatable {
    let baseUrl: String
    let path: String
    
    init(baseUrl: String = "bla.com", path: String = "/path") {
        self.baseUrl = baseUrl
        self.path = path
    }
}
