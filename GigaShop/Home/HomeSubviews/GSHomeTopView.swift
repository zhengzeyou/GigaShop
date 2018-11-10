//
//  GSHomeTopView.swift
//  GigaShop
//
//  Created by dlwpdlr on 2018/11/10.
//  Copyright © 2018年 GIGA Korea. All rights reserved.
//

import UIKit
//import FSPagerView
//
//var pagerView:FSPagerView!
//var images:NSArray = []

class GSHomeTopView: UIView {
	override init(frame: CGRect) {
		super.init(frame: frame)
		self.backgroundColor = Constant.redColor
		addSuv()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}


extension GSHomeTopView {
	fileprivate func addSuv(){
		
		let search:UIButton = UIButton()
		search.layer.cornerRadius = 18
		search.layer.masksToBounds = true
		search.backgroundColor = UIColor.colorFromHex(hex: 0xc92728)
		self.addSubview(search)
		search.snp.makeConstraints { (make) in
			make.top.equalTo(40)
			make.left.equalTo(15)
			make.right.equalTo(-15)
			make.height.equalTo(36)
		}
		
		let searchIcon:UIImageView = UIImageView(image: UIImage(named: "icon_search")?.withRenderingMode(.alwaysOriginal))
		search.addSubview(searchIcon)
		searchIcon.snp.makeConstraints { (make) in
			make.left.equalTo(20)
			make.centerY.equalToSuperview()
			make.width.height.equalTo(24)
		}
		
		let placher:UILabel = UILabel()
		placher.text = "搜索商品名称"
		placher.textColor = UIColor.colorFromHex(hex: 0xe35d5c)
		search.addSubview(placher)
		placher.snp.makeConstraints { (make) in
			make.left.equalTo(searchIcon.snp.right).offset(10)
			make.centerY.equalToSuperview()
		}
	}

}
