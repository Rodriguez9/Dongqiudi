//
//  CollectViewCellTableViewCell.swift
//  Dongqiu
//
//  Created by 姚智豪 on 2019/7/27.
//  Copyright © 2019 YZH. All rights reserved.
//

import UIKit
import Masonry

class CollectViewTableViewCell: UITableViewCell {
    
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame:CGRect(x: 0, y: 0, width: screenWidth*4/5, height: 240), collectionViewLayout: MyConcernFlowLayout())
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: collectID)
        return collectionView
    }()
    
    var myConcerns = [MyConcern](){
        didSet{
           collectionView.reloadData()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(collectionView)
    }

}

class MyConcernFlowLayout: UICollectionViewFlowLayout {
    override func prepare() {
        //每个cell的大小
        itemSize = CGSize(width: 58, height: 74)
        //横向间距
        minimumLineSpacing = 0
        //纵向间距
        minimumInteritemSpacing = 0
        //cell上下左右的间距
        sectionInset = UIEdgeInsetsMake(0, 0, 0, 0)
        //设置水平滚动
        scrollDirection = .vertical
    }
}

extension CollectViewTableViewCell : UICollectionViewDelegate,UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myConcerns.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: collectID, for: indexPath) as! ContentCollectionViewCell
        cell.MyConcern = myConcerns[indexPath.item]
        return cell
    }
    
    
    
}
