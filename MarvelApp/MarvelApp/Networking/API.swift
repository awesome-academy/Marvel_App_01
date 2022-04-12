//
//  API.swift
//  MarvelApp
//
//  Created by Lê Tiến Đạt on 12/04/2022.
//

import Foundation

class APICaller {
    static let shared = APICaller()
    private init() {
        print("APICaller Singleton initialized!")
    }
    func decoderWithRequest<T: Decodable> (
        _ type: T.Type,
        fromURLRequest urlRequest: URLRequest ,
        completion: @escaping (T?, Error?) -> Void) {
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? -1
            if let data = data, 200...299 ~= statusCode {
                do {
                    let result = try JSONDecoder().decode(type, from: data)
                    completion(result, nil)
                } catch let error {
                    completion(nil, error)
                }
            } else {
                completion(nil, error)
            }
        }.resume()
    }
}
