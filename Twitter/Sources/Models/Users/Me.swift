import Foundation

struct MeRequest: RequestType {
    var path: String = "/2/users/me"
    var method: HTTPMethodType = .get
}
