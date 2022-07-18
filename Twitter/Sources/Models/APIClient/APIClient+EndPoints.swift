import Foundation

extension ApiClient {
    func getTweet(_ request: TweetsRequest, completion:  @escaping ((Result<Tweets, Error>) -> Void)) { makeGetRequest(request: request, completion: completion) }
    func getTimeline(_ request: TimelinesRequest, completion: @escaping ((Result<Timelines, Error>) -> Void)) { makeGetRequest(request: request, completion: completion) }
}
