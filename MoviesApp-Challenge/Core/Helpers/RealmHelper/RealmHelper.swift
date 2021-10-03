//
//  RealmHelper.swift
//  MusicPub
//
//  Created by Ercan Garip on 26.09.2021.
//

import Foundation
import RealmSwift

final class RealmHelper {
    static var shared  = RealmHelper()
    private var realm : Realm!
    
    init() {
        try! realm = Realm()
    }
    
    func getList<T : Object>(_ type : T.Type) -> Array<T>{
        let objects = realm.objects(T.self)
        return Array(objects)
    }
    
    func add(_ item : Object,update : Realm.UpdatePolicy? = nil) throws{
        return try realm.write{
            realm.add(item, update: update ?? .modified)
        }
    }
    
    func deleteAll() throws{
        return try realm.write {
            realm.deleteAll()
        }
    }
    
    func delete(_ item : Object) throws {
        return try realm.write {
            realm.delete(item)
        }
    }
    
    func deleteObjectsOfType(type : Object.Type) throws{
        let objects = realm.objects(type.self)
        if !objects.isInvalidated {
            return try realm.write{
                realm.delete(objects)
            }
        }
    }
    
    func isAvailableWithPrimaryKey<T : Object>(_ type : T.Type, primaryKey : Any) -> T?{
        return realm.object(ofType: type, forPrimaryKey: primaryKey)
    }
}
