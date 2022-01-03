//
//  BoardViewController.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//

import UIKit
import SnapKit

class BoardViewController: UIViewController {
 
    private var viewModel = BoardViewModel()
   
    
    fileprivate var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPosts(text: UserDefaults.standard.string(forKey: "token")!)
      
       
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(BoardTableViewCell.self, forCellReuseIdentifier: "BoardTableViewCell")
     
        viewModel.posts.bind { post in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
        
    }
    
}



extension BoardViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.identifier, for: indexPath) as? BoardTableViewCell else {
            return UITableViewCell()
        }
        
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.usernameLabel.text = data.user.username
        

        return cell
    }
    
    
}
