//
//  FavoriteMoviesTableView.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 3.10.2021.
//

import UIKit

final class FavoriteMoviesTableView: UITableView {

    var viewModel : FavoriteMovieViewModelContracts?
    override func awakeFromNib() {
        registerCell(nibName: "UpComingCell", cellId: UpComingCell.cellId)
        delegate = self
        dataSource = self
    }

}

extension FavoriteMoviesTableView : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = viewModel?.movieList.count {
            if count == 0 {
                tableView.setEmptyView(title: "Empty", message: "No movies have been added to favorites yet")
            }else{
                tableView.restore()
            }
            return count
            
        }else{
            tableView.setEmptyView(title: "Empty", message: "No movies have been added to favorites yet")
            return 0
        }
}
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpComingCell.cellId) as! UpComingCell
        let movie = viewModel?.movieList[indexPath.row]
        cell.populate(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .destructive, title: "Delete") { [weak self] action, view, swipe in
            guard let self = self else {return}
            self.viewModel?.deleteFavorite(indexPath: indexPath)
            swipe(true)
        }
        let swipe = UISwipeActionsConfiguration(actions: [action])
        
        return swipe
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.didSelectItem(indexPath)
    }
}
