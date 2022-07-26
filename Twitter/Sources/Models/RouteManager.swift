import Foundation

final class RouteManger {

    private let url: URL

    init(_ url: URL) {
        self.url = url

        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard let queries = urlComponents?.queryItems else { return }
        Contents.shared.authCode = queries[1].value
    }
}
