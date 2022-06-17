//
//  WritePostViewController.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit
import Toast

class WritePostViewController: BaseViewController {
    
    var mode: PostMode?
    let writePostView = WritePostView()
    let viewModel = WritePostModel()
    
    override func loadView() {
        super.loadView()
        self.view = writePostView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        super.configure()
        view.backgroundColor = .systemBackground
        navigationConfig()
    }
    
    func navigationConfig() {
        title = mode == PostMode.write ? "새싹농장 글쓰기" : "수정하기"
        navigationController?.navigationBar.barStyle = .default
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(didEndEditing))
        if mode == .write {
            navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(dismissView))
        }
        
    }
        
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didEndEditing() {
        switch mode {
        case .write: writePost()
        case .edit: updatePost()
        default : print("default")
        }
    }
    
    func writePost() {
        viewModel.writePost { error in
            guard let error = error else {
                return
            }
        }
    }
    
    func updatePost() {
        viewModel.updatePost { error in
            guard let error = error else {
                return
            }
        }
    }
    
    
}
