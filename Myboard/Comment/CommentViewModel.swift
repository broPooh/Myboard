//
//  CommentViewModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

class CommentViewModel {
    
    var comment: Observable<Comment> = Observable(Comment(id: 0, comment: "", user: 0, post: 0, createdAt: "", updatedAt: ""))
    
    func detailComment() {
        APIService.fetchComment()
    }
    
    func updateComment() {
        APIService.updateComment()
    }
    
    func deleteComment() {
        APIService.deleteComment()
    }
}

