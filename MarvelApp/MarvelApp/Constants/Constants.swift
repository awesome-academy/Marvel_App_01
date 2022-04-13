import Foundation
struct Constants {
    static let baseURL = "https://api.themoviedb.org/3"
    static var privateKey: String {
        var privateKey: NSDictionary?
        var apiKey = ""
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            privateKey = NSDictionary(contentsOfFile: path)
        }

        if let dict = privateKey {
            apiKey = dict["APIKey"] as? String ?? "No APIKey"
        }

        return apiKey
    }
    static var publicKey: String {
        var publicKey: NSDictionary?
        var apiKey = ""
        if let path = Bundle.main.path(forResource: "Keys", ofType: "plist") {
            publicKey = NSDictionary(contentsOfFile: path)
        }

        if let dict = publicKey {
            apiKey = dict["APIKey"] as? String ?? "No APIKey"
        }

        return apiKey
    }
}
