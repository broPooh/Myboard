//
//  DetailViewController.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit

class DetailViewController: BaseViewController {
 
    let detailView = DetailView()
    let viewModel = DetailViewModel()
    var postId: Int?
    var post: Post?
    
    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func configure() {
        super.configure()
        navigationConfig()
        tableViewConfig()
    }
        
    func navigationConfig() {
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithDefaultBackground()
        print(navigationController)
        self.navigationController?.navigationBar.standardAppearance = navigationAppearance
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    func bind() {
        viewModel.detailPost()
        postConfig()
        
        viewModel.post.bind { post in
            self.detailView.detailHeaderView.nameLabel.text = post.user
            self.detailView.detailHeaderView.commentLabel.text = "댓글 \(self.viewModel.comment.value.count)"
            self.detailView.detailHeaderView.dateLabel.text = post.updatedAt.dateFormat()
            self.detailView.detailHeaderView.textLable.text = post.text
        }
        
        viewModel.comment.bind { comment in
            self.detailView.commentTableView.reloadData()
        }
        
        if viewModel.post.value.userId == UserDefaultManager.userId {
            navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: SystemImage.ellipsis.rawValue), style: .plain, target: self, action: #selector(postUpdate))
        }
    }
    
    func postConfig() {
        detailView.detailHeaderView.textLable.text = post?.text
        detailView.detailHeaderView.nameLabel.text = post?.user
        detailView.detailHeaderView.dateLabel.text = post?.updatedAt
    }
    
    private func tableViewConfig() {
        detailView.commentTableView.delegate = self
        detailView.commentTableView.dataSource = self
    }
    
    @objc func postUpdate() {
        let edit = UIAlertAction(title: "수정", style: .default) { action in
            self.navigator?.changeTo(viewController: CommentViewController())
        }
        let delete = UIAlertAction(title: "삭제", style: .destructive) { action in
            //TODO: 삭제 로직 진행
            self.viewModel.deletePost()
        }
        let cancel = UIAlertAction(title: "취소", style: .cancel, handler: nil)
        
        presentAlert(title: "", message: "", style: .actionSheet, alertActions: edit, delete, cancel)
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.comment.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let commentData = viewModel.comment.value[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CommentTableViewCell.reuseIdentifier, for: indexPath) as? CommentTableViewCell else { return UITableViewCell() }
        
        cell.bind(comment: commentData)

        cell.commentButtonCliked = {
            self.navigator?.changeTo(viewController: CommentViewController(), transitionStyle: .push)
        }
        
        if commentData.user != UserDefaultManager.userId {
            cell.button.isHidden = true
        } else {
            cell.button.isHidden = false
        }
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

extension DetailViewController: UITextViewDelegate {
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == .lightGray {
            textView.text = nil
            textView.textColor = .label
        }
    }
    
    
    func textViewDidEndEditing(_ textView: UITextView) {
        guard let text = textView.text, textView.text != "" else { return }

    }
}
