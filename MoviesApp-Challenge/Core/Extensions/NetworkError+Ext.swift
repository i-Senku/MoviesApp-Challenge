//
//  NetworkError+Ext.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

extension NetworkError{
    
    func toTheMovieError() -> TheMovieError?{
        switch self {
        case .request(_, let data):
            do {
                guard let data = data else {return nil}
                let movieError = try JSONDecoder().decode(TheMovieError.self, from: data)
                return movieError
            } catch {
                print("TheMovieError Decode")
                return nil
            }
        default :
            return nil
        }
    }
}
