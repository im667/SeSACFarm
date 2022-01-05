//
//  BoardWriteViewController.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/03.
//

import Foundation
import UIKit

class WritePostViewController : UIViewController {
    
    let mainView = WriteView()
    var viewModel = WritePostViewModel()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ClickedDoneButton))]
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(ClickedCancelButton))]
        
        viewModel.writePost.bind { boardElement in
            self.mainView.textView.text = boardElement.text
        }
        
    }
    
    @objc func ClickedDoneButton(){
        viewModel.addPost(text: mainView.textView.text) {
          
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func ClickedCancelButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
}
