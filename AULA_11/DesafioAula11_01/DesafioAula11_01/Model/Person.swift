//
//  Person.swift
//  DesafioAula11_01
//
//  Created by SP11793 on 21/03/22.
//

import Foundation

// MARK: - Person
struct Person: Codable {
    let id: Int
    let name: String
    let photo: String
    let company: Company
}

// MARK: - Company
struct Company: Codable {
    let name: String
}
