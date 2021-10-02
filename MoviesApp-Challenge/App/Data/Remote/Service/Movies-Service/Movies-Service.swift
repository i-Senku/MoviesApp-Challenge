//
//  Movies-Service.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

final class MoviesService  : MoviesDataService{
    
    func upComing(
        language: String,
        page: Int,
        completion: @escaping (Result<BaseTheMovie<Movie>, NetworkError>) -> Void) {
        
        NetworkExecuter.shared.execute(
            route: TheMovieAPI.upComing(language: language, page: page),
            responseModel: BaseTheMovie<Movie>.self,
            completion: completion)
    }
    
    func nowPlaying(
        language: String,
        page: Int,
        completion: @escaping (Result<BaseTheMovie<Movie>, NetworkError>) -> Void) {
        
        NetworkExecuter.shared.execute(
            route: TheMovieAPI.nowPlaying(language: language, page: page),
            responseModel: BaseTheMovie<Movie>.self,
            completion: completion)
    }
}
