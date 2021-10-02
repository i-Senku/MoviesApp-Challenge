//
//  UpComingTableView.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import UIKit

class UpComingTableView: UITableView {
    
    var homeViewModel : HomeViewModelContracts?
    
    override func awakeFromNib() {
        delegate = self
        dataSource = self
        registerCell(nibName: "UpComingCell", cellId: UpComingCell.cellId)
    }
}

extension UpComingTableView : UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return homeViewModel?.upComingModel?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UpComingCell.cellId) as! UpComingCell
        let movie = homeViewModel?.upComingModel?.results[indexPath.row]
        cell.populate(movie: movie)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("asdsad")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.2
    }
}
