//
//  FavoriteMoviesVC.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 3.10.2021.
//

import UIKit

class FavoriteMoviesVC: UIViewController {

    @IBOutlet weak var favoriteMoviesTableView: FavoriteMoviesTableView!
    
    var viewModel : FavoriteMovieViewModelContracts = FavoriteMovieViewModel(moviesRepository: MoviesRepository(moviesDataService: MoviesService(), moviesLocalDataService: FavoritesLocalService()))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        favoriteMoviesTableView.viewModel = viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.loadFavorites()
    }

}
extension FavoriteMoviesVC : FavoriteMovieViewModelDelegate {
    func handleOutput(output: FavoriteMovieViewModelOutput) {
        switch output {
        case .reloadTableView:
            favoriteMoviesTableView.reloadData()
        case .cleared(let isSuccess):
            if isSuccess {
                showBasicAlert(title: "CLEAR", message: "Favorite Movie Successfully Deleted", actionTitle: "Close")
            }else{
                showBasicAlert(title: "Error", message: "Something went wrong", actionTitle: "Close")
            }
        case .deleted(let isSuccess):
            if isSuccess {
                showBasicAlert(title: "DELETE", message: "Favorite Movie Successfully Deleted", actionTitle: "Close")
            }else{
                showBasicAlert(title: "Error", message: "Something went wrong", actionTitle: "Close")
            }
        }
    }
    
    func route(route: FavoriteMovieViewModelRoute) {
        switch route {
        case .movieDetail(let detailViewModel):
            let vc = MovieDetailBuilder.make(detailViewModel)
            show(vc, sender: nil)
        }
    }
}
