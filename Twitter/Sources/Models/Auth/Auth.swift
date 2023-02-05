import Foundation

struct AuthRequest: RequestType, URLEncodable {
    let path: String = "/2/oauth2/token"
    let method: HTTPMethodType = .post

    var code: String
    var grant_type: String = "authorization_code"
    var client_id: String = Contents.clientId
    var redirect_uri: String = Contents.redirectURLString
    var code_verifier: String = Contents.oauth2CodeChallenge

    var queries: [String: Any] {
        return [
            "code": code,
            "grant_type": grant_type,
            "client_id": client_id,
            "redirect_uri": redirect_uri,
            "code_verifier": code_verifier
        ]
    }

    init(code: String) {
        self.code = code
    }
}

struct Token: Codable {
    var access_token: String
    var expires_in: Int
    var refresh_token: String
}
