//
//  MoviesRepository.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

final class MoviesRepository : MoviesRepositoryContracts {
    let moviesDataService : MoviesDataSource
    let moviesLocalDataService : FavoritesLocalDataSource
    
    //MARK: - Inject MoviesDataService
    init(moviesDataService : MoviesDataSource,moviesLocalDataService : FavoritesLocalDataSource) {
        self.moviesDataService = moviesDataService
        self.moviesLocalDataService = moviesLocalDataService
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
    
    func getFavorites() -> [Movie] {
        return moviesLocalDataService.getFavorites()
    }
    
    func addFavorite(item: Movie) -> Bool {
        return moviesLocalDataService.addFavorite(item: item)
    }
    
    func deleteFavorite(item : Movie) -> Bool {
        return moviesLocalDataService.deleteFavorite(item: item)
    }
    
    func deleteFavoriteById(id: Any) -> Bool {
        let item = favoriteIsAvailable(primaryKey: id)
        if let item = item {
            return deleteFavorite(item: item)
        }else{
            return false
        }
    }
    
    func deleteAllFavorites() -> Bool {
        return moviesLocalDataService.deleteAllFavorites()
    }
    
    func favoriteIsAvailable(primaryKey: Any) -> Movie? {
        return moviesLocalDataService.favoriteIsAvailable(primaryKey: primaryKey)
    }
    
}
