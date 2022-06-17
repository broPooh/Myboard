//
//  DetailViewModel.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

class DetailViewModel {
    
    var post: Observable<Post> = Observable(Post(id: 0, user: "s", userId: 0, text: "", createdAt: "", updatedAt: "", comments: []))
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
