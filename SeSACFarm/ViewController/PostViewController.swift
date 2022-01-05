//
//  BoardDetailViewController.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//

import UIKit
import SnapKit

class PostViewController : UIViewController {
    
    
var viewModel = DetailViewModel()
var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        print(viewModel.id)
        print(viewModel.postTextView.value)
        view.backgroundColor = .white
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.commentGet {
            self.tableView.reloadData()
        }
        viewModel.Detail.bind { post in
            print("POST:", post)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
}
extension PostViewController:UITableViewDelegate, UITableViewDataSource {
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return viewModel.Detail.value.count
        if section == 0 {
            return 1
        } else {
            return viewModel.numberOfRowsInSection
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
    
        
        cell.usernameLabel.text = viewModel.username.value
        cell.commentCountLabel.text = "\(viewModel.commentCount.value)"
        cell.postDateLabel.text = viewModel.postDate.value
        cell.postTextLabel.text = viewModel.postTextView.value
            
            return cell
        } else {
            
            
            
            let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.identifier, for: indexPath) as! CommentTableViewCell
            
            let row = viewModel.cellForRowAt(indexPath: indexPath)
            
            cell.commentUsernameLabel.text = row.user.username
            cell.commentTextView.text = row.comment
//            cell.commentModifyButton
            
            return cell
        }
        
      
        
    
    }
    
    
    
    
    
}
