//
//  MoviesDataService.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

protocol MoviesDataService {
    func upComing(language : String,page : Int,completion : @escaping (Result<BaseTheMovie<Movie>,NetworkError>) -> Void)
    
    func nowPlaying(language : String,page : Int,completion : @escaping (Result<BaseTheMovie<Movie>,NetworkError>) -> Void)
    
    func movieDetail(movieId : String,completion : @escaping (Result<MovieDetail,NetworkError>)->Void)
}
