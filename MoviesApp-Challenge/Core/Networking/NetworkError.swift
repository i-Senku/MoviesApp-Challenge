//
//  NetworkError.swift
//  MVVM_test
//
//  Created by Ercan Garip on 13.09.2021.
//

import Foundation

enum NetworkError : Error, LocalizedError{ 
    case invalidURL
    case request(statusCode : Int,data : Data?)
    case badRequest
    case decodeError
    case noInternet
    case noResponse
    case responseConvert
    case noData
}
