//
//  UpComingCell.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import UIKit
import Kingfisher

class UpComingCell: UITableViewCell {
    static var cellId = "upComingCell"
    
    @IBOutlet weak var releaseDate: UILabel!
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var poster: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(movie : Movie?){
        if let thumbnailURL = movie?.posterPath?.toPoster(){
            DispatchQueue.main.async {
                self.poster.kf.setImage(with: thumbnailURL,options: [
                    .processor(DownsamplingImageProcessor(size: CGSize(width: self.poster.bounds.width, height: self.poster.bounds.height))),
                    .scaleFactor(UIScreen.main.scale),
                    .cacheOriginalImage
                ])
            }
        }
        title.text = movie?.title
        overview.text = movie?.overview
        releaseDate.text = movie?.releaseDate
    }
}
