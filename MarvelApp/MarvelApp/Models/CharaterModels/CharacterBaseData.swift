import Foundation

struct CharacterBaseData: Codable {
    let responseCode: Int?
    let apiDataSource: CharacterDataSource?
    enum CodingKeys: String, CodingKey {
        case responseCode = "code"
        case apiDataSource = "data"
    }
}
