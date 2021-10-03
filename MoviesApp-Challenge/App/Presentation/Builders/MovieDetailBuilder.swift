//
//  MovieDetailBuilder.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 3.10.2021.
//

import Foundation

import UIKit

final class MovieDetailBuilder {
    
    static func make(_ viewModel : MovieDetailViewModelContracts) -> MovieDetailVC {
        let storyboard = UIStoryboard(name: AppStoryBoard.movieDetail.rawValue, bundle: nil)
        
        let viewController = storyboard.instantiateViewController(identifier: String(describing: MovieDetailVC.self)) as! MovieDetailVC
        
        viewController.detailViewModel = viewModel
        return viewController
    }
}
