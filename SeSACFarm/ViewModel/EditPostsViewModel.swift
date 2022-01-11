//
//  editBoardsViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/11.
//
import Foundation

class EditPostsViewModel {

    var postId: Int?
    let postText: Observable<String> = Observable("")

    func editPosts(completion: @escaping () -> Void) {
        
        guard let postId = postId else {
            return
        }
        
   
         
        APIService.editPosts(id: postId, text: postText.value) { board, error in
            guard board != nil else {
                return
            }
            completion()
        }
      
       }
    
 
    
    
}



