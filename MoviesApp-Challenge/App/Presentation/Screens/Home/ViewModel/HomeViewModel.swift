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
    
    func loadUpComing() {
        moviesRepository.upComing(language: nil, page: nil) {[weak self] result in
            guard let self = self else {return}
            switch result{
            case .success(let baseTheMovie):
                self.upComingModel = baseTheMovie
                self.notify(.refreshUpComing)
            case .failure(let error):
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
                self.notify(.refreshNowPlaying)
            case .failure(let error):
                self.notify(.nowPlayingError(error))
            }
        }
    }
    
    func refresh() {
        //MARK: - TODO
    }
    
    private func notify(_ output : HomeViewModelOutput){
        delegate?.handleOutput(output: output)
    }
}
