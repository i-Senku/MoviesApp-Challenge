//
//  TheMovieError.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation

struct TheMovieError : Error,Decodable{
    
    let statusCode : Int?
    let statusMessage : String?
    let success : Bool?
    
    enum CodingsKey : String,CodingKey {
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case success = "success"
    }
}
