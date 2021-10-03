//
//  FavoriteMoviesViewModel.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 3.10.2021.
//

import Foundation

final class FavoriteMovieViewModel : FavoriteMovieViewModelContracts {
    
    weak var delegate: FavoriteMovieViewModelDelegate?
    var moviesRepository: MoviesRepositoryContracts
    var movieList: [Movie] = []
    
    init(moviesRepository : MoviesRepositoryContracts) {
        self.moviesRepository = moviesRepository
    }
    
    func loadFavorites() {
        movieList = moviesRepository.getFavorites()
        notify(.reloadTableView)
    }
    
    func didSelectItem(_ indexPath: IndexPath) {
        let movie = movieList[indexPath.row]
        let viewModel = MovieDetailViewModel(movieRepository: AppRepository.shared.movieRepository)
        viewModel.movie = movie
        delegate?.route(route: .movieDetail(viewModel))
    }
    
    func clear() {
        let status = moviesRepository.deleteAllFavorites()
        if status {
            loadFavorites()
            notify(.cleared(status))
        }else{
            notify(.cleared(false))
        }
    }
    
    func deleteFavorite(indexPath : IndexPath) {
        let item = movieList[indexPath.row]
        let status = moviesRepository.deleteFavorite(item: item)
        if status {
            movieList.remove(at: indexPath.row)
            notify(.reloadTableView)
            notify(.deleted(status))
        }else {
            notify(.deleted(false))
        }
    }
    
    
    fileprivate func notify(_ output : FavoriteMovieViewModelOutput){
        delegate?.handleOutput(output: output)
    }
    
}
