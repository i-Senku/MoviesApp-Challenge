//
//  MoviesRepository.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

final class MoviesRepository : MoviesRepositoryContracts {
    let moviesDataService : MoviesDataSource
    
    //MARK: - Inject MoviesDataService
    init(moviesDataService : MoviesDataSource) {
        self.moviesDataService = moviesDataService
    }
    
    func upComing(
        language: String?,
        page: Int?,
        completion: @escaping (Result<BaseTheMovie<Movie>, TheMovieError>) -> Void) {
        
        moviesDataService.upComing(language: language ?? "en-US", page: page ?? 1){ result in
            switch result {
            case .success(let theMovieResponseModel):
                completion(.success(theMovieResponseModel))
            case .failure(let networkError):
                completion(.failure(networkError.toTheMovieError()))
            }
        }
    }
    
    func nowPlaying(
        language: String?,
        page: Int?,
        completion: @escaping (Result<BaseTheMovie<Movie>, TheMovieError>) -> Void) {
        
        moviesDataService.nowPlaying(language: language ?? "en-US", page: page ?? 1){ result in
            switch result {
            case .success(let theMovieResponseModel):
                completion(.success(theMovieResponseModel))
            case .failure(let networkError):
                completion(.failure(networkError.toTheMovieError()))
            }
            
        }
    }
    
    func movieDetail(
        movieId: String, completion: @escaping (Result<MovieDetail, TheMovieError>) -> Void) {
        moviesDataService.movieDetail(movieId: movieId) { result in
            switch result {
            case .success(let movieDetail):
                completion(.success(movieDetail))
            case .failure(let error):
                completion(.failure(error.toTheMovieError()))
            }
        }
    }
    
    
}
