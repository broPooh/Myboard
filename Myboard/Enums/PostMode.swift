//
//  PostMode.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

enum PostMode {
    case edit
    case write
    
    func createOrUpdatePost(completion: @escaping () -> Void) {
        switch self {
        case .edit:
            completion()
        case .write:
            completion()
        }
    }
}
