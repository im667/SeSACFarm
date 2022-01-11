//
//  PostViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/04.
//

import UIKit

class PostViewModel {

    
    var id:Int? = 0
    var username = Observable("")
    var commentCount = Observable(0)
    var postDate = Observable("")
    var postTextView = Observable("")
    var email:String = ""
    
    var Detail = Observable(Post())
    
    func deletePosts(postId: Int, completion: @escaping () -> Void) {
        
        APIService.deletePosts(id: id ?? 0) { board, error in
            guard board != nil else {
                return
            }
            completion()
        }
        
    }

    func commentGet(complition: @escaping ()->Void ) {
        print("GETID:",id ?? 0)
        APIService.getDetail(id: id ?? 0) { post, error in
            guard let post = post else {
                return
            }
            self.Detail.value = post
            complition()
        }
    }
    
    func deleteComment(postId: Int, complition: @escaping ()->Void ) {
        
        APIService.deleteComment(commentId: postId) { delete, error in
            guard delete != nil else {
                return
            }
            complition()
        }
    }
}

extension PostViewModel {
    var numberOfRowsInSection: Int {
        return Detail.value.count
    }
    
    func cellForRowAt(indexPath: IndexPath) -> PostElement {
        return Detail.value[indexPath.row]
    }
}
