//
//  EditCommentViewcontroller.swift
//  SeSACFarm
//
//  Created by mac on 2022/01/06.
//

import UIKit


class EditPostViewController: UIViewController {
    
    let mainView = WriteView()
    var viewModel = EditPostsViewModel()
    
    
    
    override func loadView() {
        self.view = mainView
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainView.textView.delegate = self
        navigationItem.title = "게시글 수정"
        
        view.backgroundColor = .white
        self.navigationItem.rightBarButtonItem =
            UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(clickedDoneButton))
      
        
        
        
        self.navigationItem.leftBarButtonItems = [UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(clickedCancelButton))]
        
        viewModel.postText.bind { String in
            self.mainView.textView.text = String
        }
    }
    
   
   
    
    
    @objc func clickedDoneButton(){
        if mainView.textView.text == "" {
            let alert = UIAlertController(title: "Falied", message: "내용을 입력해주세요!", preferredStyle: UIAlertController.Style.alert)
            let noAction = UIAlertAction(title: "다시 작성", style: .cancel)
            alert.addAction(noAction)
            present(alert, animated: false, completion: nil)
            
        } else {
       
            let alert = UIAlertController(title: "Success", message: "게시글 수정완료!", preferredStyle: UIAlertController.Style.alert)
            let okAction = UIAlertAction(title: "확인", style: .default) { action in
                
             
                    self.navigationController?.popViewController(animated: true)
                
                
            }
            
            let noAction = UIAlertAction(title: "다시 작성", style: .cancel)
            
            alert.addAction(okAction)
            alert.addAction(noAction)
            
                self.present(alert, animated: false, completion: nil)
            }
        
        
    }
    
    @objc func clickedCancelButton(){
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension EditPostViewController: UITextViewDelegate {
    
    func textViewDidChange(_ textView: UITextView) {
        viewModel.postText.value = mainView.textView.text
    }
    
}
