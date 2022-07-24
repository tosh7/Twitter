import Foundation

final class RouteManger {

    private let url: URL

    init(_ url: URL) {
        self.url = url

        print("url : \(url.absoluteString)")
        print("scheme : \(url.scheme)")
        print("host : \(url.host)")
        print("port : \(url.port)")
        print("query : \(url.query)")
    }
}
