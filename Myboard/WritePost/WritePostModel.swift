//
//  WritePostModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

class WritePostModel {
        
    func writePost(completion: @escaping (APIError?) -> Void) {
        APIService.writePost()
    }
    
    func updatePost(completion: @escaping (APIError?) -> Void) {
        APIService.updatePost()
    }
}
