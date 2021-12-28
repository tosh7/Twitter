// The MIT License (MIT)
//
// Copyright (c) 2021 Alexander Grebenyuk (github.com/kean).

import Foundation

protocol APIClientDelegate {

}

actor APIClient {
    private let conf: Configuration
//    private let session: URLSession
//    private let serializer
//    private let delegate: APIClientDelegate
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

    init(configuration: Configuration) {
        self.conf = configuration
        let queue = OperationQueue()
        queue.maxConcurrentOperationCount = 1
        let delegate = URLSessionProxyDelegate.make(loader: loader, delegate: configuration.sessionDelegate)
    }
}
