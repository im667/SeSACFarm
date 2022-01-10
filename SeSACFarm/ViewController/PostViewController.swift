//
//  BoardDetailViewController.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//

import UIKit
import SnapKit


class PostViewController : UIViewController {
    
    
var viewModel = PostViewModel()
var writeCommentViewModel = WriteCommentViewModel()
    
var tableView = UITableView()
var commentTextBar = UIView()
    
var commentWriteTextView = UITextView()
var commentAddButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 120
        view.backgroundColor = .white

        
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalTo(view.safeAreaLayoutGuide)
            make.trailing.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(52)
        }
        view.addSubview(commentTextBar)
        commentTextBar.backgroundColor = .systemGray6
        commentTextBar.snp.makeConstraints { make in
            make.top.equalTo(tableView.snp.bottom)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
        }
        
        commentTextBar.addSubview(commentWriteTextView)
        commentWriteTextView.backgroundColor = .white
        commentWriteTextView.snp.makeConstraints { make in
            make.top.equalTo(commentTextBar.snp.top).offset(12)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-56)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(12)
        }
        
        commentTextBar.addSubview(commentAddButton)
        commentAddButton.setTitle("전송", for: .normal)
        commentAddButton.setTitleColor(UIColor(red: 52/255, green: 161/255, blue: 112/255, alpha: 1), for: .normal)
        commentAddButton.titleLabel?.font = .systemFont(ofSize: 16, weight: .black)
        
        commentAddButton.snp.makeConstraints { make in
            make.centerY.equalTo(commentWriteTextView)
            make.leading.equalTo(commentWriteTextView.snp.trailing).offset(8)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-8)
            make.width.equalTo(40)
            
        }
        
        commentAddButton.addTarget(self, action: #selector(clickedAddButton), for: .touchUpInside)
        
      
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.register(CommentTableViewCell.self, forCellReuseIdentifier: CommentTableViewCell.identifier)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        viewModel.commentGet {
            self.tableView.reloadData()
        }
        
        
    }


    @objc func clickedAddButton(){
        print("클릭클릭")
        writeCommentViewModel.addComment(id: viewModel.id, comment: commentWriteTextView.text){
            
            self.viewModel.Detail.bind { post in
                        print("POST:", post)
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                    }
        }
    }
    @objc func clickedModifyButton(sender: UIButton) {
        
        let alert = UIAlertController(title: "댓글 관리", message: "댓글을 수정 혹은 삭제 하시겠습니까?", preferredStyle: .alert)
                // 2. UIAlertAction 생성 : 버튼들을 만들어준다
        let edit = UIAlertAction(title: "댓글 수정", style: .default) { action in
                  
            let vc = EditCommentViewController()
                    
                vc.viewModel.commentId = self.viewModel.Detail.value[sender.tag].id
                vc.viewModel.postId = self.viewModel.id
            
                self.navigationController?.pushViewController(vc, animated: true)

                }
                let delete = UIAlertAction(title: "댓글 삭제", style: .default) { action in
                    let commentId = self.viewModel.Detail.value[sender.tag].id
                    self.viewModel.deleteComment(postId: commentId) {
                        let alert = UIAlertController(title: "삭제", message: "댓글을 삭제했습니다.", preferredStyle: .alert)
                        let check = UIAlertAction(title: "확인", style: .default) { action in
                            self.viewModel.commentGet {
                                self.tableView.reloadData()
                            }
                        }
                        alert.addAction(check)
                        self.present(alert, animated: true, completion: nil)
                    }
                }
                    
                
                let cancel = UIAlertAction(title: "취소", style: .destructive)
                
                // 3. 1과 2를 합쳐준다
                // addAction의 순서대로 버튼이 붙는다
                alert.addAction(edit)
                alert.addAction(delete)
                alert.addAction(cancel)
                
                // 4. Present (보여줌) - modal처럼
                present(alert, animated: true, completion: nil)
    
    }
}
extension PostViewController:UITableViewDelegate, UITableViewDataSource {
    
  
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return viewModel.Detail.value.count
        if section == 0 {
            return 1
        } else {
            return viewModel.Detail.value.count
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
            cell.commentLabel.text = self.viewModel.Detail.value[indexPath.row].comment
            cell.commentModifyButton.addTarget(self, action: #selector(clickedModifyButton(sender:)), for: .touchUpInside)
            
            if row.user.id != UserDefaults.standard.integer(forKey: "id") {
                cell.commentModifyButton.isHidden = true
            } else {
                cell.commentModifyButton.isHidden = false
            }
            
            cell.commentModifyButton.tag = indexPath.row
            
            
            return cell
        }
        
    }
    
    
}


