import Foundation

struct TimelinesRequest: RequestType {
    var path: String {
        "/2/users/\(id)/timelines/reverse_chronological"
    }
    let method: HTTPMethodType = .get
    var id: String

    init(id: String) {
        self.id = id
    }
}

struct Timelines: Codable {
    var data: [TweetData]
    var includes: Includes?

    struct TweetData: Codable {
        var id: String
        var text: String
        var created_at: String?
        var author_id: String?
    }

    struct Includes: Codable {
        var users: [User]

        struct User: Codable {
            var created_at: String
            var name: String
            var username: String
            var id: String
        }
    }
}
