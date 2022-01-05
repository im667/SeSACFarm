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
    
    let floatingButton : UIButton = {
        let floating = UIButton()
        
        floating.clipsToBounds = true
        floating.layer.cornerRadius = 25
        floating.backgroundColor = UIColor(red: 52/255, green: 161/255, blue: 112/255, alpha: 1)
        floating.setImage(UIImage(systemName: "plus"), for: .normal)
        floating.tintColor = .white
        floating.translatesAutoresizingMaskIntoConstraints = false
        
        return floating
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "새싹농장"
    
        
        view.backgroundColor = .white
        
        viewModel.fetchPosts()
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        tableView.register(BoardTableViewCell.self, forCellReuseIdentifier: BoardTableViewCell.identifier)
     
        view.addSubview(floatingButton)
        floatingButton.snp.makeConstraints { make in
            make.bottom.equalToSuperview().offset(-72)
            make.trailing.equalToSuperview().offset(-24)
            make.height.equalTo(50)
            make.width.equalTo(50)
            
        }
        
        floatingButton.addTarget(self, action: #selector(ClickedFloatingButton), for: .touchUpInside)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.fetchPosts()
        
        viewModel.Boards.bind { post in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    @objc func ClickedFloatingButton(){
        
        
        let vc = WritePostViewController()
         
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
}



extension BoardViewController:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowInSection
    }

  
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let data = viewModel.cellForRowAt(at: indexPath)
        print("확인확인",self.viewModel.Boards.value[indexPath.row].id)
        let vc = PostViewController()
        
        vc.viewModel.id = self.viewModel.Boards.value[indexPath.row].id
        vc.viewModel.username.value = data.user.username
        vc.viewModel.commentCount.value = data.comments.count
        vc.viewModel.postDate.value = data.createdAt
        vc.viewModel.postTextView.value = data.text
        
        print("-------------")
        print(data.text)
        print(data.id)
        print(data.user.username)
        
        
        self.navigationController?.pushViewController(vc, animated: true)
        
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
        cell.postTextLabel.text = data.text
        cell.commentLabel.text = data.comments.count == 0 ? "댓글쓰기" : String(data.comments.count)
        
        
        
        
        return cell
    }
    
    
 
}


