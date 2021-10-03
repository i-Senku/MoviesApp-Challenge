//
//  SliderCollectionView.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import UIKit

protocol SliderCollectionViewDelegate : AnyObject {
    func currentPage(page : Int)
}

final class SliderCollectionView: UICollectionView {
    
    var homeViewModel : HomeViewModelContracts?
    weak var sliderDelegate : SliderCollectionViewDelegate?
    var timer : Timer?
    var currentPage = 0
    
    override func awakeFromNib() {
        register(UINib(nibName: "SliderCell", bundle: nil), forCellWithReuseIdentifier: SliderCell.cellId)
        delegate = self
        dataSource = self
        startTimer()
    }
    
    private func startTimer(){
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(self.moveToNext), userInfo: nil, repeats: true)
        }
    }
    
    @objc func moveToNext(){
        if let totalPage = homeViewModel?.nowPlayingMovies.count{
            if currentPage < totalPage - 1{
                currentPage += 1
            }else{
                currentPage = 0
            }
            scrollToItem(at: IndexPath(row: currentPage, section: 0), at: .centeredHorizontally, animated: true)
        }
        
    }
}

//MARK: - Data Source
extension SliderCollectionView : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModel?.nowPlayingMovies.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SliderCell.cellId, for: indexPath) as! SliderCell
        cell.backgroundColor = .blue
        let movie = homeViewModel?.nowPlayingMovies[indexPath.row]
        cell.populate(movie: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        homeViewModel?.didSelectNowPlaying(indexPath: indexPath)
    }
}

//MARK: - Layout
extension SliderCollectionView : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        sliderDelegate?.currentPage(page: indexPath.row)
        currentPage = indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}


