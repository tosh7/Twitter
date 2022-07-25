import Foundation

final class RouteManger {

    private let url: URL

    init(_ url: URL) {
        self.url = url

        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard let queries = urlComponents?.queryItems else { return }
        let code = queries[1].value!
        Task {
            let result = await apiClient.auth(.init(code: code))

            switch result {
            case let .success(token):
                apiClient.bearerToken = token.access_token
                let timeline = await apiClient.getTimeline(.init())
                print(timeline)
            case .failure(let error):
                print(error)
            }
        }
    }
}
