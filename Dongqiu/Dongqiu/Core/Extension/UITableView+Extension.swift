//
//  UITableView+Extension.swift
//  Dongqiu
//
//  Created by 姚智豪 on 2019/7/17.
//  Copyright © 2019 YZH. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    
    //註冊cell的方法
    func ym_regiserCell<T:UITableViewCell>(cell:T.Type) where T : RegisterCellOrNib{
        if let nib = T.nib {
            register(nib, forCellReuseIdentifier: T.identifier)
        }else{
            register(cell, forCellReuseIdentifier: T.identifier)
        }
    }
    
    func ym_dequeueReusableCell<T:UITableViewCell>(indexPath:IndexPath) -> T where T: RegisterCellOrNib{
        return dequeueReusableCell(withIdentifier: T.identifier,for: indexPath) as! T
    }
    
}
