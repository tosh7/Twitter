// The MIT License (MIT)
//
// Copyright (c) 2021 Alexander Grebenyuk (github.com/kean).

import Foundation

protocol APIClientDelegate {
    func client(_ client: APIClient, willSendRequest request: inout URLRequest) async
    func shouldClientRetry(_ client: APIClient, withError error: Error) async -> Bool
    func client(_ client: APIClient, didReceiveInvalidationResponse response: HTTPURLResponse, data: Data) -> Error
}

actor APIClient {
    private let conf: Configuration
    private let session: URLSession
    private let serializer: Serializer
    private let delegate: APIClientDelegate
    private let loader = DataLoader()

    struct Configuration {
        var host: String
        var port: Int?
        /// If 'true', uses 'http' instead of 'https'.
        var isInsecure = false
        var sessionConfiguration: URLSessionConfiguration = .default
        var decoder: JSONDecoder?
        var encoder: JSONEncoder?
        /// The (optional) client delegate.
        var delegate: APIClientDelegate?
        /// The (optional) URLSession delegate that allows you to monitor the underlying URLSession.
        var sessionDelegate: URLSessionDelegate?

        init(host: String, sessionConfiguration: URLSessionConfiguration = .default, delegate: APIClientDelegate? = nil) {
            self.host = host
            self.sessionConfiguration = sessionConfiguration
            self.delegate = delegate
        }
    }

    /// Initializes the client with the given parameters.
    ///
    /// - paramater host: 
    convenience init(host: String, _ configure: (inout APIClient.Configuration) -> Void = { _ in }) {
        var configuration = Configuration(host: host)
        configure(&configuration)
        self.init(configuration: configuration)
    }

    init(configuration: Configuration) {
        self.conf = configuration
        let queue = OperationQueue(maxConcurrentOperationCount: 1)
        let delegate = URLSessionProxyDelegate.make(loader: loader, delegate: configuration.sessionDelegate)
        self.session = URLSession(configuration: configuration.sessionConfiguration, delegate: delegate, delegateQueue: queue)
        self.delegate = configuration.delegate ?? DefaultAPIClientDelegate()
        self.serializer = Serializer(decoder: configuration.decoder, encoder: configuration.encoder)
    }

//    public func send<T: Decodable>(_ request: Request<T?>) async throws -> Response<T?> {
//        try await send(request) { data in
//
//        }
//    }
}

enum APIError: Error, LocalizedError {
    case unaccepetedStatusCode(Int)

    var errorDescription: String? {
        switch self {
        case .unaccepetedStatusCode(let statusCode):
            return "Response status code was unacceptable: \(statusCode)."
        }
    }
}

extension APIClientDelegate {
    func client(_ client: APIClient, willSendRequest request: inout URLRequest) {}
    func shouldClientRetry(_ client: APIClient, withError error: Error) async -> Bool { false }
    func client(_ client: APIClient, didReceiveInvalidationResponse response: HTTPURLResponse, data: Data) -> Error {
        APIError.unaccepetedStatusCode(response.statusCode)
    }
}

private struct DefaultAPIClientDelegate: APIClientDelegate {}
