//
//  MainPostViewModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

class MainPostViewModel {
    
    var totalPost: Int = 0
    var currentPage: Int = 0
    
    //var post: Observable<[Post]> = Observable([])
    
    var post: Observable<[Post]> = Observable([
        Post(id: 1, user: "                    ", text: "                    ", createdAt: "2020-08-11", updatedAt: "2020-09-10", comments: [Comment(id: 1, comment: "ssㅁㅈㄷㅁㄹㄷㅈd", user: 1, post: 1, createdAt: "2020-08-11", updatedAt: "2020-09-10")]),
        Post(id: 2, user: "s", text: "ss", createdAt: "2020-08-11", updatedAt: "2020-09-10", comments: [Comment(id: 1, comment: "ssd", user: 1, post: 2, createdAt: "2020-08-11", updatedAt: "2020-09-10")])
        ,Post(id: 3, user: "s", text: "ss", createdAt: "2020-08-11", updatedAt: "2020-09-10", comments: [Comment(id: 1, comment: "ssd", user: 1, post: 3, createdAt: "2020-08-11", updatedAt: "2020-09-10")])
        ,Post(id: 4, user: "s", text: "ss", createdAt: "2020-08-11", updatedAt: "2020-09-10", comments: [Comment(id: 1, comment: "ssd", user: 1, post: 4, createdAt: "2020-08-11", updatedAt: "2020-09-10")])
        ,Post(id: 5, user: "s", text: "ss", createdAt: "2020-08-11", updatedAt: "2020-09-10", comments: [Comment(id: 1, comment: "ssd", user: 1, post: 5, createdAt: "2020-08-11", updatedAt: "2020-09-10")])
    ])
    
    private func fetchPost(startPage: Int) {
        APIService.fetchPost(startPage: startPage) { postList, error in
            
        }
    }
    
}
