import Foundation

final class Contents {
    static var shared: Contents = .init()

    static var bearerToken: String {
        getValue("bearer_token") as! String
    }

    static var clientId: String {
        getValue("client_id") as! String
    }

    static var oath2State: String {
        getValue("oauth2_state") as! String
    }

    static var oauth2CodeChallenge: String {
        getValue("oauth2_code_challenge") as! String
    }

    static let redirectURLString: String = "tosh7-twitter://twitter-auth/"

    var authCode: String?

    private static func getValue(_ key: String) -> Any? {
        // Get a value from plist file, if fails application stops immediately
        do {
            let url = Bundle.main.url(forResource:"Twitter", withExtension: "plist")!
            let data = try Data(contentsOf:url)
            let swiftDictionary = try PropertyListSerialization.propertyList(from: data, options: [], format: nil) as! [String:Any]
            return swiftDictionary[key]
        } catch {
            fatalError()
        }
    }
}
