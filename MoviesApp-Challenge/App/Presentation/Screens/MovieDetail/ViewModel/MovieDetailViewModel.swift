//
//  MovieDetailViewModel.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 2.10.2021.
//

import Foundation

final class MovieDetailViewModel : MovieDetailViewModelContracts{
    
    weak var delegate: MovieDetailViewModelDelegate?
    var movieRepository: MoviesRepositoryContracts
    var movieDetail: MovieDetail?
    var movie: Movie?
    
    init(movieRepository : MoviesRepositoryContracts) {
        self.movieRepository = movieRepository
    }
    
    func loadMovieDetail() {
        if let movieId = movie?.id {
            notify(.indicator(isAnimate: true))
            movieRepository.movieDetail(movieId: String(movieId)) { [weak self] result in
                guard let self = self else {return}
                
                self.notify(.indicator(isAnimate: false))
                switch result {
                
                case .success(let movieDetail):
                    self.movieDetail = movieDetail
                    self.notify(.movieDetail(detail: movieDetail))
                    
                case .failure(let error):
                    self.notify(.errorMovieDetail(error: error))
                }
                
            }
        }
    }
    
    func showIMDB() {
        if let movieDetail = movieDetail{
            guard let imdbId = movieDetail.imdbId else { return }
            if let url =  URL(string: "https://www.imdb.com/title/\(imdbId)/"){
                delegate?.navigate(to: .imdb(url))
            }
        }
    }
    
    func addFavorite() {
        guard let movie = movie else { return }
        let status = movieRepository.addFavorite(item: movie)
        if status{
            notify(.added)
        }
    }
    
    func removeFavorite() {
        guard let movie = movie else { return }
        let status = movieRepository.deleteFavoriteById(id:movie.id)
        if status {
            notify(.removed)
        }
    }
    
    func favoriteItemIsAvailable() -> Movie? {
        if let movie = movie {
            return movieRepository.favoriteIsAvailable(primaryKey: movie.id)
        }else {
            return nil
        }
    }
    
    private func notify(_ output : MovieDetailViewModelOutput){
        delegate?.handleOutput(output: output)
    }
    
}
