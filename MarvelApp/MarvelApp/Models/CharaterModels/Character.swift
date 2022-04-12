import Foundation

struct Character: Codable {
    let id: Int
    let name: String?
    let description: String?
    let modified: String?
    let thumbnail: Thumbnail?
    let resourceURI: String?
    let comics: CharacterComics?
}
