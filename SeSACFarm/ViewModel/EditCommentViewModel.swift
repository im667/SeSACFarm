//
//  editCommentViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/06.
//

import Foundation

class EditCommentViewModel {

    var commentId: Int?
    var postId: Int?
    var editedComment: String?

    func editComment(completion: @escaping () -> Void) {
        
        guard let commentId = commentId else {
            return
        }
        
        guard let postId = postId else {
            return
        }

        guard let editedComment = editedComment else {
            return
        }

         
        APIService.editComment(commentId: commentId, id:postId, comment: editedComment) { comment, error in
       
            guard comment != nil  else {
                   return
               }
             
               
               completion()
           }
       }
}


