//
//  BoardViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//

import UIKit

class BoardViewModel {

    var posts: Observable<Result> = Observable(Result())
    
    func fetchPosts(){
        
        APIService.getPosts() { response, error in
            guard let response = response else {
                UserDefaults.standard.removeObject(forKey: "token")
                
                DispatchQueue.main.async {
                guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
             
                 windowScene.windows.first?.rootViewController = UINavigationController(rootViewController: MainViewController())
                 windowScene.windows.first?.makeKeyAndVisible()
             
                         }
                return
            }
            
            self.posts.value = response
            print("RESPONSE:",response)
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
