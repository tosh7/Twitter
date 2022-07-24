import Foundation

final class RouteManger {

    private let url: URL

    init(_ url: URL) {
        self.url = url

        let urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        guard let queries = urlComponents?.queryItems else { return }
        let code = queries[1].value

        let baseUrl = URL(string: "https://api.twitter.com/2/oauth2/token")!
        let data: [String: Any] = [
            "code": code!,
            "grant_type": "authorization_code",
            "client_id": Contents.clientId,
            "redirect_uri": Contents.redirectURLString,
            "code_verifier": Contents.oauth2CodeChallenge
        ]
        guard let httpBody = try? JSONSerialization.data(withJSONObject: data, options: []) else { return }
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(Token.self, from: data)
                    apiClient.bearerToken = object.access_token

                    apiClient.getTimeline(.init(), completion: {
                        print($0)
                    })
                } catch let error {
                    print(error)
                }
            } else {
            }
        }
        task.resume()
    }
}

struct Token: Codable {
    var access_token: String
    var expires_in: Int
    var refresh_token: String
}
