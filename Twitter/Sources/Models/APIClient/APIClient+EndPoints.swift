import Foundation

extension ApiClient {
    func getTweet(tweetId: String, completion: @escaping ((Result<Any, Error>) -> Void)) {
        makeGetRequest(path: "/2/tweets/\(tweetId)", completion: completion)
    }

    func getTimeline(completion: @escaping ((Result<Any, Error>) -> Void)) {
        makeGetRequest(path: "/2/users/tosh_3/timelines/reverse_chronological", completion: completion)
    }
}
