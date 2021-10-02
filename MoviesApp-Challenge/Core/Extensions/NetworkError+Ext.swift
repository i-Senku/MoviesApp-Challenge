//
//  NetworkError+Ext.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

extension NetworkError{
    
    func toTheMovieError() -> TheMovieError{
        switch self {
        case .request(let statusCode, let data):
            do {
                guard let data = data else {return differentMovieError(statusCode: statusCode, message: "No Data")}
                let movieError = try JSONDecoder().decode(TheMovieError.self, from: data)
                return movieError
            } catch {
                do {
                let listError = try JSONDecoder().decode(TheMovieListError.self, from: data!)
                    return differentMovieError(statusCode: statusCode, message: listError.errors.first ?? "Error")
                } catch {
                    return differentMovieError(statusCode: statusCode, message: "Something went wrong")
                }
            }
        default :
            return differentMovieError(statusCode: 0, message: "Something went wrong")
        }
    }
    
    fileprivate func differentMovieError(statusCode : Int,message : String) -> TheMovieError{
        return TheMovieError(statusCode: statusCode, statusMessage: message, success: false)
    }
}
