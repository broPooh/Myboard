//
//  UITableViewCell+Extension.swift
//  Myboard
//
//  Created by bro on 2022/06/11.
//

import UIKit

extension UITableViewCell: Reusable {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
