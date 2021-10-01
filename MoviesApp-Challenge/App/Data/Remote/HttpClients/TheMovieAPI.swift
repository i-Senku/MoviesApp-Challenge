//
//  TheMovieAPI.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation


enum TheMovieAPI : BaseClientGenerator {
    
    case nowPlaying
    case upComing
    
    var scheme: String { "https" }
    
    var host: String { "api.themoviedb.org" }
    
    var path: String {
        switch self {
        case .nowPlaying:
            return "/3/movie/now_playing"
        case .upComing:
            return "/3/movie/upcoming"
        }
    }
    
    var queryItems: [URLQueryItem]?{
        return nil
    }
    
    var method: HttpMethod{
        switch self {
        default:
            //MARK: - Default
            return .get
        }
    }
    
    var header: [HttpHeader]? {
        return [
            .contentType(),
            .bearerToken(token: AppConstants.bearerToken)
        ]
    }
    
    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
}
