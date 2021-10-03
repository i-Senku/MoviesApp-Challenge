//
//  AppRepository.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 3.10.2021.
//

import Foundation
class AppRepository {
    static var shared = AppRepository()
    
    let movieRepository = MoviesRepository(
        moviesDataService: MoviesService(),
        moviesLocalDataService: FavoritesLocalService())
}
