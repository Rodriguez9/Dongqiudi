//
//  ContentCollectionViewCell.swift
//  Dongqiu
//
//  Created by 姚智豪 on 2019/1/29.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import Masonry
class ContentCollectionViewCell: UICollectionViewCell {
    lazy var igv : UIImageView = {
        let igv = UIImageView()
        igv.image = UIImage.init(named: "1")
        return igv
    }()
    
    lazy var title : UILabel = {
        let title = UILabel()
        return title
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.addSubview(igv)
        self.addSubview(title)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        igv.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.left.equalTo()(self.contentView)?.offset()(20)
            make.top.equalTo()(self.contentView)?.offset()(20)
           make.size.equalTo()(CGSize(width: 60, height: 60))
        }
        title.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.top.equalTo()(self.igv.mas_bottom)?.offset()(3)
            make.centerX.equalTo()(self.igv)
        }
    }
    
}
