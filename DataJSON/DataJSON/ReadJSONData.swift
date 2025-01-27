//
//  ReadJSONData.swift
//  DataJSON
//
//  Created by Vaishnavi Wahgule on 25/01/25.
//

import Foundation
struct User: Decodable, Identifiable{
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}

class ReadData : ObservableObject {
    @Published var users = [User]()
    
    init() {
        loadData()
    }
    
    func loadData() {
        guard let url = Bundle.main.url(forResource: "example", withExtension: "json") else {
            print("json file not found")
            return
        }
        
        let data = try? Data(contentsOf: url)
        let users = try? JSONDecoder().decode([User].self, from: data!)
        self.users = users!
    }
}
