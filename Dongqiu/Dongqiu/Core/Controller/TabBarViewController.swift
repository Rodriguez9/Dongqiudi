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
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = UIColor(red: 245/255.0, green: 90/255.0, blue: 93/255.0, alpha: 1.0)
        setUpController()
    }
    
    func setUpController(){
        addChildViewController(viewController: SLiderMenuViewController(), title: "首页", imageName: "Tabbar_bookShelf_Highlighted",selectImageNAme: "Tabbar_bookShelf_Highlighted")
        addChildViewController(viewController: Match(), title: "比赛", imageName: "Tabbar_category_Highlighted",selectImageNAme: "Tabbar_category_Highlighted")
       // addChildViewController(Center())
        addChildViewController(viewController: Quanzi(), title: "圈子", imageName: "Tabbar_leaderboard_Highlighted",selectImageNAme: "Tabbar_leaderboard_Highlighted")
        addChildViewController(viewController: DataViewController(), title: "数据", imageName: "Tabbar_more_Highlighted",selectImageNAme: "Tabbar_more_Highlighted")
        setValue(MyTabBar(), forKey: "tabBar")
    }
}

//extension TabBarViewController{
//    func setupCenterButton(){
//        centerButton.setImage(UIImage.init(named: "Tabbar_more_Highlighted"), for: .normal)
//        centerButton.setImage(UIImage.init(named: "Tabbar_more_Highlighted"), for: .highlighted)
//        let btnWidth = tabBar.bounds.size.width/CGFloat((viewControllers?.count)!)-1
//        let rect = CGRect(x: 0, y: 0, width: btnWidth, height: tabBar.bounds.size.height)
//        centerButton.frame = rect.offsetBy(dx: btnWidth*2, dy: 0)
//        tabBar.addSubview(centerButton)
//    }
//}

// MARK:控制器
extension TabBarViewController{
    
    func addChildViewController(viewController:UIViewController,title:String,imageName:String,selectImageNAme:String){
        viewController.title = title
        viewController.tabBarItem.image = UIImage.init(named: imageName)
        viewController.tabBarItem.selectedImage = UIImage.init(named: selectImageNAme)
        //self.tabBar.tintColor = UIColor.green
        let nav = NavViewController(rootViewController: viewController)
        self.addChildViewController(nav)
    }
}
