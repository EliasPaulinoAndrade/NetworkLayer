import Foundation

public protocol URLSessioning {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessioning { }
