import Foundation

struct TweetsRequest: RequestType {
    var path: String {
        return "/2/tweets/\(tweetId)"
    }
    let method: HTTPMethodType = .get

    let tweetId: String

    init(tweetId: String) {
        self.tweetId = tweetId
    }
}

struct Tweets: Codable {

    var data: TweetsData

    struct TweetsData: Codable {
        var id: String
        var text: String
    }
}
