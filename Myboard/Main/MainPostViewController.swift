//
//  MainViewController.swift
//  Myboard
//
//  Created by bro on 2022/06/17.
//

import UIKit

class MainPostViewController: BaseViewController {
    
    let postView = MainPostView()
    let viewModel = MainPostViewModel()
    
    
    override func loadView() {
        super.loadView()
        self.view = postView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    override func configure() {
        super.configure()
        navigationConfig()
        tableViewConfig()
        targetConfig()
    }
    
    func bind() {
        viewModel.post.bind { posts in
            self.postView.postTableView.reloadData()
        }
    }
    
    func targetConfig() {
        postView.floatingButton.addTarget(self, action: #selector(floatingButtonClicked), for: .touchUpInside)
    }
    
    @objc func floatingButtonClicked() {
        let nav = UINavigationController(rootViewController: WritePostViewController())
        navigator?.changeTo(viewController: nav)
    }
    
    private func navigationConfig() {
        title = "새싹농장"
        let appearance = UINavigationBarAppearance()
        
        let navBar = self.navigationController?.navigationBar
        navBar?.prefersLargeTitles = true
        
        navBar?.standardAppearance = appearance
        navBar?.scrollEdgeAppearance = appearance
        navBar?.compactAppearance = appearance
        navBar?.compactScrollEdgeAppearance = appearance
    }
    
    private func tableViewConfig() {
        postView.postTableView.delegate = self
        postView.postTableView.dataSource = self
    }
    
}

extension MainPostViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.post.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let data = viewModel.post.value[indexPath.row]
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostViewCell.reuseIdentifier) as? PostViewCell else { return UITableViewCell() }
        cell.bind(post: data)
        return cell
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}