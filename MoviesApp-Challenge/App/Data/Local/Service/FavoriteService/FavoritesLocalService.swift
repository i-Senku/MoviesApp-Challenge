//
//  FavoritesLocalService.swift
//  MusicPub
//
//  Created by Ercan Garip on 27.09.2021.
//

import Foundation

final class FavoritesLocalService : FavoritesLocalDataSource {
    
    func getFavorites() -> [Movie] {
        return RealmHelper.shared.getList(Movie.self)
    }
    
    func addFavorite(item: Movie) -> Bool {
        do {
            try RealmHelper.shared.add(item)
            return true
        } catch let error {
            print(error)
            return false
        }
    }
    
    func deleteFavorite(item: Movie) -> Bool {
        do {
            try RealmHelper.shared.delete(item)
            return true
        } catch _ {
            return false
        }
    }
    
    func deleteAllFavorites() -> Bool {
        do {
            try RealmHelper.shared.deleteObjectsOfType(type: Movie.self)
            return true
        } catch let error {
            print(error)
            return false
        }
    }
    
    func favoriteIsAvailable(primaryKey : Any) -> Movie? {
        RealmHelper.shared.isAvailableWithPrimaryKey(Movie.self, primaryKey: primaryKey)
    }
    
}
