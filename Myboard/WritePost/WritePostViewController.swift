//
//  WritePostViewController.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit

class WritePostViewController: BaseViewController {
    
    
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
        title = "새싹농장 글쓰기"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(didEndEditing))
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "xmark"), style: .done, target: self, action: #selector(dismissView))
    }
        
    @objc func dismissView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func didEndEditing() {
        viewModel.writePost { error in
            guard let error = error else {
                return
            }
        }
    }
    
    
}
