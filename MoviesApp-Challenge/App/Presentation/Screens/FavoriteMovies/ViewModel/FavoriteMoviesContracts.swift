//
//  FavoriteMoviesContracts.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 3.10.2021.
//

import Foundation

protocol FavoriteMovieViewModelContracts {
    var delegate : FavoriteMovieViewModelDelegate? { get set }
    var moviesRepository : MoviesRepositoryContracts { get set }
    var movieList : [Movie] { get set }
    
    //MARK: - Functions
    func loadFavorites()
    func didSelectItem(_ indexPath : IndexPath)
    func deleteFavorite(indexPath : IndexPath)
    func clear()
}

enum FavoriteMovieViewModelRoute {
    case movieDetail(_ viewModel : MovieDetailViewModelContracts)
}

enum FavoriteMovieViewModelOutput {
    case reloadTableView
    case cleared(Bool)
    case deleted(Bool)
}

protocol FavoriteMovieViewModelDelegate : AnyObject {
    func handleOutput(output : FavoriteMovieViewModelOutput)
    func route(route : FavoriteMovieViewModelRoute)
}
