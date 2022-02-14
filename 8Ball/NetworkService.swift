//
//  NetworkManager.swift
//  8Ball
//
//  Created by Alexandr Kutorai on 26.01.2022.
//

import Foundation

class NetworkService {
    
    static func getMagic(completion: @escaping (Result <Model?, Error>) -> Void) {
        
        let urlString = "https://8ball.delegator.com/magic/JSON/how_are_you"
        
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            do {
                let result = try JSONDecoder().decode(Model.self, from: data!)
                completion(.success(result))
            } catch {
                completion(.failure(error))
            }
        }.resume()
        
    }
    
}
