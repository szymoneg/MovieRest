//
//  Model.swift
//  FetchMovieList
//
//  Created by Szymon Biliński on 25/03/2021.
//

import Foundation


struct MoviesData: Decodable {
    let movies: [Movie]
    
    private enum CodingKeys: String, CodingKey{
        case movies = "results"
    }
}

struct Movie: Decodable {
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let overView: String?
    
    private enum CodingKeys: String, CodingKey{
        case title, overView
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}
