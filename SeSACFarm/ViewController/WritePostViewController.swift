//
//  BoardWriteViewController.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//

import UIKit

class WritePostViewController : UIViewController {
    
    let mainView = WriteView()
    var viewModel = WritePostViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "글쓰기"
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickedDoneButton))]
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(clickedCancelButton))]
        
        viewModel.writePost.bind { boardElement in
            self.mainView.textView.text = boardElement.text
        }
        
    }
    
    @objc func clickedDoneButton(){
        viewModel.addPost(text: mainView.textView.text) {
          
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func clickedCancelButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
