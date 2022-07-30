import Foundation

final class AuthManager {
    static let shared: AuthManager = AuthManager()

    var me: User?

    /// Onece you get your call back, you need to call this method.
    /// In this method, you will refresh your bearer token(OAuth 2.0 PCKE) and your user info.
    func setup() {
        Task {
            guard let authCode = Contents.shared.authCode else { return }
            let authResult = await apiClient.auth(.init(code: authCode))
            authResult.value.flatMap {
                apiClient.bearerToken = $0.access_token
            }
            let meResult = await apiClient.getMe(.init())
            me = meResult.value

            if authResult.isSuccess && meResult.isSuccess {
                NotificationCenter.default.post(name: .authSuccessed, object: nil)
            } else {
                // TODO: Show alert
            }
        }
    }
}
