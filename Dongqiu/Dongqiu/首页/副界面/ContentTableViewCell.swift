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

    var _icon : UIImageView?
    var _title : UILabel?
    
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
        let icon = UIImageView()
        icon.backgroundColor = UIColor.clear
        self.contentView.addSubview(icon)
        icon.image = UIImage.init(named: "1")
        _icon = icon
        
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 9)
        title.textColor = UIColor.black
        self.contentView.addSubview(title)
        _title = title
        self.setConstaints()
    }
    
    func setConstaints(){
        _icon?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.left.equalTo()(self.contentView)?.offset()(20)
            make.top.equalTo()(self.contentView)?.offset()(20)
            make.size.mas_equalTo()(CGSize(width: 20, height: 20))
        })
        
        _title?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.left.equalTo()(self._icon?.mas_right)?.offset()(20)
            make.top.equalTo()(self._icon?.mas_top)?.offset()(5)
            make.right.equalTo()(self.contentView)?.offset()(-30)
        })
    }
    
}
