import Foundation
import NetworkingLayer

struct APIResultDTO: Decodable {
    let title: String
}

struct APITarget: RequestTarget {
    let baseUrl: String = "jsonplaceholder.typicode.com"
    let path: String = "/todos/1"
}

struct Service {
    let requester: Requester<APIResultDTO>
    
    func request() {
        Task {
            do {
                let target = APITarget()
                let string = try await requester.request(target: target)
                
                print(string)
            } catch {
                print(error)
            }
        }
    }
}

let requester = URLSessionRequester<APIResultDTO>(
    urlSession: URLSession.shared,
    jsonDecoder: JSONDecoder()
).asGeneric
let service = Service(requester: requester)

service.request()

RunLoop.main.run()
