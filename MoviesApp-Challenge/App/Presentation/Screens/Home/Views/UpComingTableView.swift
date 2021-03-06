//
//  UpComingTableView.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import UIKit

final class UpComingTableView: UITableView {
    
    var homeViewModel : HomeViewModelContracts?
    
    override func awakeFromNib() {
        delegate = self
        dataSource = self
        registerCell(nibName: "UpComingCell", cellId: UpComingCell.cellId)
    }
    
}

extension UpComingTableView : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel?.upComingMovies.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpComingCell.cellId) as! UpComingCell
        let movie = homeViewModel?.upComingMovies[indexPath.row]
        cell.populate(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        homeViewModel?.didSelectUpComing(indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.2
    }
}

extension UpComingTableView : UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let position = scrollView.contentOffset.y
        if position > (contentSize.height - 100) - scrollView.frame.size.height{
            homeViewModel?.loadMoreUpComing()
        }
    }

}
