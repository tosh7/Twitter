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

    func makeGetRequest(path: String, completion: @escaping ((Result<Any, Error>) -> Void)) {
        let baseUrl = URL(string: baseUrlString + path)!
        var request = URLRequest(url: baseUrl)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.allHTTPHeaderFields = ["Authorization": "Bearer \(bearerToken)"]
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let data = data {
                do {
                    let object = try JSONSerialization.jsonObject(with: data)
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
}
