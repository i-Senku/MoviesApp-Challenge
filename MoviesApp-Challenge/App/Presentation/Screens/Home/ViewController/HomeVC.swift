//
//  HomeVC.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation
import UIKit

final class HomeVC : UIViewController {
    
    var homeViewModel : HomeViewModelContracts = HomeViewModel(moviesRepository: MoviesRepository(moviesDataService: MoviesService()))
    
    @IBOutlet weak var upComingTableView: UpComingTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    
    fileprivate func start(){
        homeViewModel.delegate = self
        upComingTableView.homeViewModel = homeViewModel
        homeViewModel.loadUpComing()
        //homeViewModel.loadNowPlaying()
    }
}

extension HomeVC : HomeViewModelDelegate {
    func handleOutput(output: HomeViewModelOutput) {
        switch output {
        case .refreshNowPlaying:
            break
        case .refreshUpComing:
            self.upComingTableView.reloadData()
        case .nowPlayingError(_):
            break
        case .upComingError(_):
            break
        }
    }
}
