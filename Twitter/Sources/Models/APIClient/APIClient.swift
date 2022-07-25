import Foundation

final class ApiClient {
    static let shared: ApiClient = ApiClient()
    let baseUrlString = "https://api.twitter.com"
    var bearerToken: String = Contents.bearerToken

    init() {}

    func makeGetRequest<Request, Response>(request: Request, completion: @escaping((Result<Response, Error>) -> Void)) where Request: RequestType, Response: Codable {
        let baseUrl = URL(string: baseUrlString + request.path)!
        var request = URLRequest(url: baseUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = ["Authorization": "Bearer \(bearerToken)"]
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(response))
                } catch let error {
                    completion(.failure(error))
                }

            } else {
                completion(.failure(error!))
            }
        }
        task.resume()
    }

    func makeGetRequest<Request, Response>(request: Request) async -> Result<Response, Error> where Request: RequestType, Response: Codable {
        await withUnsafeContinuation { continuation in
            self.makeGetRequest(request: request, completion: {
                continuation.resume(with: .success($0))
            })
        }
    }

    func makePostRequest<Request, Response>(request: Request, completion: @escaping((Result<Response, Error>) -> Void)) where Request: RequestType & URLEncodable, Response: Codable {
        let baseUrl = URL(string: baseUrlString + request.path)!
        let data: [String: Any] = request.queries
        guard let httpBody = try? JSONSerialization.data(withJSONObject: data, options: []) else { return }
        var request = URLRequest(url: baseUrl)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = httpBody
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let object = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(object))
                } catch let error {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(error!))
            }
        }
        task.resume()
    }

    func makePostRequest<Request, Response>(request: Request) async -> Result<Response, Error> where Request: RequestType & URLEncodable, Response: Codable {
        await withUnsafeContinuation { continutation in
            self.makePostRequest(request: request, completion: {
                continutation.resume(with: .success($0))
            })
        }
    }
}
