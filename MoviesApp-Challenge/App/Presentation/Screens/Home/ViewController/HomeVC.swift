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
    
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var nowPlayingCollectionView: SliderCollectionView!
    @IBOutlet weak var upComingTableView: UpComingTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    
    fileprivate func start(){
        nowPlayingCollectionView.sliderDelegate = self
        homeViewModel.delegate = self
        upComingTableView.homeViewModel = homeViewModel
        nowPlayingCollectionView.homeViewModel = homeViewModel
        homeViewModel.loadUpComing()
        homeViewModel.loadNowPlaying()
    }
}

//MARK: - HomeViewModel Delegate
extension HomeVC : HomeViewModelDelegate {
    func handleOutput(output: HomeViewModelOutput) {
        switch output {
        case .refreshNowPlaying(let count):
            self.nowPlayingCollectionView.reloadData()
            self.pageController.numberOfPages = count
        case .refreshUpComing:
            self.upComingTableView.reloadData()
        case .nowPlayingError(_):
            break
        case .upComingError(_):
            break
        }
    }
}

//MARK: - SliderCollectionView Delegate

extension HomeVC : SliderCollectionViewDelegate {
    func currentPage(page: Int) {
        pageController.currentPage = page
    }
}
