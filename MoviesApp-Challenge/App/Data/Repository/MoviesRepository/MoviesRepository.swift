//
//  MoviesRepository.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

final class MoviesRepository : MoviesRepositoryContracts {
    let moviesDataService : MoviesDataService
    
    //MARK: - Inject MoviesDataService
    init(moviesDataService : MoviesDataService) {
        self.moviesDataService = moviesDataService
    }
    
    func upComing(language: String, page: Int, completion: @escaping (Result<BaseTheMovie<Movie>, TheMovieError>) -> Void) {
        moviesDataService.upComing(language: language, page: page){ result in
            switch result {
            case .success(let theMovieResponseModel):
                completion(.success(theMovieResponseModel))
            case .failure(let networkError):
                completion(.failure(networkError.toTheMovieError()!))
            }
        }
    }
    
    func nowPlaying(language: String, page: Int, completion: @escaping (Result<BaseTheMovie<Movie>, TheMovieError>) -> Void) {
        moviesDataService.nowPlaying(language: language, page: page){ result in
            switch result {
            case .success(let theMovieResponseModel):
                completion(.success(theMovieResponseModel))
            case .failure(let networkError):
                completion(.failure(networkError.toTheMovieError()!))
            }
        }
    }
    
}
