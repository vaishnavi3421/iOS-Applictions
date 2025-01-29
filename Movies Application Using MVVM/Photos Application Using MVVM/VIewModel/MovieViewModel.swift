//
//  MovieViewModel.swift
//  photos Application Using MVVM
//
//  Created by Vaishnavi Wahgule on 29/01/25.
//

import UIKit

class MovieViewModel: NSObject {
    var artistName: String?
    var trackName: String?
    
    init(movie:MovieModel){
        self.artistName = movie.artistName
        self.trackName = movie.trackName
    }
}
