//
//  HomeViewModel.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

final class HomeViewModel : HomeViewModelContracts{
    
    var moviesRepository: MoviesRepositoryContracts
    
    init(moviesRepository : MoviesRepositoryContracts) {
        self.moviesRepository = moviesRepository
    }
    
    var nowPlayingModel: BaseTheMovie<Movie>?
    var upComingModel: BaseTheMovie<Movie>?
    var delegate: HomeViewModelDelegate?
    
    var upComingMovies: [Movie] = []
    var nowPlayinMovies: [Movie] = []
    var paginableStatus: Bool = true
    
    func loadUpComing(page : Int = 1) {
        moviesRepository.upComing(language: nil, page: page) {
            [weak self] result in
            guard let self = self else {return}
            
            switch result{
            case .success(let baseTheMovie):
                self.upComingModel = baseTheMovie
                self.upComingMovies.append(contentsOf: baseTheMovie.results)
                self.paginableStatus = true
                self.notify(.upComingIndicator(isHidden: true))
                self.notify(.refreshUpComing)
            case .failure(let error):
                self.notify(.upComingIndicator(isHidden: true))
                self.notify(.upComingError(error))
            }
            
        }
    }
    
    func loadNowPlaying() {
        moviesRepository.nowPlaying(language: nil, page: nil) {[weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let baseTheMovie):
                self.nowPlayingModel = baseTheMovie
                self.nowPlayinMovies.append(contentsOf: baseTheMovie.results)
                self.notify(.refreshNowPlaying(count: baseTheMovie.results.count))
            case .failure(let error):
                self.notify(.nowPlayingError(error))
            }
        }
    }
    
    func loadMoreUpComing() {
        if paginableStatus {
            if let upComingModel = upComingModel {
                if upComingModel.page <= upComingModel.totalPages{
                    paginableStatus = false
                    print(upComingModel.page+1)
                    loadUpComing(page: upComingModel.page + 1)
                }
            }
        }
    }
    
    func refresh() {
        upComingMovies = []
        notify(.upComingIndicator(isHidden: false))
        notify(.refreshUpComing)
        loadUpComing()
    }
    
    private func notify(_ output : HomeViewModelOutput){
        delegate?.handleOutput(output: output)
    }
}
