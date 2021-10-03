//
//  DetailBodyView.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 2.10.2021.
//

import UIKit

final class DetailBodyView: UIView {

    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var totalAverage: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var overview: UILabel!
    
    @IBOutlet weak var imdbBanner: UIImageView!
    
    override func awakeFromNib() {
        loadView()
    }
    
    
    
    func populate(_ movieDetail : MovieDetail){
        title.text = movieDetail.title
        overview.text = movieDetail.overview
        date.text = movieDetail.releaseDate
        totalAverage.text = String(movieDetail.voteAverage)
    }
    
    private func loadView() {
        guard let contentView = loadViewFromNib(nibName: "DetailBodyView") else { return }
        contentView.frame = bounds
        addSubview(contentView)
    }

}
