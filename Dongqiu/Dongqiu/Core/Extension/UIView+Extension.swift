//
//  UIView+Extension.swift
//  Dongqiu
//
//  Created by 姚智豪 on 2019/7/17.
//  Copyright © 2019 YZH. All rights reserved.
//

import Foundation
import UIKit

protocol RegisterCellOrNib {}

extension RegisterCellOrNib{
    
    static var identifier : String{
        return "\(self)"
    }
    
    static var nib:UINib?{
        return UINib(nibName: "\(self)", bundle: nil)
    }
    
}
