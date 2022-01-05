//
//  BoardViewModel.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//

import UIKit

class BoardViewModel {

    var Boards: Observable<Board> = Observable(Board())
    
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
            
            self.Boards.value = response
            print("RESPONSE:",response)
            }
        }

    }



extension BoardViewModel {

    var numberOfRowInSection: Int {
        return Boards.value.count
    }

    func cellForRowAt(at indexPath: IndexPath)-> BoardElement {

        return Boards.value[indexPath.row]
    }

}
