import Foundation

struct UserRequest: RequestType {
    var path: String {
        "/2/users/by/username/\(username)"
    }
    var method: HTTPMethodType = .get
    let username: String

    init(username: String) {
        self.username = username
    }
}

struct User: Codable {
    var data: UserData

    struct UserData: Codable {
        var id: String
        var name: String
        var username: String
    }
}
