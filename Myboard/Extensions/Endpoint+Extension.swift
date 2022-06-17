//
//  Endpoint+Extension.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import Foundation

extension Endpoint {
    var url: URL {
        switch self {
        case .signup: return .makeEndPoint("auth/local/register")
        case .login: return .makeEndPoint("auth/local")
        case .changePassword: return .makeEndPoint("custom/change-password")
        case .post: return .makeEndPoint("posts")
        case .postDetail(id: let id):
            return .makeEndPoint("posts/\(id)")
        case .onePost(id: let id): return .makeEndPoint("posts/\(id)")
        case .getComment(postId: let postId): return .makeEndPoint("comments?post=\(postId)")
        case .comment: return .makeEndPoint("comments")
        case .commentDetail(id: let id): return .makeEndPoint("comments/\(id)")
        }
    }
    
    var urlString: String {
        switch self {
        case .signup: return .makeEndPointString("auth/local/register")
        case .login: return .makeEndPointString("auth/local")
        case .changePassword: return .makeEndPointString("custom/change-password")
        case .post: return .makeEndPointString("posts")
        case .postDetail(id: let id):
            return .makeEndPointString("posts/\(id)")
        case .onePost(id: let id): return .makeEndPointString("posts/\(id)")
        case .getComment(postId: let postId): return .makeEndPointString("comments?post=\(postId)")
        case .comment: return .makeEndPointString("comments")
        case .commentDetail(id: let id): return .makeEndPointString("comments/\(id)")
        }
    }
}
