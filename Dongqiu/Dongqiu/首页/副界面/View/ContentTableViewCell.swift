//
//  ContentTableViewCell.swift
//  Dongqiu
//
//  Created by 姚智豪 on 2019/1/29.
//  Copyright © 2019年 YZH. All rights reserved.
//

import UIKit
import Masonry
class ContentTableViewCell: UITableViewCell {

    var _rightImage : UIImageView?
    var _lefttitle : UILabel?
    var _righttitle : UILabel?
    var _SeparatorView : UIView?
    
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
        SetUI()
    }

}

extension ContentTableViewCell{
    func SetUI(){
        let rightImage = UIImageView()
        self.contentView.addSubview(rightImage)
        rightImage.image = UIImage.init(named: "setting_rightarrow_8x14_")
        _rightImage = rightImage
        
        let lefttitle = UILabel()
        lefttitle.font = UIFont.systemFont(ofSize: 9)
        lefttitle.textColor = UIColor.black
        self.contentView.addSubview(lefttitle)
        _lefttitle = lefttitle
        
        let righttitle = UILabel()
        righttitle.font = UIFont.systemFont(ofSize: 17)
        self.contentView.addSubview(righttitle)
        _righttitle = righttitle
        
        let SeparatorView = UIView()
        SeparatorView.backgroundColor = UIColor.black
        self.contentView.addSubview(SeparatorView)
        _SeparatorView = SeparatorView
        
        
        self.setConstaints()
    }
    
    func setConstaints(){
        
        _lefttitle?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.left.equalTo()(self.contentView.mas_left)?.offset()(15)
            make.top.equalTo()(self.contentView)
            make.bottom.equalTo()(self.contentView)
        })
        
        _rightImage?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.right.equalTo()(self.contentView.mas_right)?.offset()(-15)
            make.size.equalTo()(CGSize(width: 8, height: 14))
            make.centerY.equalTo()(self.contentView)
        })
        
        _righttitle?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.right.equalTo()(self._rightImage?.mas_left)!.offset()(-15)
            make.centerY.equalTo()(self.contentView)
        })
        
        _SeparatorView?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.leading.mas_equalTo()(_lefttitle?.mas_leading)
            make.trailing.mas_equalTo()(_rightImage?.mas_leading)?.offset()(-15)
            make.height.mas_equalTo()(1)
            make.bottom.equalTo()(self.contentView)
        })
    }
    
}
