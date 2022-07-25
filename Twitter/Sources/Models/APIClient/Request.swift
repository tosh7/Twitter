import Foundation

enum HTTPMethodType: String {
    case get = "GET"
    case post = "POST"
}

protocol RequestType {
    var path: String { get }
    var method: HTTPMethodType { get }
}

protocol URLEncodable {
    var queries: [String: Any] { get }
}
