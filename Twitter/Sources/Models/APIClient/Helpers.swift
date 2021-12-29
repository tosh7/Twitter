// The MIT License (MIT)
//
// Copyright (c) 2021 Alexander Grebenyuk (github.com/kean).

import Foundation

struct AnyEncodable: Encodable {
    private let value: Encodable

    init(_ value: Encodable) {
        self.value = value
    }

    func encode(to encoder: Encoder) throws {
        try value.encode(to: encoder)
    }
}

extension URLRequest {
    func cURLDescription() -> String {
        guard let url = url, let method = httpMethod else {
            return "$ curl command generation failed"
        }
        var components = ["curl -v"]
        components.append("-X \(method)")
        for header in allHTTPHeaderFields ?? [:] {
            let escapedValue = header.value.replacingOccurrences(of: "\"", with: "\\\"")
            components.append("-H \"\(header.key): \(escapedValue)\"")
        }
        if let httpodyData = httpBody {
            let httpBody = String(decoding: httpodyData, as: UTF8.self)
            var escapedBody = httpBody.replacingOccurrences(of: "\\\"", with: "\\\\\"")
            escapedBody = escapedBody.replacingOccurrences(of: "\"", with: "\\\"")
            components.append("-d \"\(escapedBody)\"")
        }
        components.append("\"\(url.absoluteString)\"")
        return components.joined(separator: " \\\n\t")
    }
}

final class DataLoader: NSObject, URLSessionDelegate {
    private var handelers = [URLSessionTask: TaskHandler]()
    private typealias Completion = (Result<(Data, URLResponse, URLSessionTaskMetrics?), Error>) -> Void

    private final class TaskHandler {
        var data: Data?
        var metrics: URLSessionTaskMetrics?
        let completion: Completion

        init(completion: @escaping Completion) {
            self.completion = completion
        }
    }
}

final class URLSessionProxyDelegate: NSObject, URLSessionTaskDelegate, URLSessionDataDelegate {
    private var delegate: URLSessionDelegate
    private let interceptedSelectors: Set<Selector>
    private let loader: DataLoader

    static func make(loader: DataLoader, delegate: URLSessionDelegate?) -> URLSessionDelegate {
        guard let delegate = delegate else { return loader }
        return URLSessionProxyDelegate(loader: loader, delegate: delegate)
    }

    init(loader: DataLoader, delegate: URLSessionDelegate) {
        self.loader = loader
        self.delegate = delegate
        self.interceptedSelectors = [
            #selector(URLSessionDataDelegate.urlSession(_:dataTask:didReceive:)),
            #selector(URLSessionDataDelegate.urlSession(_:task:didCompleteWithError:)),
            #selector(URLSessionDataDelegate.urlSession(_:task:didFinishCollecting:))
        ]
    }
}

extension OperationQueue {
    convenience init(maxConcurrentOperationCount: Int) {
        self.init()
        self.maxConcurrentOperationCount = maxConcurrentOperationCount
    }
}
