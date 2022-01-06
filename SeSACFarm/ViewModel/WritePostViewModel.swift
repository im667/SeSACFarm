//
//  WriteViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/06.
//

import UIKit

class WritePostViewModel {

    
    var writePost: Observable<BoardElement> = Observable(BoardElement(id: 0, text: "", user: User(id: 0, username: "", email: "", provider: .local, confirmed: false, role: 0, createdAt: "", updatedAt: ""), createdAt: "", updatedAt: "", comments: []))
       
       func addPost(text: String, completion: @escaping () -> Void) {
         
           APIService.writePosts(text: text) { boardElement, error in
       
               guard let boardElement = boardElement else {
                   return
               }
               self.writePost.value = boardElement
               
               completion()
           }
       }
}



