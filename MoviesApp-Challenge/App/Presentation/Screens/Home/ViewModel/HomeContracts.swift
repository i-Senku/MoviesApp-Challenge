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
    //MARK: - Reload
    case reloadSlider(count:Int)
    case reloadUpComingTableView
    
    //MARK: - Errors
    case nowPlayingError(TheMovieError)
    case upComingError(TheMovieError)
    
    //MARK: - Indicators
    case indicatorOfUpComing(isAnimate : Bool)
    case indicatorOfSlider(isAnimate : Bool)
    case refreshed
}

//MARK: - Delegate
protocol HomeViewModelDelegate : AnyObject {
    func handleOutput(output : HomeViewModelOutput)
}
