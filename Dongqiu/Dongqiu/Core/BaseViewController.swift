//
//  BaseViewController.swift
//  Dongqiu
//
//  Created by YZH on 2019/1/19.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SetUI()
    }

    func SetUI(){
        view.backgroundColor = UIColor.init(red: CGFloat(arc4random()%256)/255.0, green: CGFloat(arc4random()%256)/255.0, blue: CGFloat(arc4random()%256)/255.0, alpha: 1.0)
    }

}
