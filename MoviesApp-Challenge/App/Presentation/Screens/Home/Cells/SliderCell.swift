//
//  SliderCell.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 2.10.2021.
//

import UIKit
import Kingfisher



class SliderCell: UICollectionViewCell {
    static let cellId = "sliderCollections"
    
    @IBOutlet weak var overview: UILabel!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var poster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func populate(movie : Movie?){
        if let thumbnailURL = movie?.backdrop_path?.backDropImage(){
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
    }

}
