//
//  WriteCommentViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/06.
//

import Foundation

class WriteCommentViewModel {

    
    var writeComment: Observable<PostElement>=Observable(PostElement(id: 0, comment: "", user: User(id: 0, username: "", email: "", provider: Provider.local, confirmed: false, role: 0, createdAt: "", updatedAt: ""), post: PostClass(id: 0, text: "", user: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: ""))
       
    func addComment(id:Int, comment: String, completion: @escaping () -> Void) {
         
           APIService.writeComment(id:id, comment: comment){ postElement, error in
       
               guard let postElement = postElement else {
                   return
               }
               self.writeComment.value = postElement
               
               completion()
           }
       }
}


