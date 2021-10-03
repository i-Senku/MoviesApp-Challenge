//
//  MoviesRepositoryContracts.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

protocol MoviesRepositoryContracts {
    func upComing(language : String?,page : Int?,completion : @escaping (Result<BaseTheMovie<Movie>,TheMovieError>) -> Void)
    
    func nowPlaying(language : String?,page : Int?,completion : @escaping (Result<BaseTheMovie<Movie>,TheMovieError>) -> Void)
    
    func movieDetail(movieId : String,completion : @escaping (Result<MovieDetail,TheMovieError>)-> Void)
    
    
    func getFavorites() -> [Movie]
    func addFavorite(item : Movie) -> Bool
    func deleteFavorite(item : Movie) -> Bool
    func deleteFavoriteById(id : Any) -> Bool
    func favoriteIsAvailable(primaryKey : Any) -> Movie?
    func deleteAllFavorites() -> Bool
}


