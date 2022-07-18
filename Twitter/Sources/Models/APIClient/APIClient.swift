import Foundation

final class ApiClient {
    static let shared: ApiClient = ApiClient()
    let baseUrlString = "https://api.twitter.com"
    let bearerToken: String

    init() {
        // Get access token from plist file, if fails application stops immediately
        do {
            let url = Bundle.main.url(forResource:"Twitter", withExtension: "plist")!
            let data = try Data(contentsOf:url)
            let swiftDictionary = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
            bearerToken = swiftDictionary["bearer_token"] as! String
        } catch {
            fatalError()
        }
    }

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
}
