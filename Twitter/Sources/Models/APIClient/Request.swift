// The MIT License (MIT)
//
// Copyright (c) 2021 Alexander Grebenyuk (github.com/kean).

import Foundation

struct Request<Response> {
    var method: String
    var path: String
    var query: [(String, String?)]?
    var body: AnyEncodable?
    var headers: [String: String]?
    var id: String?

    static func get(_ path: String, query: [(String, String?)]? = nil, headers: [String: String]? = nil) -> Request {
        Request(method: "GET", path: path, query: query, headers: headers)
    }

    static func post(_ path: String, query: [(String, String?)]? = nil, header: [String: String]? = nil) -> Request {
        Request(method: "POST", path: path, query: query, headers: header)
    }

    static func post<U: Encodable>(_ path: String, query: [(String, String?)]? = nil, body: U?, headers: [String: String]? = nil) -> Request {
        Request(method: "POST", path: path, query: query, body: body.map(AnyEncodable.init), headers: headers)
    }
}

/// A response with a value and associated metadata.
struct Response<T> {
    var value: T
    /// Original respose data.
    var data: Data
    /// Original request.
    var request: URLRequest
    var response: URLResponse
    var statusCode: Int? { (response as? HTTPURLResponse)?.statusCode }
    var metrics: URLSessionTaskMetrics?

    init(value: T, data: Data, request: URLRequest, response: URLResponse, metrics: URLSessionTaskMetrics? = nil) {
        self.value = value
        self.data = data
        self.request = request
        self.response = response
        self.metrics = metrics
    }

    func map<U>(_ closure: (T) -> U) -> Response<U> {
        Response<U>(value: closure(value), data: data, request: request, response: response, metrics: metrics)
    }
}
