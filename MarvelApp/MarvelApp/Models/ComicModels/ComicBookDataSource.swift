import Foundation

struct ComicBookDataSource: Codable {
    let comics: [Comic]
    
    enum CodingKeys: String, CodingKey {
        case comics = "results"
    }
}
