//
//  PostModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

struct Post: Codable {
    let id: Int
    let user: String
    let text: String
    let createdAt: String
    let updatedAt: String
    var comments: [Comment]
}
