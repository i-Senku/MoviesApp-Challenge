//
//  MovieDetail.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 2.10.2021.
//

import Foundation

struct MovieDetail : Decodable {
    let backdropPath : String?
    let id : Int
    let imdbId : String?
    let originalTitle : String
    let overview : String?
    let popularity : Double
    let releaseDate : String
    let voteAverage : Double
    let title : String
    let tagline : String?
    let posterPath : String
    
    enum CodingKeys : String, CodingKey{
        case backdropPath = "backdrop_path"
        case id = "id"
        case imdbId = "imdb_id"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case title = "title"
        case tagline = "tagline"
        case posterPath = "poster_path"
    }
}
