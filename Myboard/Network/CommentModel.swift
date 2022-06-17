//
//  CommentModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

struct Comment: Codable {
    let id: Int
    let comment: String
    let user: Int
    let post: Int
    let createdAt: String
    let updatedAt: String

}
