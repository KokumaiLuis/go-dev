//
//  Services.swift
//  Aula10_01
//
//  Created by SP11793 on 18/03/22.
//

import Foundation
import UIKit

enum UserError: Error {
    case invalidUrl
    case noProcessData
    case noDataAvailable
}


protocol ServiceProtocol{
    
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void)
    
    
}


class Service: ServiceProtocol {
    
    let session = URLSession.shared
    let url = "https://run.mocky.io/v3/e8074c32-6b7a-47dd-beed-8a1490ff3ead"
    
    static var shared: Service = {
        let instance = Service()
        return instance
    }()
    
    
    func getUsers(completion: @escaping(Result<[User], UserError>) -> Void) {
        
        guard let url = URL(string: url) else { return completion(.failure(.invalidUrl)) }
        
        let dataTask = session.dataTask(with: url) { data, _, _ in
            
            do {
                
                guard let jsonData = data else { return completion(.failure(.noDataAvailable)) }
                
                let decoder = JSONDecoder()
                
                let userResponse = try decoder.decode([User].self, from: jsonData)
                
                completion(.success(userResponse))
                
            } catch {
                completion(.failure(.noProcessData))
            }
            
        }
        
        dataTask.resume()
        
    }
    
    
}
