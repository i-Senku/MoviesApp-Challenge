//
//  TheMovieAPI.swift
//  MoviesApp-Challenge
//
//  Created by Ercan Garip on 1.10.2021.
//

import Foundation


enum TheMovieAPI : BaseClientGenerator {
    
    case nowPlaying(language : String = "en-US",page : Int)
    case upComing(language : String = "en-US",page : Int)
    
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
        switch self {
        case .nowPlaying(let language, let page),.upComing(let language, let page):
            return [
                URLQueryItem(name: "language", value: language),
                URLQueryItem(name: "page", value: String(page)),
            ]

        }
    }
    
    //MARK: - Default GET
    var method: HttpMethod{
        switch self {
        default:
            return .get
        }
    }
    
    var header: [HttpHeader]? {
        return [
            .contentType(),
            .bearerToken(token: AppConstants.bearerToken)
        ]
    }
    
    //MARK: - Default Nil
    var body: [String : Any]? {
        switch self {
        default:
            return nil
        }
    }
}
