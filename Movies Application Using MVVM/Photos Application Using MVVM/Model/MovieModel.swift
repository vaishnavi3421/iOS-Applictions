//
//  PhotosModel.swift
//  photos Application Using MVVM
//
//  Created by Vaishnavi Wahgule on 29/01/25.
//

import UIKit

class MovieModel: Decodable {
    var artistName: String?
    var trackName: String?
    
    init(artistName:String, trackName: String){
        self.artistName = artistName
        self.trackName = trackName
    }
}


class ResultsModel: Decodable {
    
    var results = [MovieModel]()
    
    init(results: [MovieModel]) {
        self.results = results
    }
    
}
