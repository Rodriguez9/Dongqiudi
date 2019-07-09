//
//  ContentViewController.swift
//  Dongqiu
//
//  Created by 姚智豪 on 2019/1/29.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import Masonry

class ContentViewController: BaseViewController {
    static let cellID = "cellID"
    static let collectID = "collectID"
    static let Message = ["我的通知","收藏/历史","系统消息","商城"]
    static let CollectMessage = ["红单会员","大数据锦囊","集卡分500万","我是教练OL","我是教练","懂彩帝"]
    lazy var top: UIView = {
        let top = UIView()
        top.backgroundColor = UIColor.gray
        top.frame = CGRect(x: 0, y: 0, width: WIDTH*4/5, height: HEIGHT/3)
        return top
    }()
    
    lazy var img : UIImageView = {
        let img = UIImageView(frame: CGRect(x: 50, y: 75, width: 100, height: 100))
        img.image = UIImage(named: "1")
        UIGraphicsBeginImageContextWithOptions(img.bounds.size, false, 1.0);
        UIBezierPath.init(roundedRect: img.bounds, cornerRadius: img.bounds.size.width).addClip()
        img.draw(img.bounds)
        img.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return img
    }()
    
    lazy var table:UITableView = {
        let table = UITableView()
        table.rowHeight = HEIGHT/12
        table.frame = CGRect(x: 0, y: HEIGHT/3, width: WIDTH*4/5, height: HEIGHT/3)
        table.backgroundColor = UIColor.red
        table.tableFooterView = UIView(frame: CGRect.zero)
        table.dataSource = self
        table.delegate = self
        table.register(ContentTableViewCell.classForCoder(), forCellReuseIdentifier: ContentViewController.cellID)
        return table
    }()
    
    lazy var layout : UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: (WIDTH*4/5-90)/3, height: HEIGHT/6)
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10)
        return layout
    }()
    
    lazy var collect:UICollectionView = {
        let collect = UICollectionView(frame: CGRect(x: 0, y: HEIGHT*2/3, width: WIDTH*4/5, height: HEIGHT/3), collectionViewLayout: layout)
        collect.backgroundColor = UIColor.green
        collect.scrollsToTop = false
        collect.isPagingEnabled = true
        collect.showsVerticalScrollIndicator = true
        collect.bounces = false
        collect.register(ContentCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: ContentViewController.collectID)
        collect.dataSource = self
        collect.delegate = self
        return collect
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(top)
        top.addSubview(img)
        view.addSubview(table)
        view.addSubview(collect)
    }
}

extension ContentViewController:UITableViewDelegate{
    
}

extension ContentViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ContentViewController.Message.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContentViewController.cellID,for:indexPath) as! ContentTableViewCell
        cell._lefttitle?.text = ContentViewController.Message[indexPath.row];
        return cell
    }
}

extension ContentViewController:UICollectionViewDelegate{
    
}

extension ContentViewController:UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ContentViewController.CollectMessage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentViewController.collectID, for: indexPath) as! ContentCollectionViewCell
        cell.LeftTitle.text = ContentViewController.CollectMessage[indexPath.row]
        return cell
        
    }
    
    
}
