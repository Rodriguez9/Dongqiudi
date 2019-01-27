//
//  TableViewCell.swift
//  test
//
//  Created by 姚智豪 on 2019/1/21.
//  Copyright © 2019年 姚智豪. All rights reserved.
//

import UIKit
import Masonry
class TableViewCell: UITableViewCell {
    
    var _icon : UIImageView?
    var _title : UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        SetUI()
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

}
extension TableViewCell{
    func SetUI(){
        let icon = UIImageView()
        icon.backgroundColor = UIColor.clear
        self.contentView.addSubview(icon)
        icon.image = UIImage.init(named: "1")
        _icon = icon
        
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 9)
        title.textColor = UIColor.black
        title.text = "123456"
        self.contentView.addSubview(title)
        _title = title
        self.setConstaints()
        
    }
    
    func setConstaints(){
        _icon?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.left.equalTo()(self.contentView)?.offset()(20)
            make.top.equalTo()(self.contentView)?.offset()(20)
            make.size.mas_equalTo()(CGSize(width: 60, height: 80))
        })
        
        _title?.mas_makeConstraints({ (make:MASConstraintMaker!) in
            make.left.equalTo()(self._icon?.mas_right)?.offset()(20)
            make.top.equalTo()(self._icon?.mas_top)?.offset()(5)
            make.right.equalTo()(self.contentView)?.offset()(-30)
        })
    }
    
}
