//
//  BaseTheMovie.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

struct BaseTheMovie<T : BaseResult> : Decodable {
    let totalPages : Int
    let totalResults : Int
    let page : Int
    let results : [T]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
        case page = "page"
        case totalResults = "total_pages"
        case totalPages = "total_results"
    }
}
