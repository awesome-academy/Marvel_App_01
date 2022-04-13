import Foundation
import CommonCrypto

class RequestHandler {
    private var limit: Int = 30
    
    func getCharactersURLRequest(pageNumber: Int = 0) -> URLRequest? {
        let endpoint = "/v1/public/characters"
        let url = Constants.baseURL + endpoint + buildQueryString(pageNumber: pageNumber, isCharacterList: true)
        guard let url = URL(string: url) else { return nil }
        return URLRequest(url: url)
    }
    
    func getComicsURLRequest(id: Int) -> URLRequest? {
        let endpoint = "/v1/public/characters/\(id)/comics"
        let url = Constants.baseURL + endpoint + buildQueryString()
        guard let url = URL(string: url) else { return nil }
        return URLRequest(url: url)
    }
    
    private func buildQueryString(pageNumber: Int = 0, isCharacterList: Bool = false) -> String {
        let timeStamp = Date().timeIntervalSince1970
        var queryString = "?ts=\(timeStamp)&apikey=\(Constants.publicKey)&hash=\(buildHashToken(timestamp: timeStamp))"
        if isCharacterList {
            var pageNumber = pageNumber
            pageNumber = limit * pageNumber
            queryString += "&limit=\(limit)&offset=\(pageNumber)"
        }
        return queryString
    }
    
    private func buildHashToken(timestamp: TimeInterval) -> String {
        let unhashedString = "\(timestamp)" + Constants.privateKey + Constants.publicKey
        return unhashedString.encodeMD5()
    }
}
