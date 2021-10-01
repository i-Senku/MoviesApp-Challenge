//
//  Movies.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

struct Movie : BaseResult ,Decodable {
    
    let adult : Bool
    let backdroPath : String?
    let genreIds : [Int]
    let id: Int
    let originalLanguage: String
    let original_title: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let release_date: String
    let title: String
    let video : Bool
    let vote_average: Int
    let vote_count: Int
    
}
