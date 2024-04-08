import Foundation

enum RequestError: Error {
    case wrongTarget
    case noResponse
    case badRequest(Error)
    case badData(DecodingError)
    case statusError(Int)
}
