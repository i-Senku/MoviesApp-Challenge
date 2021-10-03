//
//  MovieDetailVC.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 2.10.2021.
//

import UIKit
import Kingfisher

final class MovieDetailVC: UIViewController {
    
    
    @IBOutlet weak var detailBodyErrorText: UILabel!
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var detailBodyView: DetailBodyView!
    
    var detailViewModel : MovieDetailViewModelContracts!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        start()
    }
    
    func start(){
        detailViewModel.delegate = self
        if let movie = detailViewModel.movie {
            detailViewModel.loadMovieDetail()
            title = movie.title
            if let url = movie.posterPath?.originalImage(){
                movieImage.kf.setImage(with: url)
            }
        }
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
}

extension MovieDetailVC : MovieDetailViewModelDelegate {
    func handleOutput(output: MovieDetailViewModelOutput) {
        switch output {
        case .movieDetail(detail: let detail):
            detailBodyView.populate(detail)
            detailBodyView.isHidden = false
        case .errorMovieDetail(let error):
            detailBodyErrorText.isHidden = false
            detailBodyErrorText.text = error.statusMessage
        case .indicator(let isAnimate):
            if isAnimate{
                indicator.startAnimating()
            }else{
                indicator.stopAnimating()
            }
        }
    }
}
