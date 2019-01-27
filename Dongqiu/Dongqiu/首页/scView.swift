//
//  scView.swift
//  test
//
//  Created by 姚智豪 on 2019/1/23.
//  Copyright © 2019年 姚智豪. All rights reserved.
//

import UIKit

enum ScrollShowContentType {
    case ShowImageType
    case ShowTitleType
}

class scView: UIScrollView {
    
    var page = UIPageControl()
    func creatMyScrollView(type:ScrollShowContentType,data:[String],height:CGFloat) {
        self.backgroundColor = UIColor.lightGray
        if type == .ShowTitleType {
            for i in 0...(data.count-1){
                let label = UILabel(frame: CGRect(x: CGFloat(i) * 120, y: 0, width: 120, height: height))
                label.font = UIFont.boldSystemFont(ofSize: 20)
                label.text = data[i]
                self.addSubview(label)
            }
            self.contentSize = CGSize(width: CGFloat(data.count)*120, height: height)
        }
        if type == .ShowImageType {
            for i in 0...(data.count-1){
                let  imageView = UIImageView(frame: CGRect(x: CGFloat(i) * UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: 240))
                imageView.image = UIImage.init(named: data[i])
                self.addSubview(imageView)
                let page = UIPageControl()
                page.frame = CGRect(x: imageView.bounds.size.width - 50, y: imageView.bounds.size.height-30, width: 50, height: 15)
                page.numberOfPages = data.count
                imageView.addSubview(page)
                self.page = page
            }
            self.contentSize = CGSize(width: CGFloat(data.count)*UIScreen.main.bounds.size.width, height: height)
        }
        
        self.bounces = false
        self.isPagingEnabled = true
    }
}

extension scView : UIScrollViewDelegate{
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetX = scrollView.contentOffset.x
        let page = offsetX/scrollView.bounds.size.width
        let pageInt = page+0.5
        self.page.currentPage = Int(pageInt)
    }
}

