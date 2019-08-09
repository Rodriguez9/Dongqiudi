//
//  ContentCollectionViewCell.swift
//  Dongqiu
//
//  Created by 姚智豪 on 2019/1/29.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import Masonry
import Kingfisher

class ContentCollectionViewCell: UICollectionViewCell {
    lazy var igv : UIImageView = {
        let igv = UIImageView()
        //igv.image = UIImage.init(named: "1")
        return igv
    }()
    
    lazy var BottomTitle : UILabel = {
        let title = UILabel()
        return title
    }()
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        self.addSubview(igv)
        self.addSubview(BottomTitle)
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI(){
        igv.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.leading.equalTo()(self.contentView)?.offset()(20)
            make.top.equalTo()(self.contentView)?.offset()(20)
           make.size.equalTo()(CGSize(width: 60, height: 60))
        }
        BottomTitle.mas_makeConstraints { (make:MASConstraintMaker!) in
            make.top.equalTo()(self.igv.mas_bottom)?.offset()(3)
            make.centerX.equalTo()(self.igv)
        }
    }
    
    var MyConcern : MyConcern?{
        didSet{
            igv.kf.setImage(with: URL(string: (MyConcern?.icon)!))
            BottomTitle.text = MyConcern?.name
        }
    }
    
    
}
