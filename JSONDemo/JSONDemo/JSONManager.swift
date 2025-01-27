//
//  Model.swift
//  JSONDemo
//
//  Created by Vaishnavi Wahgule on 25/01/25.
//

import Foundation

struct Person: Decodable {
    let firstName, surname, gender: String
    let age: Int
    let address: Address
    let phoneNumbers: [PhoneNumber]
    
    static let allPeople: [Person] = Bundle.main.decode(file: "example.json")
    static let samplePerson: Person = allPeople[0]
}

// MARK: - Address
struct Address: Decodable {
    let streetAddress, city, state, postalCode: String
}

// MARK: - PhoneNumber
struct PhoneNumber: Decodable {
    let type, number: String
}

extension Bundle {
    func decode<T : Decodable>(file:String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Could not find \(file) in the project")
        }
        guard let data = try? Data(contentsOf: url) else {
                        fatalError("Could not load \(file) from the project")
        }
        let decoder = JSONDecoder()
        guard let loadedData = try? decoder.decode(T.self, from: data) else {
                fatalError("Could not find \(file) in the project")
        }
        return loadedData
            
        
    }
}
