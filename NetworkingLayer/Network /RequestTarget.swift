import Foundation

public protocol RequestTarget {
    var baseUrl: String { get }
    var path: String { get }
}

extension URLRequest {
    init?(target: RequestTarget) {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = target.baseUrl
        components.path = target.path
    
        guard let url = components.url else {
            return nil
        }
        
        self = .init(url: url)
    }
}
