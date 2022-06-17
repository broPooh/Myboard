//
//  Endpoint.swift
//  Myboard
//
//  Created by bro on 2022/06/11.
//

import Foundation

enum Method: String {
    case GET
    case PUT
    case POST
    case DELETE
}

enum Endpoint {
    case signup
    case login
    case changePassword
    case post
    case postDetail(id: Int)
    case onePost(id: Int)
    case getComment(postId: Int)
    case comment
    case commentDetail(id: Int)
}

enum ErrorMessage: String {
    case invalidToken = "Invalid token."
}

struct ErrorBody: Codable {
    let statusCode: Int
    let error, message: String
}
