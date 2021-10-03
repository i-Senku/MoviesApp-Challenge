//
//  FavoritesLocalDataSource.swift
//  MusicPub
//
//  Created by Ercan Garip on 27.09.2021.
//

import Foundation

protocol FavoritesLocalDataSource {
    func getFavorites() -> [Movie]
    func addFavorite(item : Movie) -> Bool
    func deleteFavorite(item : Movie) -> Bool
    func favoriteIsAvailable(primaryKey : Any) -> Movie?
    func deleteAllFavorites() -> Bool
}
