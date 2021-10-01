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
    let results : [T]
}
