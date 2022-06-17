//
//  APIErrorEnum.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

enum APIError: Error {
    case invalidResponse
    case noData
    case failed
    case invalidData
    case tokenExpired
}

enum HTTPMethod: String {
    case GET
    case PUT
    case POST
    case DELETE
}
