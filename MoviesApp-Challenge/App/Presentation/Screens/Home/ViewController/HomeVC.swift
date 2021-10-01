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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    
    fileprivate func start(){
        homeViewModel.loadUpComing()
        homeViewModel.loadNowPlaying()
    }
}
