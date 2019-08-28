//
//  Post.swift
//  Continuum
//
//  Created by Michael Moore on 8/27/19.
//  Copyright © 2019 Michael Moore. All rights reserved.
//

import Foundation
import UIKit

class Post {
    
    var photoData: Data?
    let timestamp: Date
    let caption: String
    var comments: [Comment]
    var photo: UIImage? {
        get {
            guard let photoData = photoData else { return nil }
            return UIImage(data: photoData)
        }
        set {
            photoData = newValue?.jpegData(compressionQuality: 0.5)
        }
    }
    
    init(caption: String, comments: [Comment] = [], timestamp: Date = Date(), photo: UIImage) {
        self.caption = caption
        self.comments = comments
        self.timestamp = timestamp
        self.photo = photo
    }
}

class Comment {
    let text: String
    let timestamp: Date
    weak var post: Post?
    
    init(text: String, timestamp: Date = Date(), post: Post) {
        self.text = text
        self.timestamp = timestamp
        self.post = post
    }
}

extension Comment: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        let textLowercased = text.lowercased()
        let searchTermLowercased = searchTerm.lowercased()
        return textLowercased.contains(searchTermLowercased)
    }
}

extension Post: SearchableRecord {
    func matches(searchTerm: String) -> Bool {
        
        var commentResult: Bool = false
        let searchTermLowercased = searchTerm.lowercased()
        
        for word in comments {
            let wordLowercased = word.text.lowercased()
            commentResult = wordLowercased.contains(searchTermLowercased)
        }
        let captionLowercased = caption.lowercased()
        let captionResult = captionLowercased.contains(searchTermLowercased)
        
        if commentResult == true || captionResult == true {
            return true
        } else {
            return false
        }
    }
}
