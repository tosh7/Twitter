import Foundation

extension ApiClient {
    func getTweet(_ request: TweetsRequest, completion:  @escaping ((Result<Tweets, Error>) -> Void)) { makeGetRequest(request: request, completion: completion) }
    func getTimeline(_ request: TimelinesRequest, completion: @escaping ((Result<Timelines, Error>) -> Void)) { makeGetRequest(request: request, completion: completion) }
    func getUser(_ request: UserRequest, completion: @escaping ((Result<User, Error>) -> Void)) { makeGetRequest(request: request, completion: completion) }
}

extension ApiClient {
    func getTweet(_ request: TweetsRequest) async -> Result<Tweets, Error> { await self.makeGetRequest(request: request) }
    func getTimeline(_ request: TimelinesRequest) async -> Result<Timelines, Error> { await self.makeGetRequest(request: request) }
    func getUser(_ request: UserRequest) async -> Result<User, Error> { await self.makeGetRequest(request: request) }
}
