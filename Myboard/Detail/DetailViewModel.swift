//
//  DetailViewModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

class DetailViewModel {
    
    var post: Observable<Post> = Observable(Post(id: 0, user: "sasdf", userId: 0, text: "asdfadsfasefawefawegawrgaergaergawrgawgawgawrgarwargwgrwgrwgrwgrwgrwgrwgrwgrwgrwgrwgrwagrwgrwagrw", createdAt: "2020-20-20", updatedAt: "", comments: [
        Comment(id: 0, comment: "sdfadsfasfadsfasdasf", user: 1, post: 1, createdAt: "", updatedAt: "")
    ]))
    var comment: Observable<[Comment]> = Observable([])
    
    func detailPost() {
        APIService.detailPost()
    }
    
    func updatePost() {
        APIService.updatePost()
    }
    
    func deletePost() {
        APIService.deletePost()
    }
    
    func writeComment() {
        APIService.writeComment()
    }
        
}


extension DetailViewModel {
   
    var numberOfComment: Int {
        return comment.value.count
    }
    
}
