//
//  MovieDetailViewModel.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 2.10.2021.
//

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
    
    private func notify(_ output : MovieDetailViewModelOutput){
        delegate?.handleOutput(output: output)
    }
    
}
