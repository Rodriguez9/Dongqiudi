//
//  SLiderMenuViewController.swift
//  Dongqiu
//
//  Created by 姚智豪 on 2019/1/29.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit

class SLiderMenuViewController: UIViewController {

    var mainContainer: UIView?
    var contantContainer:UIView?
    
    var folder:Bool?
    var originalPoint:CGPoint?
    var scaleFactor:CGFloat?
    var offsetX:CGFloat?
    
    func originalX() -> CGFloat {
        return folder! ? 0 : offsetX!
    }

    var deltaScaleFactor:CGFloat?
    var deltaAlphaFactor:CGFloat?
    var miniumOffestX:CGFloat?
    
    lazy var pan : UIPanGestureRecognizer = {
        let pan = UIPanGestureRecognizer()
        return pan;
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.clear
        initParams()
        mainContainer = addChildViewController(viewController: "ContentViewController", isNavViewController: true)
//        contantContainer = addChildViewController(viewController: "ContentViewController", isNavViewController: false)
//        contantContainer?.frame = CGRect(x: -self.view.bounds.size.width*4/5, y: 0, width: self.view.bounds.size.width*4/5, height: self.view.bounds.size.height)
//        let pan = UIPanGestureRecognizer()
//        pan.addTarget(self, action: #selector(panned(sender:)))
//        self.view.addGestureRecognizer(pan)
    }
    
    func addChildViewController(viewController: String,isNavViewController:Bool) -> UIView{
        let nameSpace = Bundle.main.infoDictionary?["CFBundleExecutable"] as! String
        let cls : AnyClass = NSClassFromString(nameSpace + "." + viewController)!
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        if isNavViewController {
            let nav = NavViewController(rootViewController: vc)
            self.addChildViewController(nav)
            self.view.addSubview(nav.view)
            return nav.view
        }else{
            self.addChildViewController(vc)
            self.view.addSubview(vc.view)
            return vc.view
        }
    }
    
    func initParams(){
        //默认折叠
        folder = true;
        //
        scaleFactor=0.95;
        //最终偏移量
        offsetX = self.view.frame.size.width*4/5;
        //滑动透明度的变化
        deltaAlphaFactor=1/offsetX!;
        //最小滑动偏移量
        miniumOffestX=offsetX!/2;
        deltaScaleFactor=(1-scaleFactor!)/offsetX!;
    }

    func switchController(){
        folder = !folder!
        if folder!{
            self.showContantViewController()
        }
        else{
            self.showMainViewController()
        }
    }
    
    func showContantViewController(){
        let transform = CGAffineTransform.init(translationX: offsetX!, y: 0)
        UIView.animate(withDuration: 0.35) {
            self.mainContainer?.alpha = 0.5
            self.contantContainer?.transform = transform
        }
    }
    
    func showMainViewController(){
        UIView.animate(withDuration: 0.35) {
            self.mainContainer?.alpha = 1
            self.contantContainer?.transform = CGAffineTransform.identity
        }
    }

    @objc func panned(sender:UIPanGestureRecognizer){
        let point = sender.location(in: self.view)
        switch sender.state {
        case UIGestureRecognizerState.began:
            originalPoint = point
            break
        case .changed:
            var tx = point.x - originalPoint!.x + self.originalX()
            tx = tx < 0 ? 0 : tx
            
            tx = Float(tx) < Float(offsetX!) ? tx : offsetX!
            let transform = CGAffineTransform.init(translationX: tx, y: 0)
            contantContainer?.transform = transform
            break
        case .ended:
            let transform = contantContainer?.transform
            if Float((transform?.tx)!) >= Float(self.miniumOffestX!) {
                self.showContantViewController()
                
            }else{
                self.showMainViewController()
            }
            break
          
        default:
            print("other")
        }
    }
    
   
    
}
