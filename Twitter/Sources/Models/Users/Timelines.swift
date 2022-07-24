import Foundation

struct TimelinesRequest: RequestType {
    var path: String {
        "/2/users/\(id)/timelines/reverse_chronological"
    }
    let method: HTTPMethodType = .get
    let id: String = "992472351693406208"
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
