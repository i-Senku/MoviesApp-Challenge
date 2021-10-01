//
//  TableView+Extension.swift
//  MusicPub
//
//  Created by Ercan Garip on 28.09.2021.
//

import Foundation
import UIKit

extension UITableView{
    func registerCell(nibName : String,cellId : String,bundle : Bundle? = nil) {
        register(UINib(nibName: nibName, bundle: bundle), forCellReuseIdentifier: cellId)
    }
}
