//
//  Navigator.swift
//  Myboard
//
//  Created by bro on 2022/06/11.
//

import UIKit



struct Navigator {
    private var viewController: UIViewController

    init(vc: UIViewController) {
        self.viewController = vc
    }
    
    func changeTo(viewController targetVC: UIViewController, transitionStyle: TransitionStyle = .present) {
        switch transitionStyle {
        case .push:
            viewController.navigationController?.pushViewController(targetVC, animated: true)
        case .present:
            targetVC.modalPresentationStyle = .fullScreen
            viewController.present(targetVC, animated: true, completion: nil)
        }
    }
        
}
