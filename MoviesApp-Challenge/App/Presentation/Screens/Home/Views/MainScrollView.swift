//
//  MainScrollView.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 3.10.2021.
//

import Foundation
import UIKit

final class MainScrollView : UIScrollView {
    
    private var myRefreshController : UIRefreshControl = {
       let controller = UIRefreshControl()
        controller.addTarget(self, action: #selector(pullToRefresh(sender:)), for: .valueChanged)
        return controller
    }()
    
    var homeViewModel : HomeViewModelContracts?
    
    override func awakeFromNib() {
        refreshControl = myRefreshController
    }
    
    @objc private func pullToRefresh(sender : UIRefreshControl){
        homeViewModel?.refresh()
    }
}
