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
    
    var paginableStatus : Bool { get set }
    
    var upComingMovies : [Movie] { get set }
    var nowPlayinMovies : [Movie] { get set }
    
    //MARK: - Functions
    func loadUpComing(page : Int)
    func loadMoreUpComing()
    func loadNowPlaying()
    func refresh()
}

//MARK: - Outputs
enum HomeViewModelOutput{
    case refreshNowPlaying(count:Int)
    case refreshUpComing
    case nowPlayingError(TheMovieError)
    case upComingError(TheMovieError)
    case upComingIndicator(isHidden : Bool)
}

//MARK: - Delegate
protocol HomeViewModelDelegate : AnyObject {
    func handleOutput(output : HomeViewModelOutput)
}
