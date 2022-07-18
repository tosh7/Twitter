import Foundation

struct TimelinesRequest: RequestType {
    var path: String {
        return "/2/users/\(userName)/timelines/reverse_chronological"
    }
    let method: HTTPMethodType = .get
    let userName: String = "tosh_3"
}

struct Timelines: Codable {}
