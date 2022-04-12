import Foundation

struct ComicBaseData: Codable {
    let responseCode: Int
    let apiDataSource: ComicBookDataSource?
    enum CodingKeys: String, CodingKey {
        case responseCode = "code"
        case apiDataSource = "data"
    }
}
