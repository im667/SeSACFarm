//
//  PostViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/04.
//

import UIKit

class PostViewModel {

    
    var id:Int = 0
    var username = Observable("")
    var commentCount = Observable(0)
    var postDate = Observable("")
    var postTextView = Observable("")
    
    
    var Detail = Observable(Post())
    
    

    func commentGet(complition: @escaping ()->Void ) {
        print("GETID:",id)
        APIService.getDetail(id: id) { post, error in
            guard let post = post else {
                return
            }
            self.Detail.value = post
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
