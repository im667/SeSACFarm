//
//  EditCommentViewcontroller.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/06.
//

import UIKit


class EditCommentViewController: UIViewController {
    
    let mainView = WriteView()
    var viewModel = EditCommentViewModel()
    
    
    
    override func loadView() {
        self.view = mainView
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.textView.delegate = self
        navigationItem.title = "댓글 수정"
        
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ClickedDoneButton))]
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ClickedCancelButton))]
        
       
        
    }
    
   
    
    @objc func ClickedDoneButton(){

        viewModel.editComment {
            self.navigationController?.popViewController(animated: true)
        }
       
        
    }
    
    @objc func ClickedCancelButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension EditCommentViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel.editedComment = mainView.textView.text
    }
    
}
