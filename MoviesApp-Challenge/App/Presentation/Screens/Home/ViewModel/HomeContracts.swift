//
//  HomeViewModelContracts.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

protocol HomeViewModelContracts {
    var nowPlayingModel : BaseTheMovie<Movie>? { get set }
    var upComingModel : BaseTheMovie<Movie>? { get set }
    var delegate : HomeViewModelDelegate? { get set }
    var moviesRepository : MoviesRepositoryContracts { get set }
    
    //MARK: - Functions
    func loadUpComing()
    func loadNowPlaying()
    func refresh()
}

enum HomeViewModelOutput{
    case refreshNowPlaying
    case refreshUpComing
    case nowPlayingError(TheMovieError)
    case upComingError(TheMovieError)
}



protocol HomeViewModelDelegate : AnyObject {
    func handleOutput(output : HomeViewModelOutput)
}
