//
//  SignModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

// MARK: - SignUp
struct SignData: Codable {
    let jwt: String
    let user: User
}

// MARK: - User
struct User: Codable {
    let id: Int
    let username, email: String
}

