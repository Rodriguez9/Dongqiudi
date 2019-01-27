//
//  TabBarViewController.swift
//  Dongqiu
//
//  Created by YZH on 2019/1/18.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    lazy var centerButton : UIButton = UIButton(type: .custom)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        setupCenterButton()
    }
    
    func setUpController(){
        addChildViewController(viewController: "Main", title: "首页", image: "Tabbar_bookShelf_Highlighted")
        addChildViewController(viewController: "Match", title: "比赛", image: "Tabbar_category_Highlighted")
        addChildViewController(Center())
        addChildViewController(viewController: "Quanzi", title: "圈子", image: "Tabbar_leaderboard_Highlighted")
        addChildViewController(viewController: "DataViewController", title: "数据", image: "Tabbar_more_Highlighted")
    }
}

extension TabBarViewController{
    func setupCenterButton(){
        centerButton.setImage(UIImage.init(named: "Tabbar_more_Highlighted"), for: .normal)
        centerButton.setImage(UIImage.init(named: "Tabbar_more_Highlighted"), for: .highlighted)
        let btnWidth = tabBar.bounds.size.width/CGFloat((viewControllers?.count)!)-1
        let rect = CGRect(x: 0, y: 0, width: btnWidth, height: tabBar.bounds.size.height)
        centerButton.frame = rect.offsetBy(dx: btnWidth*2, dy: 0)
        tabBar.addSubview(centerButton)
    }
}

// MARK:控制器
extension TabBarViewController{
    
    func addChildViewController(viewController:String,title:String,image:String){
        let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
        let cls : AnyClass = NSClassFromString(nameSpace + "." + viewController)!
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        vc.title = title
        vc.tabBarItem.image = UIImage.init(named: image)
        self.tabBar.tintColor = UIColor.green
        let nav = NavViewController(rootViewController: vc)
        self.addChildViewController(nav)
    }
}
