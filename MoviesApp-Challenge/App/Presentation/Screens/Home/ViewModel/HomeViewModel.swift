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
    weak var delegate: HomeViewModelDelegate?
    
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
                self.upComingMovies += baseTheMovie.results
                self.notify(.indicatorOfUpComing(isAnimate: false))
                self.notify(.reloadUpComingTableView)
                self.paginableStatus = true
            case .failure(let error):
                self.notify(.indicatorOfUpComing(isAnimate: false))
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
                self.notify(.indicatorOfSlider(isAnimate: false))
                self.notify(.reloadSlider(count: baseTheMovie.results.count))
            case .failure(let error):
                self.notify(.indicatorOfSlider(isAnimate: false))
                self.notify(.nowPlayingError(error))
            }
        }
    }
    
    func loadMoreUpComing() {
        if paginableStatus {
            if let upComingModel = upComingModel {
                if upComingModel.page <= upComingModel.totalPages{
                    paginableStatus = false
                    self.notify(.indicatorOfUpComing(isAnimate: true))
                    loadUpComing(page: upComingModel.page + 1)
                }
            }
        }
    }
    
    func refresh() {
        notify(.indicatorOfUpComing(isAnimate: true))
        moviesRepository.upComing(language: nil, page: 1) {
            [weak self] result in
            guard let self = self else {return}
            
            switch result{
            case .success(let baseTheMovie):
                self.upComingModel = baseTheMovie
                self.upComingMovies = baseTheMovie.results
                self.notify(.indicatorOfUpComing(isAnimate: false))
                self.notify(.reloadUpComingTableView)
                self.notify(.refreshed)
            case .failure(let error):
                self.notify(.indicatorOfUpComing(isAnimate: false))
                self.notify(.upComingError(error))
            }
            
        }
    }
    
    private func notify(_ output : HomeViewModelOutput){
        delegate?.handleOutput(output: output)
    }
}
