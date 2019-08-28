//
//  PostController.swift
//  Continuum
//
//  Created by Michael Moore on 8/27/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation
import UIKit

class PostController {
    
    static let shared = PostController()
    
    var posts: [Post] = []
    
    func addCommentTo(post: Post, text: String, completion: @escaping (Comment) -> Void) {
        let newComment = Comment(text: text, post: post)
        post.comments.append(newComment)
    }
    
    func createPostWith(photo: UIImage, caption: String, completion: @escaping (Post?) -> Void) {
        let newPost = Post(caption: caption, photo: photo)
        posts.append(newPost)
    }
    
    
}
