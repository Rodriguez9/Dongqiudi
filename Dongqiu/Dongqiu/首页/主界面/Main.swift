//
//  Main.swift
//  Dongqiu
//
//  Created by YZH on 2019/1/28.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import Masonry

class Main: UIViewController {
    
    static let iamgeNames = ["App公测","简书出版","简书官方专题","简书月刊","简书出版","简书官方专题"]
    static let imageNames = ["h1.jpg","h2.jpg","h3.jpg"]
    static let cellID : String = "cellID"
    
    var tab : UITableView?
    var _scroll : scView?
    var _imgscroll : scView?
    
    lazy var table : UITableView = {
        let table = UITableView()
        table.backgroundColor = UIColor.red
        table.rowHeight = 120
        table.tableFooterView = UIView(frame: CGRect.zero)
        table.dataSource = self
        table.delegate = self
        table.register(TableViewCell.classForCoder(), forCellReuseIdentifier: Main.cellID)
        view.addSubview(table)
        return table
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        let scroll = scView()
        let imgscroll = scView()
        
        tab = table
        _scroll = scroll
        _imgscroll = imgscroll
        
        scroll.creatMyScrollView(type: .ShowTitleType, data: Main.iamgeNames, height: 60)
        imgscroll.creatMyScrollView(type: .ShowImageType, data: Main.imageNames, height: 240)

        imgscroll.frame =   CGRect(x: 0, y: 60, width: screenWidth, height: 240)
        
        view.addSubview(_scroll!)
        view.addSubview(_imgscroll!)

        tab?.tableHeaderView = _imgscroll

        SetUI()
        createTimer()
    }
    
    func SetUI(){
        _scroll?.mas_makeConstraints({ (make:MASConstraintMaker?) in
            make?.top.mas_equalTo()(self.view)?.offset()(60)
            make?.size.mas_equalTo()(CGSize(width: view.bounds.size.width, height: 60))
            make?.left.mas_equalTo()(self.view)
        })
        
        tab?.mas_makeConstraints({ (make:MASConstraintMaker?) in
            make?.top.equalTo()(_scroll?.mas_bottom)?.offset()(0)
            make?.size.mas_equalTo()(CGSize(width: view.bounds.size.width, height: view.bounds.size.height))
            make?.left.mas_equalTo()(self.view)
        })
        
        
    }
    
    func createTimer(){
        let timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(self.timerManager), userInfo: nil, repeats: true)
        RunLoop.current.add(timer, forMode: RunLoopMode.commonModes)
    }
    
    @objc func timerManager(){
        _imgscroll?.setContentOffset(CGPoint(x: (_imgscroll?.contentOffset.x)! + screenWidth, y: 0), animated: true)
        if _imgscroll?.contentOffset.x == CGFloat(screenWidth) * CGFloat(Main.imageNames.count-1){
            _imgscroll?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
        }
    }
    
}

extension Main:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Main.cellID, for: indexPath) as! TableViewCell
        return cell
    }
    
    
}

extension Main:UITableViewDelegate{
    
}

