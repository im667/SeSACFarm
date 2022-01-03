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
   
    
    private var tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchPosts(text: UserDefaults.standard.string(forKey: "token")!)
      
       
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.register(BoardTableViewCell.self, forCellReuseIdentifier: BoardTableViewCell.identifier)
     
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
       let cell = tableView.dequeueReusableCell(withIdentifier: BoardTableViewCell.identifier, for: indexPath) as! BoardTableViewCell
        
        let data = viewModel.cellForRowAt(at: indexPath)
        cell.usernameLabel.text = " " + data.user.username + " "
        
//        func toDate() -> Date? {
//            let format = DateFormatter()
//            format.locale = Locale(identifier: "ko_KR")
//            format.dateFormat = "MM/dd"
//            format.timeZone = TimeZone(identifier: "UTC")
//            if let dateTo = format.date(from: data.createdAt) {
//                return dateTo
//            } else {
//                return nil
//            }
//        }
//
//        func toStrDate() -> String {
//            let Strformat = DateFormatter()
//            Strformat.locale = Locale(identifier: "ko_KR")
//            Strformat.dateFormat = "MM.dd"
//            return Strformat.string(from: toDate() ?? Date())
//        }
        
        
        
        cell.postDateLabel.text = data.createdAt
        cell.postTextView.text = data.text
        cell.commentLabel.text = data.comments.count == 0 ? "댓글쓰기" : String(data.comments.count)
        
        
        return cell
    }
 
}


