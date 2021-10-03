//
//  MovieDetailViewModelConstracts.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 2.10.2021.
//

import Foundation

protocol MovieDetailViewModelContracts {
    var delegate : MovieDetailViewModelDelegate? { get set }
    var movieDetail : MovieDetail? { get set }
    var movieRepository : MoviesRepositoryContracts { get  set }
    var movie : Movie? { get set }
    
    //MARK: - Functions
    func loadMovieDetail()
    func showIMDB()
    
    //MARK: - Local Functions
    func addFavorite()
    func removeFavorite()
    func favoriteItemIsAvailable() -> Movie?
}

enum MovieDetailViewModelRoute {
    case imdb(URL)
}

enum MovieDetailViewModelOutput {
    case movieDetail(detail : MovieDetail)
    case errorMovieDetail(error : TheMovieError)
    case indicator(isAnimate : Bool)
    case added
    case removed
}

protocol MovieDetailViewModelDelegate : AnyObject{
    func handleOutput(output : MovieDetailViewModelOutput)
    func navigate(to route : MovieDetailViewModelRoute)
}
