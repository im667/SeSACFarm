//
//  BoardViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//

import Foundation

class BoardViewModel {

    var posts: Observable<Result> = Observable(Result())
    
    func fetchPosts(text:String){
        
        APIService.getPosts(text) { response, error in
            guard let response = response else {
                return
            }
            self.posts.value = response
            print(response)
            }
        }

    }



extension BoardViewModel {

    var numberOfRowInSection: Int {
        return posts.value.count
    }

    func cellForRowAt(at indexPath: IndexPath)-> ResultElement {

        return posts.value[indexPath.row]
    }

}
