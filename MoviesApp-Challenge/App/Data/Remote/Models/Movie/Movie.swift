//
//  Movies.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation
import RealmSwift

class Movie : Object, BaseResult, Decodable {
    
    @Persisted var adult : Bool
    @Persisted var backdrop_path : String?
    @Persisted var genre_ids : List<Int>
    @Persisted var id: Int
    @Persisted var originalLanguage: String
    @Persisted var originalTitle: String
    @Persisted var overview: String
    @Persisted var popularity: Double
    @Persisted var posterPath: String?
    @Persisted var releaseDate: String
    @Persisted var title: String
    @Persisted var video : Bool
    @Persisted var voteAverage: Double
    @Persisted var voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdrop_path = "backdrop_path"
        case genre_ids = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
}
