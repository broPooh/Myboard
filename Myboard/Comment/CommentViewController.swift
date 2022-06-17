//
//  CommentViewController.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit
import SnapKit

class CommentViewController: BaseViewController {
    
    let commentView = CommentView()
    let viewModel = CommentViewModel()
    var commentId: Int?
    
    override func loadView() {
        super.loadView()
        self.view = commentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        super.configure()
        
        navigationConfig()
        bind()
    }
    
    func bind() {
        
        viewModel.detailComment()
                
        viewModel.comment.bind { comment in
            self.commentView.textView.text = comment.comment
        }
    }
    
    func navigationConfig() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(didEndEditing))
    }
    
    @objc private func didEndEditing() {
        self.viewModel.updateComment()
        self.dismiss(animated: true, completion: nil)
    }
    
}
