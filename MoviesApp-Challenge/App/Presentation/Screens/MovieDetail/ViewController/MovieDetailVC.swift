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
        }
    }
    
    @IBAction func back(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func showMenu(_ sender: Any) {
        let alertVC = UIAlertController(title: "Menu", message: nil, preferredStyle: .actionSheet)
        
        let showAction = UIAlertAction(title: "Show in IMDB", style: .default) {[weak self]  _ in
            guard let self = self else {return}
            self.detailViewModel.showIMDB()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")
        
        alertVC.addAction(cancelAction)
        alertVC.addAction(showAction)
        present(alertVC, animated: true, completion: nil)
    }
    
}

extension MovieDetailVC : MovieDetailViewModelDelegate {
    func handleOutput(output: MovieDetailViewModelOutput) {
        switch output {
        case .movieDetail(detail: let detail):
            detailBodyView.populate(detail)
            if let url = detail.posterPath.originalImage(){
                movieImage.kf.setImage(with: url)
            }
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
    
    func navigate(to route: MovieDetailViewModelRoute) {
        switch route {
        case .imdb(let url):
            UIApplication.shared.open(url)
        }
    }
}
