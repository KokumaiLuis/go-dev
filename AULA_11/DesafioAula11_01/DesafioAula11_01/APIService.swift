//
//  APIService.swift
//  DesafioAula11_01
//
//  Created by SP11793 on 21/03/22.
//

import Foundation
import UIKit

enum PersonError: Error {
    case invalidUrl
    case noProcessData
    case noDataAvailable
}


protocol ServiceProtocol{
    
    func getPersons(completion: @escaping(Result<[Person], PersonError>) -> Void)
    
    
}


class APIService: ServiceProtocol {
    
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/f0c36709-84e2-4043-a0f0-3bec512f6c84"
    
    static var shared: APIService = {
        let instance = APIService()
        return instance
    }()
    
    
    func getPersons(completion: @escaping(Result<[Person], PersonError>) -> Void) {
        
        guard let url = URL(string: url) else { return completion(.failure(.invalidUrl)) }
        
        let dataTask = session.dataTask(with: url) { data, _, _ in
            
            do {
                
                guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                
                let userResponse = try decoder.decode([Person].self, from: jsonData)
                
                completion(.success(userResponse))
                
            } catch {
                completion(.failure(.noProcessData))
            }
            
        }
        
        dataTask.resume()
        
    }
    
    
}
