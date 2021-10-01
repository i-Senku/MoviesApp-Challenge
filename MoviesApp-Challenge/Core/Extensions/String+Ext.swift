//
//  String+Ext.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

extension String {
    func toPoster() -> URL?{
        return URL(string: "https://image.tmdb.org/t/p/w185/\(self)")
    }
}
