import Foundation

struct BaseData<T: Codable>: Codable {
    let responseCode: Int
    let apiDataSource: T?
    
    enum CodingKeys: String, CodingKey {
        case responseCode = "code"
        case apiDataSource = "data"
    }
}
