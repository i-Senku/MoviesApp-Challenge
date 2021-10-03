//
//  HomeVC.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import UIKit

final class HomeVC : UIViewController {
    
    var homeViewModel : HomeViewModelContracts = HomeViewModel(moviesRepository: MoviesRepository(moviesDataService: MoviesService()))
    

    @IBOutlet weak var mainScrollView: MainScrollView!
    @IBOutlet weak var sliderErrorText: UILabel!
    @IBOutlet weak var sliderIndicator: UIActivityIndicatorView!
    @IBOutlet weak var upComingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var nowPlayingCollectionView: SliderCollectionView!
    @IBOutlet weak var upComingTableView: UpComingTableView!
    @IBOutlet weak var upComingErrorText: UILabel!
    var refreshControl : UIRefreshControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }
    
    
    private func start(){
        nowPlayingCollectionView.sliderDelegate = self
        homeViewModel.delegate = self
        
        upComingTableView.homeViewModel = homeViewModel
        nowPlayingCollectionView.homeViewModel = homeViewModel
        mainScrollView.homeViewModel = homeViewModel
        
        homeViewModel.loadUpComing(page: 1)
        homeViewModel.loadNowPlaying()
    }
}

//MARK: - HomeViewModel Delegate
extension HomeVC : HomeViewModelDelegate {
    func handleOutput(output: HomeViewModelOutput) {
        switch output {
        case .reloadSlider(let count):
            self.sliderErrorText.isHidden = true
            self.nowPlayingCollectionView.reloadData()
            self.pageController.numberOfPages = count
            
        case .reloadUpComingTableView:
            self.upComingErrorText.isHidden = true
            self.upComingTableView.reloadData()
            
        case .nowPlayingError(let error):
            self.sliderErrorText.isHidden = false
            self.sliderErrorText.text = error.statusMessage
            
        case .refreshed:
            self.mainScrollView.refreshControl?.endRefreshing()
            
        case .indicatorOfUpComing(let isAnimate):
            if isAnimate {
                self.upComingIndicator.startAnimating()
            }else{
                self.upComingIndicator.stopAnimating()
            }
        case .indicatorOfSlider(let isAnimate):
            if isAnimate {
                self.sliderIndicator.startAnimating()
            }else{
                self.sliderIndicator.stopAnimating()
            }
        case .upComingError(let error):
            self.upComingErrorText.isHidden = false
            self.upComingErrorText.text = error.statusMessage
            
        }
    }
    
    func navigate(navigation: HomeViewModelRoute) {
        switch navigation {
        case .movieDetail(let viewModel):
            let movieDetailVC = MovieDetailBuilder.make(viewModel)
            show(movieDetailVC, sender: true)
        }
    }
}

//MARK: - SliderCollectionView Delegate
extension HomeVC : SliderCollectionViewDelegate {
    func currentPage(page: Int) {
        pageController.currentPage = page
    }
}
