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
  var task = BoardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
}
extension PostViewController:UITableViewDelegate, UITableViewDataSource {
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return viewModel.Detail.value.count
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
        
        cell.usernameLabel.text = viewModel.username.value
        cell.commentCountLabel.text = "\(viewModel.commentCount.value)"
        cell.postDateLabel.text = viewModel.postDate.value
        cell.postTextView.text = viewModel.postTextView.value
//       if tableView.numberOfSections == 1 {
//
//           cell.usernameLabel.text = viewModel.username
//
//       }
        
        
        return cell
    }
    
    
    
    
    
}
