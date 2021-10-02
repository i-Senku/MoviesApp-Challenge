//
//  HomeViewModelContracts.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

//MARK: - Contracts
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

//MARK: - Outputs
enum HomeViewModelOutput{
    case refreshNowPlaying(count:Int)
    case refreshUpComing
    case nowPlayingError(TheMovieError)
    case upComingError(TheMovieError)
}



//MARK: - Delegate
protocol HomeViewModelDelegate : AnyObject {
    func handleOutput(output : HomeViewModelOutput)
}
