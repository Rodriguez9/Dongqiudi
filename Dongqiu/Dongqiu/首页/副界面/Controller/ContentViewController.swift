//
//  ContentViewController.swift
//  Dongqiu
//
//  Created by 姚智豪 on 2019/1/29.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import Masonry

class ContentViewController: UITableViewController {
  
    var sections = [[MyCellModel]]()
    var concern = [MyConcern]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.register(ContentTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(CollectViewTableViewCell.self, forCellReuseIdentifier: collectTableID)
        //獲取cell的數據
        NetworkTool.loadMyCellData { (sections) in
            let string = "{\"text\":\"我的关注\",\"grey_text\":\"\"}"
            let myConcern = MyCellModel.deserialize(from: string)
            var myConcerns = [MyCellModel]()
            myConcerns.append(myConcern!)
            self.sections.append(myConcerns)
            self.sections += sections
            self.tableView.reloadData()
        }
        NetworkTool.loadMyConcern { (concern) in
            self.concern = concern
        }
    }
}

//UITableViewDelegate
extension ContentViewController{
    
    ////每组头部的高度
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 1 ? 0 : 10
    }
    
    //返回行高
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == sections.count - 1 && indexPath.row == 1 {
            return 240
        }
        return 40
    }
    
    //返回tableview的view，每组头部的视图
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 10))
        view.backgroundColor = UIColor.blue
        return view
    }
    
      //组数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
}

//UITableViewDataSource
extension ContentViewController{
    
    //每组的行数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return sections[section].count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        if indexPath.section == sections.count - 1 && indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier:collectTableID, for: indexPath) as! CollectViewTableViewCell
//            let section = sections[indexPath.section]
//            if concern.count > 1{
                cell.myConcerns = concern
           // }
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)  as! ContentTableViewCell
        let section = sections[indexPath.section]
        let myCellModel = section[indexPath.row]
        cell._lefttitle?.text = myCellModel.text
        cell._righttitle?.text = myCellModel.grey_text
        return cell
    }
}

//extension ContentViewController:UICollectionViewDelegate{
//
//}

//extension ContentViewController:UICollectionViewDataSource{
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return ContentViewController.CollectMessage.count
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ContentViewController.collectID, for: indexPath) as! ContentCollectionViewCell
//        cell.BottomTitle.text = ContentViewController.CollectMessage[indexPath.row]
//        return cell
//
//    }
//}
